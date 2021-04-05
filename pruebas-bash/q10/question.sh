##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros tiene el archivo 'data.csv'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat  data.csv  | awk '{++cnt} END {print "", cnt-1}'| sed 's/\ //g'