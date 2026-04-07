#!/bin/bash
#SBATCH --job-name=tokenize_en
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --account=project_xxxx
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=small

spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/europarl.train.de-en.en --output=data/traindata/traindata.de.en
spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/opensubtitles.valid.en-de.en --output=data/traindata/validdata.de.en
spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/opensubtitles.train.en-sv.en --output=data/traindata/traindata.sv.en
spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/opensubtitles.valid.en-sv.en --output=data/traindata/validdata.sv.en
spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/opensubtitles.train.en-fi.en --output=data/traindata/traindata.fi.en
spm_encode --model=models/spm.en.model --output_format=piece --input=data/traindata/opensubtitles.valid.en-fi.en --output=data/traindata/validdata.fi.en

