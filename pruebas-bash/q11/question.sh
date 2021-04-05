##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros hay en el archivo 'person' para city = 'Los Angeles (California)'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat person  | awk '/Los Angeles/ {print NR}' | awk '{++cnt} END {print cnt}'