#!/usr/bin/env python3
import json
import subprocess

INTERNAL = "eDP-2"


def hyprctl(*args):
    return subprocess.run(["hyprctl", *args], capture_output=True, text=True).stdout


def main():
    mons = {m["name"]: m for m in json.loads(hyprctl("-j", "monitors", "all"))}
    internal = mons.get(INTERNAL)
    if internal is None:
        return
    if internal.get("disabled", False):
        hyprctl(
            "eval",
            f'hl.monitor({{ output = "{INTERNAL}", mode = "preferred", '
            f'position = "auto", scale = "auto", disabled = false }})',
        )
    else:
        hyprctl(
            "eval",
            f'hl.monitor({{ output = "{INTERNAL}", disabled = true }})',
        )


if __name__ == "__main__":
    main()
