#!/usr/bin/env bash
set -euo pipefail

STATE="${XDG_RUNTIME_DIR:-/tmp}/hypr-touchpad-disabled"
TAG=(-h string:x-canonical-private-synchronous:touchpad-toggle)

DEVICE="$(hyprctl devices -j | jq -r '[.mice[].name | select(test("touchpad"; "i"))] | first // empty')"
if [ -z "$DEVICE" ]; then
    notify-send -a "Touchpad" -u critical "Touchpad bulunamadı"
    exit 1
fi

if [ -e "$STATE" ]; then
    hyprctl eval "hl.device({ name = '$DEVICE', enabled = true })" >/dev/null
    rm -f "$STATE"
    notify-send -a "Touchpad" -i input-touchpad "${TAG[@]}" "Touchpad Açıldı" "Aynı kısayolla tekrar kapatabilirsin"
else
    hyprctl eval "hl.device({ name = '$DEVICE', enabled = false })" >/dev/null
    touch "$STATE"
    notify-send -a "Touchpad" -i input-touchpad "${TAG[@]}" "Touchpad Kapatıldı" "Aynı kısayolla tekrar açabilirsin"
fi
