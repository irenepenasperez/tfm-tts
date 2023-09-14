#Con tensorflow no funciona. No instala Nemo
#FROM nvcr.io/nvidia/tensorflow:23.05-tf2-py3

FROM nvcr.io/nvidia/pytorch:23.08-py3

RUN apt-get update

#
# Install Audio and WGET tools
RUN apt-get install -y sox libsndfile1 ffmpeg
RUN pip install wget text-unidecode matplotlib>=3.3.2
RUN pip install numpy scipy librosa inflect

# Install NeMO Toolkit directly from git
ARG BRANCH=main
RUN python -m pip install git+https://github.com/NVIDIA/NeMo.git@${BRANCH}\#egg=nemo_toolkit[all]

# Install pynini from git
# RUN wget https://raw.githubusercontent.com/NVIDIA/NeMo/$BRANCH/nemo_text_processing/install_pynini.sh
# RUN bash install_pynini.sh

# Install pynini from pip
RUN pip install pynini


# Install CMUDict
RUN wget https://raw.githubusercontent.com/NVIDIA/NeMo/263a30be71e859cee330e5925332009da3e5efbc/scripts/tts_dataset_files/heteronyms-052722 -qO heteronyms
RUN wget https://raw.githubusercontent.com/NVIDIA/NeMo/263a30be71e859cee330e5925332009da3e5efbc/scripts/tts_dataset_files/cmudict-0.7b_nv22.08 -qO cmudict-0.7b


