#Using Dockers

This file explains how to prepare an image for the docker container we need to run our experiments.

DOCKERFILE
The Dockerfile is designed to create a Docker image with the necessary dependencies to run the NeMo Toolkit from NVIDIA. Below is a description of what each command does:

- Select Base Image: base image nvcr.io/nvidia/pytorch:23.08-py3, which is a PyTorch image provided by NVIDIA.
- System Update: It updates the system packages using apt-get update.
- Install Audio and WGET Tools: Essential tools for audio processing and file handling, such as sox, libsndfile1, and ffmpeg, are installed using apt-get install. Python libraries like wget, text-unidecode, matplotlib, numpy, scipy, librosa, and inflect are also installed using pip install.
- Install NeMo Toolkit: The Dockerfile uses the ARG BRANCH=main variable to specify the NeMo branch to install (default is "main"). Then, it installs the NeMo Toolkit from its GitHub repository using pip. The #egg=nemo_toolkit[all] at the end specifies the installation of all required dependencies as well (tagged as [all]).
- Install Pynini: The pynini library is installed via pip install pynini. Pynini is used in text processing by NeMo.
- Install CMUDict: Two files related to CMUDict, an English pronunciation dictionary used in natural language processing, are downloaded.
