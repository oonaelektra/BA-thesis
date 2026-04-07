#!/bin/bash
#SBATCH --job-name=sentences
#SBATCH --error=logs/analysis.error
#SBATCH --account=project_462001087
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=small

bash sentences.desv.sh
python3 difference.desv.py
bash sentences.defi.sh
python3 difference.defi.py
