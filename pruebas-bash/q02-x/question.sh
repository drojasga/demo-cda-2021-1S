##
##  Programación en Bash
##  ===========================================================================
##
##  Usando los archivos `data1.csv`, `data2.csv`, `data3.csv`, escriba en el
##  archivo `script.sh`  un programa en Bash que imprima en pantalla
##  la siguiente salida por linea:
## 
##  * El nombre del archivo.
##  * El número de la línea procesada.
##  * La letra de la primera columna del archivo.
##  * La cadena de tres letras y el valor asociado de la columna 2 del archivo original. 
##
##  Note que se genera una línea de salida por cada cadena de tres letras.
##   
##  Rta/
##
##  data1.csv,1,E,jjj:3
##  data1.csv,1,E,bbb:0
##  ...
##  data3.csv,3,B,hhh:1
##  data3.csv,3,B,ddd:2
##
##  >>> Escriba su codigo a partir de este punto <<<
##
#awk '!/^$/ {c++} { if (c > FNR && length != 0) { c=1 } split($2, columnas, ","); for (columna in columnas) { print FILENAME","c","$1","columnas[columna] }}' *.csv
#awk '!/^$/ {if (c > FNR && length != 0) {c=1 if (length($0) == 1) {lineaFalsa = 1 } } else { if (length($0) > 1 && lineaFalsa != 1) { c++ }} if (lineaFalsa == 1 && length($0) > 1) { lineaFalsa = 0} split($2, columnas, ","); for (columna in columnas) { print FILENAME","c","$1","columnas[columna]} }' *.csv

for archivo in $(*.csv); do
    #Para saber en qué línea estoy ubicada
    let linea=1

    #lee línea por línea de cada archivo sin importar el salto de línea
    while IFS='' read -r line || [[ -n "$line" ]]
    do
        #Cuenta caracteres de las líneas para identificar las vacías
        z=$(echo $line | wc -m)
        
        #Solo toma líneas con caracteres, para evitar líneas en blanco
        if (($z >= 3 ))
        then
            #Extrae primer elemento de la línea
            letra=$( echo ${line:0:1})
            #Crea nueva línea para excluir primer elemento
            newline=$(echo $line | sed 's/\t/,/g' | sed 's/ \+ /,/g' | sed 's/^\([A-Z]\)//g')
            #Creamos array para recorrer cada posición
            IFS=', ' read -a array <<< "$newline"
            #Recorremos el array
            for i in "${array[@]}"
            do
                #Creamos estructura ejemplo data1.csv,1,E,jjj:3             
                echo "$archivo,$linea,$letra,$i"
            done

            let linea=linea+1
        fi
        
    done < $archivo
done