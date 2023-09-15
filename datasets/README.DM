In the Datasets folder we have three different dataset folders, with several files:
The structure of each of them is as it follows: 
dataset19demarzo
 |--19demarzo: folder with wav files.
 |--metadata_dev.csv
 |--metadata_test.csv
 '--metadata_train.csv

The metadata files are generated in the FP_ES_TTS_ExtraccionTransformacionLimpiezaDataset.ipynb file.

Let's talk a bit about the datasets used:
- 19demarzo: created by Kyubyong Park. You can download it from https://www.kaggle.com/datasets/bryanpark/spanish-single-speaker-speech-dataset?resource=download.
  Once downloaded you will see three different datasets: 19demarzo, bailen and batalla_arapiles. I have only used 19demarzo.
- dataset2 and dataset3: provided by a professor from the University of Valladolid.

All the datasets must have a transcript.txt file with the following structure: 
datasetfolder/file.wav|text|Normalized text|duration
Example: 19demarzo/19demarzo_0000.wav|Durante nuestra conversación advertí que la multitud aumentaba, apretándose más.|Durante nuestra conversación advertí que la multitud aumentaba, apretándose más.|5.88
