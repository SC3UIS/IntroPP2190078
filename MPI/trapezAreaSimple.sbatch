#!/bin/bash

## Directivas
##SBATCH --partition=guane_24_cores 
#SBATCH --ntasks=24
##SBATCH --gres=gpu:1
#SBATCH --job-name=output_trapezAreaSimple 
##SBATCH --job-name=beast
##SBATCH --time=01:00:00 
#SBATCH --nodes=2
##SBATCH --mem=23000
##SBATCH --ntasks-per-node=24  

#SBATCH --output=output_trapezAreaSimple.txt
#SBATCH --error=error_trapezAreaSimple.txt

##SBATCH --output=beast.%j.out
##SBATCH --error=beast.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=archila1046@gmail.com


## Modulos de ambiente
module load devtools/mpi/openmpi/3.1.4

## Ejecucion

mpicxx mpi_trapezAreaSimple.c -o mpi_trapezAreaSimple
mpirun -np 12 ./mpi_trapezAreaSimple

gcc -fopenmp omp_trapezAreaSimple.c -o omp_trapezAreaSimple
./omp_trapezAreaSimple

gcc -fopenmp trapezAreaSimple.c -o trapezAreaSimple
./trapezAreaSimple
