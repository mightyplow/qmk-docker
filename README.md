# Toolbox Docker Image
This is a docker image with the qmk firmware inside. This image can be used to create a docker container for flashing
a qmk compatible keyboard.

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