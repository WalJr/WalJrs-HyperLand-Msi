#!/usr/bin/env python3
import json
import os
import socket
import subprocess
import threading
import time

HDMI = "HDMI-A-1"
INTERNAL = "eDP-2"

wake = threading.Event()
lock = threading.Lock()


def hyprctl(*args):
    return subprocess.run(
        ["hyprctl", *args], capture_output=True, text=True
    ).stdout


def monitors():
    try:
        return {m["name"]: m for m in json.loads(hyprctl("-j", "monitors", "all"))}
    except (json.JSONDecodeError, KeyError):
        return {}


def apply():
    with lock:
        mons = monitors()
        hdmi = mons.get(HDMI)
        internal = mons.get(INTERNAL)
        if internal is None:
            return
        hdmi_active = hdmi is not None and not hdmi.get("disabled", False)
        internal_disabled = internal.get("disabled", False)
        if hdmi_active and not internal_disabled:
            hyprctl(
                "eval",
                f'hl.monitor({{ output = "{INTERNAL}", disabled = true }})',
            )
        elif not hdmi_active and internal_disabled:
            hyprctl(
                "eval",
                f'hl.monitor({{ output = "{INTERNAL}", mode = "preferred", '
                f'position = "auto", scale = "auto", disabled = false }})',
            )


def worker():
    while True:
        wake.wait()
        wake.clear()
        time.sleep(0.5)
        apply()


def socket_path():
    runtime = os.environ.get("XDG_RUNTIME_DIR") or f"/run/user/{os.getuid()}"
    sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
    candidates = []
    if sig:
        candidates.append(os.path.join(runtime, "hypr", sig, ".socket2.sock"))
    for base in (os.path.join(runtime, "hypr"), "/tmp/hypr"):
        if os.path.isdir(base):
            candidates += [
                os.path.join(base, d, ".socket2.sock") for d in os.listdir(base)
            ]
    for path in candidates:
        if os.path.exists(path):
            return path
    raise FileNotFoundError("Hyprland socket bulunamadi")


def main():
    threading.Thread(target=worker, daemon=True).start()
    apply()
    while True:
        try:
            with socket.socket(socket.AF_UNIX) as sock:
                sock.connect(socket_path())
                wake.set()
                with sock.makefile() as stream:
                    for line in stream:
                        if line.startswith(("monitoradded", "monitorremoved")):
                            wake.set()
        except Exception:
            time.sleep(2)


if __name__ == "__main__":
    main()
