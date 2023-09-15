#!/bin/bash

here=$(pwd)
BRANCH=main
DATAS=/home/irene/datasets

wandb login 7f8717dd64209b51a51493f579c375a7ca34fd2f

cd ${DATAS}/NemoSpanishTTS
export 'PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512'
export HYDRA_FULL_ERROR=1
export CUDA_VISIBLE_DEVICES=0
python fastpitch.py --config-path . --config-name fastpitch_align_44100 \
    model.train_ds.dataloader_params.batch_size=12 \
    model.validation_ds.dataloader_params.batch_size=12 \
    train_dataset=train_manifest_text_normed.json \
    validation_datasets=val_manifest_text_normed.json \
    sup_data_path=sup_data \
    exp_manager.exp_dir=resultSpanishTTS \
    trainer.check_val_every_n_epoch=1 \
    pitch_mean=126.73465728759766 \
    pitch_std=38.099849700927734 \
    +exp_manager.create_wandb_logger=true \
    +exp_manager.wandb_logger_kwargs.name="tutorial" \
    +exp_manager.wandb_logger_kwargs.project="SpanishTTS"

cd ${here}