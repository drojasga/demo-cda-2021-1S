##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cual es el valor del campo 'ccn' del archivo 'data.csv' para el primer 
##  registro?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat data.csv | awk 'NR == 2 {print}'|sed 's/\"//g'| cut -d "," -f1