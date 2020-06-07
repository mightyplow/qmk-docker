# QMK Toolbox Docker Image

## Build Image
This creates the Docker Image locally with the name *qmk*.

via docker:
```
docker build -t qmk .
```

via make:
```
make build
```

## Create Container
```
docker run --name qmk qmk
```

## Copy Keymap to Host
```
docker cp -L qmk:/keymap ~
```

## Flash your keyboard
```
docker run --privileged -v ~/keymap:/keymap -v /dev/bus/usb/:/dev/bus/usb qmk qmk flash
```