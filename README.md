# The Impact of Vocabulary Overlap on Knowledge Transfer in Multilingual Machine Translation
This repository contains the scripts and configuration files to study the impact of vocabulary overlap on knowledge transfer in multilingual machine translation by comparing joint and disjoint vocabularies and related and unrelated languages. The files in this repository are based on research on German as a source language, English as a target language and Swedish and Finnish as auxiliary languages with data from [Europarl](https://opus.nlpl.eu/datasets/Europarl) and [Opensubtitles2024](https://opus.nlpl.eu/datasets/OpenSubtitles). The scripts can however be applied to other languages and domains as well. In this readme, I briefly introduce the contents of this repository and the requirements to run the scripts successfully. 

## Requirements and Instructions

### Data
This repository contains the scripts and configuration files needed to run the experiments, however not the data, as it can be downloaded from [OPUS](https://opus.nlpl.eu) with [OpusTools](https://github.com/Helsinki-NLP/OpusTools) or otherwise or the scripts can be applied to other data as well, in which case it is notable that the filenames do not make sense or work. The repository does however have a specific directory structure for data, such that all data used in the training process of the models, that is training data, validation data and vocabularies are in the same subdirectory for convenience as the files are cut, merged and otherwise processed and the data used for testing has its own subdirectory. 

### Requirements 
Besides of OpusTools, other Python packages (sentencepiece, sacrebleu) and a [MarianNMT](https://marian-nmt.github.io) installation are needed to run the scripts. 

### Instructions
The repository has the configuration files and scripts to train 11 different machine translation models. The steps to run the experiments successfully are as follows: 
- Download data
- Make training and validation data files of the appropriate size for all languages 
In the experiments of my thesis I used 1M lines of training data and 1000 lines of per language and on the source side and for target side I took their English counterparts but for some experiments I split the training data in half. 
- Train tokenizers with the spmtrain.* scripts.
- Tokenize the data with the spmencode.* scripts
- Prefix the auxiliary data for the disjoint and disjoint, unequal vocabulary experiments
- Merge the data to form multilingual training and validation data files and their English counterparts
- Use marian-vocab to extract vocabularies 
- Use overlaps.py to calculate and analyze the vocabulary overlaps 
- Run the scripts with the model names (eg. "baseline.sh" and "desvjoint.sh") to train the models, translate and evaluate 
