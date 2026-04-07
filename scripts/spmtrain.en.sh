#!/bin/bash
#SBATCH --job-name=spm_trainvocab_en
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --account=project_xxxx
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=6G
#SBATCH --partition=small

spm_train --input=data/traindata/alltraindata.en --model_prefix=models/spm.en --vocab_size=32000 --character_coverage=1.0 --model_type=bpe --byte_fallback=true

