# OpenMp
Este programa utiliza el método de integración trapezoidal para calcular la integral de una función dada, en este caso x^2, en un intervalo [a,b] dividido en n subintervalos. En este caso la integral de x^2 con el intervalo [50,1.000.000] y 100.000 subintervalos.

Se paralelizo con openmp usando #pragma omp parallel for con la clausula reduction para sumar cada hilo independientemente y luego sumar el total de estos. 

Para la compilación del codigo usamos gcc con la bandera -fopenmp, el comando quedaría de la siguiente manera: 

**gcc -fopenmp omp_trapezAreaSimple.c -o omp_trapezAreaSimple** 

Para ejecutarlo en local se usa el comando:

**./omp_trapezAreaSimple**

Para ejecutarlo se usa el archivo trapezAreaSimple.sbatch y se ejecuta el comando de slurm:

**sbatch trapezAreaSimple.sbatch**

Este leera las lineas de comandos en el archivo y ejecutará este proceso en GUANE devolviendo un archivo de output que en este caso son los resultados de la integral de la función y el tiempo de ejecución de esta
