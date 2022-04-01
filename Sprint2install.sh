#! /bin/bash

#make sure you are in the correct directory
cd /home/karen_bailey/project/LBG4-API

#remove docker image from previous run if it still exists
if [ $( docker images | grep lbg-image2 | wc -l ) -gt 0 ]; then
  docker rmi -f lbg-image2
  docker build -t lbg-image2 .
else
   #run the image to build the container
  docker build -t lbg-image2 .
fi

#stop container from previous run if it still exists and removee it, else build the new image

if [ $( docker ps -a | grep lbg-cont2 | wc -l ) -gt 0 ]; then
  docker stop lbg-cont2
  docker rm lbg-cont2
  docker run --name lbg-cont2 -d -e PORT=3276 -p 5000:3276 lbg-image2:latest
else

 #run the image to build the container
  docker run --name lbg-cont2 -d -e PORT=3276 -p 5000:3276 lbg-image2:latest

fi 


