#!/bin/bash

apt update
apt-get install -y sox libsndfile1 ffmpeg

no() {
# COSAS QUE HABRÁ QUE METER EN LA IMAGEN DEL Dockerfile PARA QUE ESTÉ LISTA DE MANO.
ls

export HOROVOD_WITH_TENSORFLOW=1
export HOROVOD_WITH_PYTORCH=1
pip install --force-reinstall horovod
pip install wget text-unidecode "matplotlib>=3.3.2"
pip install mpi4py
pip install pynini
pip install kaggle
#wget https://raw.githubusercontent.com/NVIDIA/NeMo/$BRANCH/nemo_text_processing/install_pynini.sh
#bash install_pynini.sh

pip install torch librosa tqdm wandb

}

## Install NeMo
BRANCH=main
python -m pip install git+https://github.com/NVIDIA/NeMo.git@$BRANCH#egg=nemo_toolkit[all]