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
FULL_SCRIPT_NAME=$0
#
echo "Beispiele: Bash Funktionen"
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
echo "Funktionsdeklaration und Aufruf"
echo "function hallo1() {"
echo "    echo \"Hallo1!\""
echo "}"
echo "hallo1"
echo "---"
function hallo1() {
    echo "Hallo1!"
}
hallo1
echo ""
echo "hallo2() {"
echo "    echo \"Hallo2!\""
echo "}"
echo "hallo2"
echo "---"
hallo2() {
    echo "Hallo2!"
}
hallo2
echo ""
#
###############################################################################
#
echo "Übergabeparameter"
echo "function zeigeUebergabeParameter() {"
echi "    echo \"Anzahl Parameter : \$#\""
echo "    echo \"Parameter 1 : \$1\""
echo "    echo \"Parameter 2 : \$2\""
echo "    echo \"Alle Parameter:\""
echo "    echo \"\$@\""
echo "}"
echo "zeigeUebergabeParameter p1 p2 p3 p4"
echo "---"
function zeigeUebergabeParameter() {
    echo "Anzahl Parameter : $#"
    echo "Parameter 1      : $1"
    echo "Parameter 2      : $2"
    echo "Alle Parameter:"
    echo "$@"
}
zeigeUebergabeParameter p1 p2 p3 p4
echo ""
#
###############################################################################
#
echo "Globale/Lokale Variablen"
echo "var1=1"
echo "var2=2"
echo "#"
echo "use_of_variables() {"
echo "    local var1=10"
echo "    var2=7"
echo "    var3=42"
echo "    local var4=2525"
echo "    echo \"in der Funktion: var1: \$var1, var2: \$var2, var3: \$var3\", var4: \$var4\""
echo "}"
echo "#"
echo "echo \"Vor dem Aufruf der Funktion: var1: \$var1, var2: \$var2, var3: \$var3\", var4: \$var4\""
echo "use_of_variables"
echo "echo \"Nach dem Aufruf der Funktion: var1: \$var1, var2: \$var2, var3: \$var3\", var4: \$var4\""
echo "---"
var1=1
var2=2
#
use_of_variables() {
    local var1=10
    var2=7
    var3=42
    local var4=2525
    echo "In der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
}
#
echo "Vor dem Aufruf der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
use_of_variables
echo "Nach dem Aufruf der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
echo ""
#
###############################################################################
#
echo "Rückgabewert"
echo "FULL_SCRIPT_NAME=\$0"
echo "function file_size() {"
echo "    stat --format \"%n: %s Bytes\" \$1"
echo "}"
echo "file_size \${FULL_SCRIPT_NAME}"
echo "echo \"exit code : \$?\""
echo "echo \"\""
echo "file_size diese_datei_gibt_es_nicht"
echo "echo \"exit code : \$?\""
echo "#"
echo "function file_size_return() {"
echo "    return 42"
echo "    stat --format \"%n: %s Bytes\" \$1"
echo "}"
echo "file_size_return \${FULL_SCRIPT_NAME}"
echo "echo \"exit code : \$?\""
echo "---"
function file_size() {
    stat --format "%n: %s Bytes" $1
}
file_size ${FULL_SCRIPT_NAME}
echo "exit code : $?"
echo ""
file_size diese_datei_gibt_es_nicht
echo "exit code : $?"
echo ""
#
echo "function file_size_return() {"
echo "    return 42"
echo "    stat --format \"%n: %s Bytes\" \$1"
echo "}"
echo "file_size_return \${FULL_SCRIPT_NAME}"
echo "echo \"exit code : \$?\""
echo "---"
function file_size_return() {
    return 42
    stat --format "%n: %s Bytes" $1
}
file_size_return ${FULL_SCRIPT_NAME}
echo "exit code : $?"
echo ""
#
###############################################################################
#
exit 0

