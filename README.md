# DockerDOS

Run DOSBox inside a minimal Docker container with an interactive start script.

## Requirements

- Docker
- Linux shell (bash/sh)
- For the GUI: an X11 server (e.g. local desktop session) and `xhost` configured

## Build

```sh
make build
```

## Run interactively

```sh
./run-dosbox.sh
```

Or using make:

```sh
make run
```

### Mount a local folder

```sh
DOSBOX_MOUNT=$HOME/dos ./run-dosbox.sh
```

## Update the image

```sh
make update
```

## Customize

Override the image name if needed:

```sh
IMAGE_NAME=my-dosbox:latest make build
IMAGE_NAME=my-dosbox:latest ./run-dosbox.sh
```

## Notes

- This image installs DOSBox from the Alpine package repo to stay small and easy to update.
- If DOSBox cannot connect to your display, ensure `xhost +local:` (or equivalent) is set.
- Exposing the X11 socket gives containers access to your display; only use it with trusted images.

## Versioning

Override Alpine if you need to pin or update the base image:

```sh
ALPINE_VERSION=3.20 make build
ALPINE_VERSION=3.20 make update
```
