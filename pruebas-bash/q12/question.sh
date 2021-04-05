##
##  Gestion de datos con BASH
##  ===========================================================================
##
##  Cuantos registros hay en el archivo 'person' para city = 'New York (New York)'?
## 
##  >>> Escriba su codigo a partir de este punto <<<
##
cat person  | awk '/New York (New York)/ {print NR}' | awk '{++cnt} END {print cnt}'