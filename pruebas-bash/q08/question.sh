##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'quota' del archivo 'data.csv' para el 
##  ultimo registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat data.csv | awk 'END {print}' |sed 's/\"//g'| cut -d "," -f5
