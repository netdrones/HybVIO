#!/bin/bash

# UI permissions
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
CONTAINER_NAME=hybvio_container
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

xhost +local:root

docker run -it --rm --privileged -d --net=host --ipc=host \
	--gpus=all \
	-e "DISPLAY=$DISPLAY" \
	-e "QT_X11NO_MITSHM=1" \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	-e "XAUTHORITY=$XAUTH" \
	-e ROS_IP=127.0.0.1 \
	--cap-add=SYS_PTRACE \
	--name="$CONTAINER_NAME" \
	ghcr.io/netdrones/hybvio:latest

xhost -local:root
