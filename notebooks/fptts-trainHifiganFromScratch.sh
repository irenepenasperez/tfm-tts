#!/bin/bash

here=$(pwd)
BRANCH=main
DATAS=/home/irene/datasets

wandb login 7f8717dd64209b51a51493f579c375a7ca34fd2f

cd ${DATAS}/NemoSpanishTTS
export 'PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512'
export HYDRA_FULL_ERROR=1
export CUDA_VISIBLE_DEVICES=0
python hifigan.py --config-path . --config-name hifigan \
    train_dataset=train_manifest_text_normed_mel.json \
    validation_datasets=val_manifest_text_normed_mel.json \
    exp_manager.exp_dir=resultSpanishTTSHifigan \
    trainer.check_val_every_n_epoch=25 \
    model.max_steps=2500 \
    model.optim.lr=0.00001 \
    model.l1_loss_factor=25 \
    ~model.optim.sched \
    model/train_ds=train_ds_finetune \
    model/validation_ds=val_ds_finetune \
    exp_manager.create_wandb_logger=true \
    +exp_manager.wandb_logger_kwargs.name="tutorial" \
    +exp_manager.wandb_logger_kwargs.project="SpanishTTS"

cd ${here}