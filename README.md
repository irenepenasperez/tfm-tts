In this Master's Disertation proyect, you will find the following folders:

- configs
- datasets
- dockers 
- experiments
- notebooks
- results
- scripts

.
├── bin
│   └── docolab
├── datasets
│   ├── LEEME.txt
│   ├── NemoSpanishTTS
│   │   ├── __pycache__
│   │   ├── cache_dir
│   │   ├── cmudict-0.7b_nv22.10
│   │   ├── conf
│   │   ├── ds_for_fastpitch_align.yaml
│   │   ├── es_ES_nv230301.dict
│   │   ├── extract_sup_data.py
│   │   ├── fastpitch.py
│   │   ├── fastpitch_align_22050_grapheme.yaml
│   │   ├── fastpitch_align_44100.yaml
│   │   ├── fastpitch_finetune.py
│   │   ├── fastpitch_sup_data
│   │   ├── fastpitch_sup_datav2
│   │   ├── generate_mels.py
│   │   ├── get_data.py
│   │   ├── hifigan.py
│   │   ├── hifigan.yaml
│   │   ├── hifigan_finetune.py
│   │   ├── ljspeech_to_9017_no_mixing_5_mins
│   │   ├── ljspeech_to_9017_no_mixing_5_minsv2
│   │   ├── mels
│   │   ├── model
│   │   ├── resultSpanishTTS
│   │   ├── resultSpanishTTSHifigan
│   │   ├── skipped_not_found_wavs.list
│   │   ├── sup_data
│   │   ├── test_manifest.json
│   │   ├── test_manifest_text_normed.json
│   │   ├── test_manifest_text_normed_mel.json
│   │   ├── train_manifest.json
│   │   ├── train_manifest_text_normed.json
│   │   ├── train_manifest_text_normed_mel.json
│   │   ├── tts_dataset_files
│   │   ├── tts_en_fastpitch_align.nemo
│   │   ├── tts_tokenizers.py
│   │   ├── val_manifest.json
│   │   └── val_manifest_text_normed.json
│   ├── NemoSpanishTTSEsMapa152Finetuning
│   ├── NemoSpanishTTSFinetuning
│   ├── datasetAlfonsoGutierrezFinetuning
│   │   ├── asignaturaBueno
│   │   ├── metadata_dev.csv
│   │   ├── metadata_test.csv
│   │   ├── metadata_train.csv
│   │   └── transcript.txt
│   ├── datasetCastellanoReducido
│   │   ├── 19demarzo
│   │   ├── metadata_dev.csv
│   │   ├── metadata_test.csv
│   │   └── metadata_train.csv
│   └── datasetEsMapa152Finetuning
│       ├── esmapa152
│       ├── metadata_dev.csv
│       ├── metadata_test.csv
│       └── metadata_train.csv
├── datasetsAuto
│   ├── 19demarzo
│   │   ├── 19demarzo_0000.wav
│   │   ├── 19demarzo_nnnn.wav
│   │   └── 19demarzo_3272.wav
│   ├── metadata_dev.csv
│   ├── metadata_test.csv
│   └── metadata_train.csv
├── estructura_directorios.txt
├── logs
│   ├── 20230628-080133-fptts-train.log
├── notebooks
│   ├── ExperimentoCompleto.ipynb
│   ├── FP_ES_TTSEvaluateAfterFinetuningHiFiGAN.ipynb
│   ├── FP_ES_TTS_Evaluate-FTHifiGAN.ipynb
│   ├── FP_ES_TTS_Evaluate.ipynb
│   ├── FP_ES_TTS_Evaluate_Valen.ipynb
│   ├── FP_ES_TTS_ExtraccionTransformacionLimpiezaDataset.ipynb
│   ├── FP_ES_TTS_Finetuning_FastPitch.ipynb
│   ├── FP_ES_TTS_Finetuning_FastPitchESV2.ipynb
│   ├── FP_ES_TTS_Finetuning_HiFiGAN.ipynb
│   ├── FP_ES_TTS_Train.ipynb
│   ├── FastPitch_SpanishTTS_Training.ipynb
│   ├── Notas-Pablo
│   ├── cania.ipynb
│   ├── confV1
│   │   ├── fastpitchFinetuningEnEsp
│   │   ├── fastpitch_align_v1.05.yaml
│   │   ├── fastpitch_finetune.py
│   │   └── tts_en_fastpitch_align.nemo
│   ├── ds_for_fastpitch_align_es.yaml
│   ├── es_fastpitch_align_22050.yaml
│   ├── es_get_data.py
│   ├── evaluateEvaluacionPerceptual.ipynb
│   ├── fptts-entrena.sh
│   ├── fptts-finetuningFastPitch.sh
│   ├── fptts-finetuningHifigan.sh
│   ├── fptts-getdata.sh
│   ├── fptts-install-dep.sh
│   ├── fptts-train.sh
│   ├── fptts-trainHifiganFromScratch.sh
│   ├── muestrasEvaluaciónPerceptal
│   │   ├── audio_modelo_Finetuned_FastPitch_2_Audio_1.wav
│   │   ├── ..........................................wav
│   │   └── audio_modelo_Finetuned_HifiGAN_3_Audio_6.wav
│   ├── muestrasModelosBase
│   ├── muestrasModelosFinetunedFastpitch
│   ├── muestrasModelosFinetunedHifiGAN
│   ├── tts_en_fastpitch_align.nemo
│   └── valen
│       └── imggen.ipynb
├── nvcr.io
│   ├── apt-packages.lst
│   ├── run-irene.sh
│   └── run.sh
