#!/usr/bin/env sh
set -eu

IMAGE_NAME=${IMAGE_NAME:-dockerdos:latest}
DOSBOX_MOUNT=${DOSBOX_MOUNT:-}

set -- --rm -it

if [ -n "${DISPLAY:-}" ] && [ -d /tmp/.X11-unix ]; then
  set -- "$@" -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix
fi

if [ -n "$DOSBOX_MOUNT" ]; then
  set -- "$@" -v "$DOSBOX_MOUNT:/dos" -w /dos
fi

exec docker run "$@" "$IMAGE_NAME"
