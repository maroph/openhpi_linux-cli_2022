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
echo "Beispiele: Bash Variablen"
echo ""
echo "Bash Version : ${BASH_VERSION}"
echo ""
echo ""
#
###############################################################################
#
echo "msg=\"Hello World!\""
echo "echo \"$msg\""
echo "---"
msg="Hello World!"
echo "$msg"
echo ""
#
###############################################################################
#
echo "Länge der Zeichenkette in der Variablen msg: \${#msg}: ${#msg}"
echo ""
#
###############################################################################
#
echo "echo \"\${msg:0:2}\""
echo "---"
echo "${msg:0:2}"
echo ""
#
###############################################################################
#
echo "msg=\"hello world!\""
echo "---"
msg="hello world!"
echo ""
#
# first char to upper
echo "echo \${msg^}"
echo "---"
echo ${msg^}
echo ""
#
#  all chars to upper
echo "echo \${msg^^}"
echo "---"
echo ${msg^^}
echo ""
#
###############################################################################
#
echo "msg=\"Hello World!\""
msg="Hello World!"
echo "---"
echo ""
#
# first char to lower
echo "echo \${msg,}"
echo "---"
echo ${msg,}
echo ""
#
#  all chars to lower
echo "echo \${msg,,}"
echo "---"
echo ${msg,,}
echo ""
#
###############################################################################
#
echo "declare -a inp=(a -1 0 1)"
echo "for n in \${inp[@]}"
echo "do"
echo "    if ! [[ "\$n" =~ ^[1-9][0-9]*$ ]]"
echo "    then"
echo "        echo \"$n - keine positive Zahl\""
echo "    else"
echo "        echo \"$n - positive Zahl\""
echo "    fi"
echo "done"
echo "---"
#
declare -a inp=(a -1 0 1)
for n in ${inp[@]}
do
    if ! [[ "$n" =~ ^[1-9][0-9]*$ ]]
    then
        echo "$n - keine positive Zahl"
    else
        echo "$n - positive Zahl"
    fi
done
echo ""
#
###############################################################################
#
exit 0

