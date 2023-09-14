# #!/bin/bash

# here=$(pwd)
# BRANCH=main
# DATAS=/home/irene/datasets

# # cd ${DATAS}/NemoSpanishTTS
# cd ${DATAS}/NemoSpanishTTSFinetuning

# # TODO(oktai15): remove +model.text_tokenizer.add_blank_at=true when we update FastPitch checkpoint
# python fastpitch_finetune.py --config-name=fastpitch_align_v2.05.yaml \
#   train_dataset=train_manifest_text_normed.json \
#   validation_datasets=val_manifest_text_normed.json \
#   sup_data_path=./fastpitch_sup_datav2 \
#   phoneme_dict_path=es_ES_nv230301.dict \
#   exp_manager.exp_dir=./ljspeech_to_9017_no_mixing_5_minsv2 \
#   +init_from_nemo_model=./FastPitchModeloEsp.ckpt \
#   +trainer.max_steps=1000 ~trainer.max_epochs \
#   trainer.check_val_every_n_epoch=25 \
#   model.train_ds.dataloader_params.batch_size=4 model.validation_ds.dataloader_params.batch_size=4 \
#   model.n_speakers=1 model.pitch_mean=109.04179382324219 model.pitch_std=38.099849700927734 \
#   model.pitch_fmin=30 model.pitch_fmax=512 model.optim.lr=2e-4 \
#   ~model.optim.sched model.optim.name=adam trainer.devices=1 trainer.strategy=null \
#   +model.text_tokenizer.add_blank_at=true \

# #Para entrenar con los audios de Kaggle.
# # PITCH_MEAN=126.73465728759766, PITCH_STD=38.099849700927734
# #Para entrenar con los audios del profe de Segovia.
# # PITCH_MEAN=109.04179382324219, PITCH_STD=25.54973793029785
## EsMapa152
PITCH_MEAN=117.99466705322266 PITCH_STD=37.657745361328125

#!/bin/bash

here=$(pwd)
BRANCH=main
DATAS=/home/irene/datasets

# cd ${DATAS}/NemoSpanishTTS
cd ${DATAS}/NemoSpanishTTSEsMapa152Finetuning

# TODO: Remove +model.text_tokenizer.add_blank_at=true when we update FastPitch checkpoint
python fastpitch_finetune.py --config-name=fastpitch_align_44100.yaml \
    model.train_ds.dataloader_params.batch_size=8 \
    model.validation_ds.dataloader_params.batch_size=8 \
    train_dataset=train_manifest_text_normed.json \
    validation_datasets=val_manifest_text_normed.json \
    +init_from_nemo_model=./FastPitchModeloEsp.ckpt \
    sup_data_path=sup_data \
    exp_manager.exp_dir=resultSpanishTTS \
    trainer.check_val_every_n_epoch=1 \
    model.pitch_mean=117.99466705322266 \
    model.pitch_std=37.657745361328125 \
    +exp_manager.create_wandb_logger=true \
    +exp_manager.wandb_logger_kwargs.name="finetuningAudiosEsMapa152" \
    +exp_manager.wandb_logger_kwargs.project="SpanishTTS"
  # train_dataset=test_manifest_text_normed.json \
  # validation_datasets=test_manifest_text_normed.json \
  # sup_data_path=./fastpitch_sup_datav2 \
  # # phoneme_dict_path=es_ES_nv230301.dict \
  # exp_manager.exp_dir=./ljspeech_to_9017_no_mixing_5_minsv2 \
  # +init_from_nemo_model=./FastPitchModeloEsp.ckpt \
  # +trainer.max_steps=1000 ~trainer.max_epochs \
  # trainer.check_val_every_n_epoch=25 \
  # model.n_speakers=1 model.pitch_mean=126.73465728759766 model.pitch_std=38.099849700927734 \
  # model.pitch_fmin=30 model.pitch_fmax=512 model.optim.lr=2e-4 \
  # model.train_ds.dataloader_params.batch_size=4 model.validation_ds.dataloader_params.batch_size=4 \
  # ~model.optim.sched model.optim.name=adam trainer.devices=1 trainer.strategy=null \
  # +model.text_tokenizer.add_blank_at=true \

# Para entrenar con los audios de Kaggle.
# PITCH_MEAN=126.73465728759766, PITCH_STD=38.099849700927734
# Para entrenar con los audios del profe de Segovia.
# PITCH_MEAN=109.04179382324219, PITCH_STD=25.54973793029785


