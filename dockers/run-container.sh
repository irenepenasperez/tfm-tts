#!/bin/bash

# NVIDIA HUB TensorFlow Release Notes
# https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/index.html

# Obsolete: We start from a locally built image now
# First, we pull the image from the repository
#docker pull nvcr.io/nvidia/tensorflow:23.05-tf2-py3
#docker pull nvcr.io/nvidia/pytorch:23.06-py3
#Now, we have a local image, commit(ed) from the newest one plus a Dockerfile

# Then, we run the image, connecting volumes
docker container stop irene-nvcr-pt-nemo
docker container rm irene-nvcr-pt-nemo

docker  run --gpus all -d -it --restart always --name irene-nvcr-pt-nemo	\
        -v ${HOME}:/home/irene					\
        -e NB_UID=10200 -e NB_GID=10100 --user root			\
        irene/nvcr-pt-nemo
