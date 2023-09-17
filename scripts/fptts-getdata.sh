#!/bin/bash


MIHOME=/home/irene

here=$(pwd)

# 0. Creamos la estructura de directorios
TTSHOME=tfm-tts
cd ${MIHOME}
[ -d ${TTSHOME} ] && echo "El directorio ${TTSHOME} ya existe. Revise, guarde y borre y luego vuelva" && exit 1
mkdir -p ${TTSHOME}/datasets
mkdir -p ${TTSHOME}/scripts
mkdir -p ${TTSHOME}/configs
mkdir -p ${TTSHOME}/notebooks
mkdir -p ${TTSHOME}/experiments
mkdir -p ${TTSHOME}/results

# 1. Bajamos los scripts y cfg_files
# 1.1 Primero todos los scripts de NeMo
BRANCH=main
cd ${TTSHOME}/scripts
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/examples/tts/fastpitch.py
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/examples/tts/hifigan_finetune.py
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/scripts/dataset_processing/tts/extract_sup_data.py
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/scripts/dataset_processing/tts/generate_mels.py

  mkdir thorsten && cd thorsten
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/scripts/dataset_processing/tts/thorsten_neutral/get_data.py

  cd .. && mkdir hifigan && cd hifigan
cd ${MIHOME}
# 1.2 Scripts propios
cd ${TTSHOME}/scripts
  mkdir irene && cd irene
  cp ${MIHOME}/notebooks/es_get_gata.py .
cd ${MIHOME}

# 2. YAML de configuración de modelos, experimentos, ...
BRANCH=main
cd ${TTSHOME}/configs

# 2.1 de Thorsten
  mkdir thorsten && cd thorsten
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/scripts/dataset_processing/tts/thorsten_neutral/ds_conf/ds_for_fastpitch_align.yaml

# 2.2 de HiFiGAN
  cd .. && mkdir hifigan && cd hifigan
  wget https://raw.githubusercontent.com/NVIDIA/NeMo/$BRANCH/examples/tts/conf/hifigan/hifigan.yaml
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/examples/tts/conf/hifigan/model/train_ds/train_ds_finetune.yaml
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/examples/tts/conf/hifigan/model/validation_ds/val_ds_finetune.yaml
  wget https://raw.githubusercontent.com/nvidia/NeMo/$BRANCH/examples/tts/conf/hifigan/model/generator/v1.yaml
  mv v1.yaml generator_v1.yaml

# 2.2 de GermanTTS (examples tts)
  cd .. && mkdir germantts && cd germantts
  wget https://raw.githubusercontent.com/NVIDIA/NeMo/$BRANCH/examples/tts/conf/de/fastpitch_align_22050_grapheme.yaml
        
        --config-name ds_for_fastpitch_align_es.yaml \

cd ${MIHOME}

# 2.2 Configs propios
cd ${TTSHOME}/configs
  mkdir irene && cd irene
  cp ${MIHOME}/notebooks/ds_for_fastpitch_align_es.yaml .
  cp ${MIHOME}/notebooks/es_fastpitch_align_22050.yaml .
cd ${MIHOME}


# 3. Bajamos los datasets
cd ${TTSHOME}/datasets

# 2.1 Primero el aleman
#   Version 22.10
# mkdir -p thorsten/2210 && cd thorsten && python get_data.py \
#     --data-root 2210 \
#     --manifests-root 2210 \
#     --data-version "22_10" \
#     --val-size 100 \
#     --test-size 100 \
#     --seed-for-ds-split 100 \
#     --num-workers -1 \
#     --normalize-text

# 2.2 Ahora el CSS10 Single Speaker Spanish. 
# SUSTITUIR EL username y el token por el de la cuenta Kaggle correspondiente
mkdir css10-es-bryan && cd css10-es-bryan
export KAGGLE_USERNAME=username
export KAGGLE_KEY=key
kaggle datasets download bryanpark/spanish-single-speaker-speech-dataset

# Script para procesar:
# 0: [a MANO] extraer los CSV, quitando ultima columna y un trozo de la ruta de la primera y demás
#       FALTA
# 1: 
# cd ${DATAS}
# RNDNUM=$(shuf -i 32000-64000 -n 1)
# python es_get_data.py   \
#     --data-root ${DATAS}            \
#     --manifests-root NeMoSpanishTTS \
#     --val-size 100                  \
#     --test-size 100                 \
#     --seed-for-ds-split $RNDNUM     \
#     --num-workers -1                \
#     --normalize-text

# GENERAR LOS DATOS SUPLEMENTARIOS PARA MEJORAR LA CALIDAD DEL ENTRENAMIENTO
#
# Run below command line and you will obtain the pitch normalization parameters estimated on the entire dataset. It will cost around 1.5 hours.
cd ${DATAS}/NemoSpanishTTS 
HYDRA_FULL_ERROR=0 python extract_sup_data.py \
        --config-path . \
        --config-name ds_for_fastpitch_align_es.yaml \
        manifest_filepath=train_manifest_text_normed.json \
        sup_data_path=sup_data \
        ++dataloader_params.num_workers=4

cd ${MIHOME}
