#!/bin/bash
WORKINGDIR="home/albert_hernandez/LBG-API"
IMAGE="lbg_api_app:latest"
cd $WORKINGDIR
if [ docker images $IMAGE ]
then
   docker rmi $IMAGE
fi
docker build -t $IMAGE .
docker run -d -p 5000:8080 --name lbg_api_app $IMAGE


