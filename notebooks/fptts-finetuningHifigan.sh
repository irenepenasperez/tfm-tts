#!/bin/bash

here=$(pwd)
BRANCH=main
DATAS=/home/irene/datasets

no() {

cd ${DATAS}/NemoSpanishTTS
python generate_mels.py \
    cpu \
    fastpitch-model-ckpt {fastpitch_model_path.split\("/", maxsplit=1\)\[1\]} \
    input-json-manifests train_manifest_text_normed.json val_manifest_text_normed.json test_manifest_text_normed.json \
    output-json-manifest-root ./

cd ${here}

}

cd ${DATAS}/NemoSpanishTTS
hfg_ngc="tts_en_lj_hifigan_ft_mixerttsx"

wandb login 7f8717dd64209b51a51493f579c375a7ca34fd2f

export CUDA_VISIBLE_DEVICES=0
export HYDRA_FULL_ERROR=1
python hifigan_finetune.py   \
    --config-path . --config-name hifigan.yaml \
    model.max_steps=10000 \
    model.optim.lr=0.00001 \
    model.l1_loss_factor=35 \
    ~model.optim.sched \
    train_dataset=train_manifest_text_normed_mel.json \
    validation_datasets=val_manifest_text_normed_mel.json \
    exp_manager.exp_dir=resultSpanishTTS \
    +init_from_pretrained_model=${hfg_ngc} \
    +trainer.val_check_interval=40 \
    trainer.check_val_every_n_epoch=null \
    model/train_ds=train_ds_finetune \
    model/validation_ds=val_ds_finetune \
    exp_manager.create_wandb_logger=true \
    exp_manager.wandb_logger_kwargs.name="tutorial_2" \
    exp_manager.wandb_logger_kwargs.project="SpanishTTS"    | \
       tee -a /home/irene/logs/$(date +"%Y%m%d-%H%M%S")-fptts-finetuneHiFiGAN.log
cd ${here}

# model.optim.lr=0.00001 \ probado: guardado en 2023-07-11_16-04-11. Original
# model.optim.lr=0.0002 \ probado: guardado en 2023-07-11_16-04-11. Creo que suena más natural
# model.optim.lr=0.0001 \ probado: guardado en 2023-07-11_18-20-28. Suena más natural que la anterior 
# model.optim.lr=0.0001 \ model.l1_loss_factor=15 \ model.max_steps=6000 \ +trainer.val_check_interval=30 \
# model.optim.lr=0.0001 \ model.l1_loss_factor=10 \ +trainer.val_check_interval=35 \

#   model.l1_loss_factor=25 \ Original
# model.max_steps=2500 \ Original
# +trainer.val_check_interval=25 \ Original

