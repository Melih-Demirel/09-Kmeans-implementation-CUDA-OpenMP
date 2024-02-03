#!/bin/bash -l
#SBATCH --cluster=wice
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=llp_h_pds
#SBATCH --time=00:60:00
#SBATCH --error="cudaOutput.e"
#SBATCH --output="cudaOutput.o"

source /data/leuven/303/vsc30380/slurmhooks

module purge
module load GCC/10.3.0
module load CUDA/11.7.1

make buildCuda
make runCuda 16