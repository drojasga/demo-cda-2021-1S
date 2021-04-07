##
##  LAB: Transformación de archivos con `sed`
##  ================================================
##
##  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
##  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
##  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
##  la aplicación de procedimientos manuales no es práctica.
##  
##  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
##  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
##  para los campos son los siguientes:
##  
##  * Columna 1: `DD/MM/AA`.
##  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
##  * Columna 3: Número entero. `\N` indica NULL.
##  * Columna 4: Número decimal. `\N` indica NULL.
##  
##  
##  Usted debe escribir un script en bash que use sed para que realice 
##  las siguientes acciones:
##    
##  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
##  
##  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
##  
##  * Reemplace los `;` por `,`.
##  
##  * Use el `.` para indicar decimales.
##  
##  Rta/
##  2013-03-12,A,1,100.0
##  ...
##  2014-09-01,A,3,100.4
##
##  >>> Escriba su codigo a partir de este punto <<<
##
## cat data.csv | sed 's/\/\([0-9][0-9]\)\;/\/20\1\;/;' 
## cat data.csv | sed 's/^\([0-9]\)\//0\1\//g' 
# | sed 's/\/\([0-9]\)\//\/0\1\//g' 
#| sed 's/\/\([0-9][0-9]\)\;/\/20\1\;/;' 
#| sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/g' 
#| sed 's/,/./g' 
#| sed 's/;/,/g' 
#|  sed 's/,$/,\\N/g' 
#| sed 's/,,/,\\N,/g' 
#| tr [:lower:] [:upper:] 
#| sed 's/,N,/,\\N,/g' | sed 's/,N$/,\\N/g'


#### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;'
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/'
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/'
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/' | sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*[0-9]*\)/\3-\2-\1/'
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/' | sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*[0-9]*\)/\3-\2-\1/' | tr ',' '.' | tr ';' ','
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/' | sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*[0-9]*\)/\3-\2-\1/' | tr ',' '.' | tr ';' ',' | sed 's/,,/,\\N,/' | sed 's/n/N/' | sed 's/,N/,\\N/' 
### cat data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/' | sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*[0-9]*\)/\3-\2-\1/' | tr ',' '.' | tr ';' ',' | sed 's/,,/,\\N,/' | sed 's/n/N/' | sed 's/,N/,\\N/'| tr [:lower:] [:upper:]
#cat -e data.csv | tr '/' '-' | sed 's/\-\([0-9][0-9]\)\;/\-20\1\;/;' | sed 's/\-\([0-9]\)\-/\-0\1\-/' | sed 's/^\([0-9]\)\-/0\1\-/' | sed 's/\([0-9]*\)\-\([0-9]*\)\-\([0-9]*[0-9]*\)/\3-\2-\1/' | tr ',' '.' | tr ';' ',' | sed 's/,,/,\\N,/' | sed 's/n/N/' | sed 's/,N/,\\N/'| tr [:lower:] [:upper:] | sed 's/" "/""/g' | sed 's/,$/,\\N/g'
#cat data.csv | sed 's/^\([0-9]\)\//0\1\//g' | sed 's/\/\([0-9]\)\//\/0\1\//g' | sed 's/\/\([0-9][0-9]\)\;/\/20\1\;/;' | sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9][0-9][0-9]\)/\3-\2-\1/g' | sed 's/,/./g' | sed 's/;/,/g' |  sed 's/,$/,\\N/g' | sed 's/,,/,\\N,/g' | tr [:lower:] [:upper:] | sed 's/,N,/,\\N,/g' | sed 's/,N$/,\\N/g'