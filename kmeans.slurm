#!/bin/bash -l
#SBATCH --cluster=wice
#SBATCH --account=llp_h_pds
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --time=00:60:00
#SBATCH --error="%x.e%A"
#SBATCH --output="%x.o%A"
make build
make run 10
