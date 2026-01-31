#!/usr/bin/env sh
set -eu

IMAGE_NAME=${IMAGE_NAME:-dockerdos:latest}
DOSBOX_MOUNT=${DOSBOX_MOUNT:-}

set -- --rm -it

if [ -n "${DISPLAY:-}" ] && [ -d /tmp/.X11-unix ]; then
  set -- "$@" -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix
  
  # Mount X11 authority file if it exists for proper authentication
  if [ -n "${XAUTHORITY:-}" ] && [ -f "$XAUTHORITY" ]; then
    set -- "$@" -e XAUTHORITY=/tmp/.Xauthority -v "$XAUTHORITY:/tmp/.Xauthority:ro"
  elif [ -f "$HOME/.Xauthority" ]; then
    set -- "$@" -e XAUTHORITY=/tmp/.Xauthority -v "$HOME/.Xauthority:/tmp/.Xauthority:ro"
  fi
  
  # Mount GPU devices for hardware acceleration if available
  if [ -d /dev/dri ]; then
    set -- "$@" --device /dev/dri
  fi
fi

if [ -n "$DOSBOX_MOUNT" ]; then
  set -- "$@" -v "$DOSBOX_MOUNT:/dos" -w /dos
fi

exec docker run "$@" "$IMAGE_NAME"
