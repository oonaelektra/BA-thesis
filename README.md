# The Impact of Vocabulary Overlap on Knowledge Transfer in Multilingual Machine Translation
This repository contains the scripts and configuration files to study the impact of vocabulary overlap on knowledge transfer in multilingual machine translation by comparing joint and disjoint vocabularies and related and unrelated languages. The files in this repository are based on research on German as a source language, English as a target language and Swedish and Finnish as auxiliary languages with data from [Europarl](https://opus.nlpl.eu/datasets/Europarl) and [Opensubtitles2024](https://opus.nlpl.eu/datasets/OpenSubtitles). The scripts can however be applied to other languages and domains as well. In this readme, I briefly introduce the contents of this repository and the requirements to run the scripts successfully. 

## Requirements and Instructions

### Data
This repository contains the scripts and configuration files needed to run the experiments, however not the data, as it can be downloaded from [OPUS](https://opus.nlpl.eu) with [OpusTools](https://github.com/Helsinki-NLP/OpusTools) or otherwise or the scripts can be applied to other data as well, in which case it is notable that the filenames do not make sense or work. The repository does however have a specific directory structure for data, such that all data used in the training process of the models, that is training data, validation data and vocabularies are in the same subdirectory for convenience as the files are cut, merged and otherwise processed and the data used for testing has its own subdirectory. 

### Requirements 
Besides of OpusTools, other Python packages such as [sentencepiece](https://pypi.org/project/sentencepiece/), [sacrebleu](https://pypi.org/project/sacrebleu/) and a [MarianNMT](https://marian-nmt.github.io) installation are needed to run the scripts. All the slurms scripts are specific to CSC's [LUMI](https://lumi-supercomputer.eu) and other clusters might need other kinds of scripts to run the experiments.

### Contents
The repository is divided to subdirectories as follows:
- analysis (contains scripts for comparing translations based on ChrF scores and to analyze the overlapping tokens)
- configuration-files (marian configuration files for each model, in total 11 different files)
- data 
    - traindata
    - testdata
- logs
- models
    - run1 
- scripts (tokenization and 11 different scripts that train a model, translate and evaluate)
- translations 
    -run1 
- Readme (for documentation)


### Instructions
The repository has the configuration files and scripts to train 11 different machine translation models. The pipeline needs some manual labour in the form of head and tail and other commands and is not 100% automated. 
The steps to run the experiments successfully after cloning this repository and installing needed packages are as follows:
- Download data to data/traindata and data/testdata
- Make training and validation data files of the appropriate size for all languages 
In the experiments of my thesis I used 1M lines of training data and 1000 lines of per language and on the source side and for target side I took their English counterparts but for the multilingual experiments where the models afre trained with only 1M lines total I split the training data in half to have 500K lines from auxiliary languages and 500K lines from source language. However, as these files are not needed for training the tokenizers or creating vocabularies they can be created later. Exact filenames used in this study can be found in the scripts, but the untokenized files are of the format: opensubtitles.train.aux-en.aux. 
- Train tokenizers with the spmtrain.* scripts.
- Tokenize the data with the spmencode.* scripts
- Prefix the auxiliary data for the disjoint and disjoint+unequal vocabulary experiments 
- Merge the data to form multilingual training and validation data files and their English counterparts (again, check filenames in the scripts: traindata.auxde, traindata.disjoint.auxde... etc or modify them)
- Use marian-vocab to extract vocabularies 
- Use overlaps.py in analysis -folder to calculate and analyze the vocabulary overlaps 
- Run the scripts with the model names (eg. "baseline.sh" and "desvjoint.sh") to train the models, translate and evaluate. For multiple runs, create multiple subdirectories (run2, run3...) in models and translations.
- run the slurmscript.sh in analysis folder to compare translations with joint and disjoint vocabularies
