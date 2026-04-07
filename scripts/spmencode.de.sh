#!/bin/bash
#SBATCH --job-name=tokenize_de
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --account=project_xxxx
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=small

spm_encode --model=models/spm.de.model --output_format=piece --input=data/traindata/europarl.train.de-en.de --output=data/traindata/traindata.de
spm_encode --model=models/spm.de.model --output_format=piece --input=data/traindata/opensubtitles.valid.en-de.de --output=data/traindata/validdata.de
