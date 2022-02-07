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
echo "Beispiele: Bash Assoziative Arrays"
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
echo "declare -A aArray"
declare -A aArray
echo ""
#
echo "Anlegen eines vorbelegten Arrays"
echo "declare -A aArrayPre=( [key1]=val1 [key2]=val2 [key3]=val3 )"
declare -A aArrayPre=( [key1]=val1 [key2]=val2 [key3]=val3 )
echo ""
#
###############################################################################
#
echo "Key/Value Paare zu einem Array hinzufügen"
echo "aArray[\"key1\"]=\"value1\""
echo "aArray[\"key2\"]=\"value2\""
echo "---"
aArray["key1"]="value1"
aArray["key2"]="value2"
echo ""
#
###############################################################################
#
echo "Zugriff auf ein Element mit dem Schlüssel (key)"
echo "echo \"\${aArray[\"key1\"]}\""
echo "echo \"\${aArray[\"key2\"]}\""
echo "---"
echo "${aArray["key1"]}"
echo "${aArray["key2"]}"
echo ""
#
###############################################################################
#
echo "Länge eines Arrays: \${#aArray[@]}"
echo "Länge des Arrays aArray    : ${#aArray[@]}"
echo "Länge des Arrays aArrayPre : ${#aArrayPre[@]}"
echo ""
#
###############################################################################
#
echo "Iteration über den Schlüssel (key)"
echo "for key in \"\${!aArray[@]}\""
echo "do"
echo "    echo \"key : \${key}\""
echo "    echo \"key : \${key} , value: \${aArray[${key}]}\""
echo "done"
echo "---"
#
for key in "${!aArray[@]}"
do
    echo "key : ${key}"
    echo "key : ${key} , value: ${aArray[${key}]}"
done
echo ""
#
###############################################################################
#
echo "Iteration über den Wert (value)"
echo "for value in \"\${aArray[@]}\""
echo "do"
echo "    echo \"value: \${value}\""
echo "done"
echo "---"
#
for value in "${aArray[@]}"
do
    echo "value: ${value}"
done
echo ""
#
###############################################################################
#
echo "Prüfen, ob ein Schlüssel (key) im Array enthalten ist"
echo "if [ \${aArray[key1]+_} ]"
echo "then"
echo "    echo \"key1 gefunden\""
echo "fi"
echo "---"
#
if [ ${aArray[key1]+_} ]
then
    echo "key1 gefunden"
fi
echo ""
#
###############################################################################
#
echo "Prüfen, ob ein Schlüssel (key) im Array nicht enthalten ist"
echo "if [ ! \${aArray[keyNONE]+_} ]"
echo "then"
echo "    echo \"keyNONE nicht gefunden\""
echo "fi"
echo "---"
#
if [ ! ${aArray[keyNONE]+_} ]
then
    echo "keyNONE nicht gefunden"
fi
echo ""
#
###############################################################################
#
echo "Löschen eines Schlüssels aus einem Array"
echo "echo \"\\\${aArray[key1]} : \${aArray[key1]}\""
echo "unset aArray[key1]"
echo "echo \"\\\${aArray[key1]} : \${aArray[key1]}\""
echo "---"
#
echo "\${aArray[key1]} : ${aArray[key1]}"
unset aArray[key1]
echo "\${aArray[key1]} : ${aArray[key1]}"
echo ""
#
###############################################################################
#
echo "Löschen eines Arrays"
echo "unset aArray"
echo "unset aArrayPre"
unset aArray
unset aArrayPre
echo ""
#
###############################################################################
#
exit 0

