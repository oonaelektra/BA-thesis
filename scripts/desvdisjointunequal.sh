#!/bin/bash -l
#SBATCH -J desvdisjointunequal
#SBATCH -o logs/log.%x_%j
#SBATCH -e logs/error.%x_%j
#SBATCH --mem=16g
#SBATCH --cpus-per-task 4
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 72:00:00
#SBATCH -p small-g
#SBATCH --gpus-per-node=1
#SBATCH --account=project_xxxx

cd ${SLURM_SUBMIT_DIR:-.}
pwd
echo "Starting at `date`"

/appl/local/csc/soft/ai/bin/gpu-energy --save

marian --config configs/desv.disjoint.unequal.config.yml --model models/run1/desv.disjoint.unequal.model.npz

/appl/local/csc/soft/ai/bin/gpu-energy --diff
echo "Finishing at `date`"
 
marian-decoder --config models/run1/desv.disjoint.unequal.model.npz.best-chrf.npz.decoder.yml < data/testdata/tokenized.de > translations/run1/desv.disjoint.unequal.opensub.en
spm_decode --model=models/spm.en.model --input_format=piece < translations/run1/desv.disjoint.unequal.opensub.en > translations/run1/desv.disjoint.unequal.opensub.decoded.en
cat translations/run1/desv.disjoint.unequal.opensub.decoded.en | sacrebleu data/testdata/de-en.en -m bleu chrf > translations/run1/bleuscores_desvdisjointunequal
