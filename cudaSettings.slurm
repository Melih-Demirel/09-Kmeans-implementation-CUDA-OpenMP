#!/bin/bash -l
#SBATCH --cluster=wice
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=llp_h_pds
#SBATCH --time=00:60:00
#SBATCH --error="cudaSettingsOutput.e"
#SBATCH --output="cudaSettingsOutput.o"

source /data/leuven/303/vsc30380/slurmhooks



module load GCC/10.3.0
module load CUDA/11.7.1 # Genius 11.7.0, Wice: 11.7.1

nvcc -O3 -DNDEBUG -o cudaSettings cudaSettings.cu -gencode arch=compute_80,code=sm_80 
./cudaSettings
