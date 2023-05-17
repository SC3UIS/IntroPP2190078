# MPI

Este programa utiliza el método de integración trapezoidal para calcular la integral de una función dada, en este caso x^2, en un intervalo [a,b] dividido en n subintervalos. En este caso la integral de x^2 con el intervalo [50,1.000.000] y 1.000.000 subintervalos.

Se paralelizo con openMPI, dividiendo el trabajo entre múltiples procesos. cada uno calculando una parte de la suma y luego combinando los resultados para obtener el resultado final.

Para esto inicializamos MPI llamando a MPI_Init y se obtiene el rango del proceso actual y el tamaño total del grupo de procesos llamando a MPI_Comm_rank y MPI_Comm_size, respectivamente.

Se realiza una difusión de los valores de n, a y b desde el proceso 0 a todos los demás procesos utilizando MPI_Bcast. Esto asegura que todos los procesos tengan los mismos valores para estos parámetros.

Cada proceso calcula su rango local de iteración a partir de su rango y el número de subintervalos, asegurando que cada proceso tenga una cantidad equitativa de trabajo.

Se realiza un bucle for en el que cada proceso calcula su suma local de la función evaluada en los puntos x correspondientes a su rango local.

Cada proceso calcula su resultado parcial de la integral utilizando la fórmula del método del trapecio.

Se utiliza MPI_Reduce para combinar los resultados parciales de la integral de cada proceso y obtener el resultado final en el proceso 0. El resultado final se guarda en la variable integral.

Finalmente, se llama a MPI_Finalize para finalizar el entorno de ejecución de MPI.

Para la compilación del codigo usamos mpicc, el comando quedaría de la siguiente manera: 

**mpicc mpi_trapezAreaSimple.c -o mpi_trapezAreaSimple** 

Para ejecutarlo en local, debemos ingresarle el numero de procesos con los que se va a ejecutar, 12 en este caso, entonces,  se usa el comando:

**mpirun -np 12 ./mpi_trapezAreaSimple**

Para ejecutarlo se usa el archivo trapezAreaSimple.sbatch y se ejecuta el comando de slurm:

**sbatch trapezAreaSimple.sbatch**

Este leera las lineas de comandos en el archivo y ejecutará este proceso en GUANE devolviendo un archivo de output que en este caso son los resultados de la integral de la función y los tiempos de ejecución de esta.



**Análisis de tiempos de ejecución**

En general, la diferencia en los valores de la integral se debe a los diferentes enfoques utilizados para el paralelismo. 
 
MPI divide el trabajo entre múltiples procesos, mientras que OpenMP utiliza múltiples hilos en un proceso. 
Esto puede llevar a diferencias en los resultados debido a la forma en que se manejan los cálculos y las operaciones de reducción.

En cuanto a los tiempos de ejecución, el código paralelizado con MPI muestra el tiempo más rápido, seguido por la versión sin paralelización y, finalmente, el código paralelizado con OpenMP. 

Esto puede ser atribuido a las características de escalabilidad y a la implementación particular del código en cada caso. 

