##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'key' del archivo 'data.csv' para el 
##  registro 3?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat data.csv | awk 'NR == 4 {print}'|sed 's/\"//g'| cut -d "," -f3