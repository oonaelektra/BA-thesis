#!/bin/bash
#SBATCH --job-name=spm_trainvocab_unequal_fi
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --account=project_xxx
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=small

spm_train --input=data/traindata/OpenSubtitles.train.en-fi.fi --model_prefix=models/spm.fi.unequal --vocab_size=29156 --character_coverage=1.0 --model_type=bpe --byte_fallback=true
