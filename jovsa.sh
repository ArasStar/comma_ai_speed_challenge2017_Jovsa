#!/bin/bash

#building image
#sudo docker build -t jovsa:v1 --build-arg USER_ID=$(id -u)  --build-arg GROUP_ID=$(id -g) .

echo "runing bash file: "

echo "1-creating docker container - "
containerId=$(sudo docker create -it --gpus all \
		   --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
		   --mount type=bind,source=/home/aras/Desktop/commaAI/jovsa_code/code,target=/code \
  		   --mount type=bind,source=/home/aras/Desktop/commaAI/speed_challenge_2017,target=/speed_challenge_2017 \
		    jovsa:v1) 

echo "containerId:" `echo $containerId | cut -c 1-12` 

echo "2-openning xhost connection "
xhost +local:`sudo docker inspect --format='{{ .Config.Hostname }}' $containerId`

echo "3-starting docker image  "
sudo docker start -ai $containerId

#jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root

echo "4-removing container"
sudo docker rm $containerId

echo "5-closing xhost connection"
xhost -
