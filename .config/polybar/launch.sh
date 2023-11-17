#!/usr/bin/env sh

killall -q polybar
#while pgrep -x polybar >/dev/null; do sleep 1; done
#polybar main &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload example &
fi

echo "Bar launched..."
