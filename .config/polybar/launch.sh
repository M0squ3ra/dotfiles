#!/usr/bin/env sh

#killall -q polybar
polybar-msg cmd quit
while pgrep -x polybar >/dev/null; do sleep 1; done
#polybar main &
monitors=$(polybar --list-monitors | cut -d" " -f1 | cut -d":" -f1)
for m in $monitors; do
  MONITOR=$m polybar --reload main &
done

echo "Bar launched..."
