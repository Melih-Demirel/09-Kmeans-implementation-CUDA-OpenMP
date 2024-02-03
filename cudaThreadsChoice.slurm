#!/bin/bash -l
#SBATCH --cluster=wice
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=llp_h_pds
#SBATCH --time=00:60:00
#SBATCH --error="cudaThreadsChoiceOutput.e"
#SBATCH --output="cudaThreadsChoiceOutput.o"

source /data/leuven/303/vsc30380/slurmhooks

module purge
module load GCC/10.3.0
module load CUDA/11.7.1

make buildCuda
./my_cuda_kmeans --blocks 14 --threads 128 --input data/100000x5.csv --output outputCuda/output100000x5.csv --seed 1953139 --k 20 --repetitions 40
./my_cuda_kmeans --blocks 14 --threads 256 --input data/100000x5.csv --output outputCuda/output100000x5.csv --seed 1953139 --k 20 --repetitions 40
./my_cuda_kmeans --blocks 14 --threads 512 --input data/100000x5.csv --output outputCuda/output100000x5.csv --seed 1953139 --k 20 --repetitions 40
./my_cuda_kmeans --blocks 14 --threads 1024 --input data/100000x5.csv --output outputCuda/output100000x5.csv --seed 1953139 --k 20 --repetitions 40