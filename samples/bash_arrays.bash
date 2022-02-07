#!/bin/bash
#
###########################################################
# Copyright (c) 2022 by Manfred Rosenboom                 #
#                                                         #
# Dieses Werk ist lizenziert unter einer                  #
# Creative Commons Namensnennung 4.0 International Lizenz #
# CC-BY 4.0: https://creativecommons.org/licenses/by/4.0/ #
###########################################################
#
echo "Beispiele: Bash Arrays"
echo ""
echo "Bash Version : ${BASH_VERSION}"
echo "LANG         : ${LANG}"
echo -n "Kernel       : "
uname -s -r -m
echo ""
echo ""
#
###############################################################################
#
echo "Anlegen eines leeren Arrays"
echo "declare -a array"
echo "---"
declare -a array
echo ""
#
echo "Anlegen eines vorbelegten Arrays"
echo "declare -a arrayPre=(wert1 wert2 wert3 wert4)"
echo "---"
declare -a arrayPre=(wert1 wert2 wert3 wert4)
echo ""
#
###############################################################################
#
echo "Werte an ein Array anhängen"
echo "array+=(\"wert1\")"
echo "array+=(\"wert2\")"
echo "array+=(\"wert3\")"
echo "array+=(\"wert4\")"
echo "---"
array+=("wert1")
array+=("wert2")
array+=("wert3")
array+=("wert4")
echo ""
#
###############################################################################
#
echo "Zugriff auf ein Element mit dem Index (das 1. Element hat den Index 0)"
echo "echo \"\${array[0]}\""
echo "echo \"\${array[1]}\""
echo "---"
echo "${array[0]}"
echo "${array[1]}"
echo ""
#
###############################################################################
#
echo "Wert mit Index überschreiben"
echo "array[1]=\"wert2_neu\""
echo "---"
array[1]="wert2_neu"
echo "neuer Wert vom Element mit dem Index 1: ${array[1]}"
echo ""
#
echo "neuen Wert mit Index hinzufügen"
echo "array[5]=\"wert5\""
echo "---"
array[5]="wert5"
echo "Wert vom neuen Element mit dem Index 5: ${array[5]}"
echo ""
#
echo "was ist der Wert vom Element mit dem nicht belegtem Index 4 ?"
if [ "${array[4]}" = "" ]
then
    echo "\${array[4]} wird zu einem Leerstring expandiert"
else
    echo "Wert vom nicht belegtem Element mit dem Index 4: ${array[4]}"
fi
echo ""
#
###############################################################################
#
echo "Länge eines Arrays: \${#array[@]}"
echo "---"
echo "Länge des Arrays array    : ${#array[@]}"
echo "Länge des Arrays arrayPre : ${#arrayPre[@]}"
echo ""
#
###############################################################################
#
echo "Array kopieren"
echo "array2=(\"\${array[@]}\")"
echo "---"
array2=("${array[@]}")
echo ""
#
###############################################################################
#
echo "Array konkatenieren"
echo "array3=(\"\${array[@]}\" \"\${array2[@]}\")"
echo "---"
array3=("${array[@]}" "${array2[@]}")
echo ""
#
###############################################################################
#
echo "Element 1 bis 3 eines Array ausgeben"
echo "1: ab diesem Index, 4: alle Elemente vor diesem Index"
echo "echo \"\${array[@]:1:4}\""
echo "---"
echo "${array[@]:1:4}"
echo ""
#
###############################################################################
#
echo "Ausgabe des gesamten Arrays"
echo "echo \"\${array[@]}\""
echo "---"
echo "${array[@]}"
echo ""
#
###############################################################################
#
echo "Werte bei der Ausgabe ersetzen"
echo "\${array[@]/wert/value}: ersezt den String \"wert\" durch \"value\""
echo "---"
echo "${array[@]/wert/value}"
echo ""
#
###############################################################################
#
echo "Iteration über ein Array"
echo "for wert in \"\${array[@]}\""
echo "do"
echo "    echo \"Wert : \${wert}\""
echo "done"
echo "---"
for wert in "${array[@]}"
do
    echo "Wert : ${wert}"
done
echo ""
#
###############################################################################
#
echo "Prüfen, ob ein Wert im Array enthalten ist"
echo "if [[ \" \${array[@]} \" =~ \" wert1 \" ]]"
echo "then"
echo "    echo \"der Wert wert1 ist im Array array enthalten\""
echo "fi"
echo "---"
if [[ " ${array[@]} " =~ " wert1 " ]]
then
    echo "der Wert wert1 ist im Array array enthalten"
fi
echo ""
#
###############################################################################
#
echo "Prüfen, ob ein Wert nicht im Array enthalten ist"
echo "if [[ ! \" \${array[@]} \" =~ \" wertNONE \" ]]"
echo "then"
echo "    echo \"der Wert wertNone ist im Array array nicht enthalten\""
echo "fi"
echo "---"
if [[ ! " ${array[@]} " =~ " wertNONE " ]]
then
    echo "der Wert wertNone ist im Array array NICHT enthalten"
fi
echo ""
#
###############################################################################
#
echo "Löschen eines Elementes aus einem Array"
echo "\${array[5]} : ${array[5]}"
echo "unset array[5]"
echo "---"
unset array[5]
echo "\${array[5]} : ${array[5]}"
echo ""
#
###############################################################################
#
echo "Löschen eines Arrays"
echo "unset array"
echo "unset arrayPre"
unset array
unset arrayPre
echo ""
#
###############################################################################
#
echo "Zeilenweises Einlesen einer Datei in ein Array"
rm -f tmp.txt
touch tmp.txt
echo "Zeile 1" >> ./tmp.txt
echo "Zeile 2" >> ./tmp.txt
echo "Zeile 3" >> ./tmp.txt
echo "Zeile 4" >> ./tmp.txt
echo "Zeile 5" >> ./tmp.txt
echo "Inhalt der einzulesenden Datei"
cat ./tmp.txt
echo ""
#
echo "# BashFAQ/005: 2.1. Loading lines from a file or stream"
echo "# https://mywiki.wooledge.org/BashFAQ/005"
echo "mapfile -t array < ./tmp.txt"
echo "echo \"Anzahl gelesener Zeilen: \\\${#array[@]}: \${#array[@]}\""
echo "for line in \"\${array[@]}\""
echo "do"
echo "    echo \">>>>> \${line}\""
echo "done"
echo "---"
#
# BashFAQ/005: 2.1. Loading lines from a file or stream
# https://mywiki.wooledge.org/BashFAQ/005
mapfile -t array < ./tmp.txt
echo "Anzahl gelesener Zeilen: \${#array[@]}: ${#array[@]}"
for line in "${array[@]}"
do
    echo ">>>>> ${line}"
done
#
rm -f tmp.txt
echo ""
#
###############################################################################
#
exit 0

