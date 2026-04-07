#!/bin/bash
#SBATCH --job-name=tokenize_fi_unequal
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --account=project_xxxx
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=small

spm_encode --model=models/spm.fi.unequal.model --output_format=piece --input=data/traindata/opensubtitles.train.en-fi.fi --output=data/traindata/traindata.ue.fi
spm_encode --model=models/spm.fi.unequal.model --output_format=piece --input=data/traindata/opensubtitles.valid.en-fi.fi --output=data/traindata/validdata.ue.fi

