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
echo "LANG         : ${LANG}"
echo -n "Kernel       : "
uname -s -r -m
echo ""
echo ""
#
###############################################################################
#
echo "Variable einen Wert zuweisen und ausgeben"
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
echo "Variable schreibschützen (readonly)"
echo ""
echo "msgr=\"Hello World! #1\""
echo "echo \"\$msgr\""
echo "declare -r msgr"
echo "msgr=\"Hello World! #2\""
echo "echo \"\$msgr\""
echo "---"
#
msgr="Hello World! #1"
echo "$msgr"
declare -r msgr
msgr="Hello World! #2"
echo "$msgr"
echo "---"
echo ""
#
###############################################################################
#
echo "Bilden eines Teilstrings"
echo "0: ab diesem Index, 2: alle Elemente vor dieser Position"
echo "echo \"\${msg:0:2}\""
echo "---"
echo "${msg:0:2}"
echo ""
#
###############################################################################
#
echo "Ist Teilstring in einem String enthalten"
echo "string='A long string'"
echo "if [[ \$string == *\"A long\"* ]]"
echo "then"
echo "    echo \"'A long' is part of the string\""
echo "fi"
echo "---"
#
string='A long string'
if [[ $string == *"A long"* ]]
then
    echo "'A long' is part of the string"
fi
echo ""
echo "string='A long string'"
echo "if [[ \$string != *\"A short\"* ]]"
echo "then"
echo "    echo \"'A short' is not part of the string\""
echo "fi"
echo "---"
#
string='A long string'
if [[ $string != *"A short"* ]]
then
    echo "'A short' is not part of the string"
fi
echo ""
#
###############################################################################
#
echo "Ausgabe eines Programms in einer Variablen speichern"
echo "issue=\`cat /etc/issue\`"
echo "echo "\$issue""
echo "---"
issue=`cat /etc/issue`
echo "$issue"
echo ""
#
echo "Ausgabe eines Programms in einer Variablen speichern"
echo "issue=\$(cat /etc/issue)"
echo "echo "\$issue""
echo "---"
issue=$(cat /etc/issue)
echo "$issue"
echo ""
#
###############################################################################
#
echo "msg=\"hello world!\""
echo "---"
msg="hello world!"
#
###############################################################################
#
echo "Ausgabe eines Programms in einer Variablen speichern"
echo "issue=\`cat /etc/issue\`"
echo "echo "\$issue""
echo "---"
issue=`cat /etc/issue`
echo "$issue"
echo ""
#
echo "Ausgabe eines Programms in einer Variablen speichern"
echo "issue=\$(cat /etc/issue)"
echo "echo "\$issue""
echo "---"
issue=$(cat /etc/issue)
echo "$issue"
echo ""
#
###############################################################################
#
echo "msg=\"hello world!\""
echo "---"
msg="hello world!"
echo ""
#
echo "Erstes Zeichen in einen Großbuchstaben umwandeln"
echo "echo \${msg^}"
echo "---"
echo ${msg^}
echo ""
#
echo "Alle Kleinbuchstaben in Großbuchstaben umwandeln"
echo "echo \${msg^^}"
echo "---"
echo ${msg^^}
echo ""
#
echo "#UUID: https://en.wikipedia.org/wiki/Universally_unique_identifier"
echo "uuid=\$(cat /proc/sys/kernel/random/uuid)"
echo "---"
uuid=$(cat /proc/sys/kernel/random/uuid)
echo "\$uuid     : $uuid"
echo "\${uuid^^} : ${uuid^^}"
echo ""
#
echo "Alternative Methode: Alle Kleinbuchstaben in Großbuchstaben umwandeln"
echo "echo \$uuid | tr '[:lower:]' '[:upper:]'"
echo "---"
echo $uuid | tr '[:lower:]' '[:upper:]'
echo ""
#
###############################################################################
#
echo "msg=\"Hello World!\""
msg="Hello World!"
echo "---"
echo ""
#
echo "Erstes Zeichen in einen Kleinbuchstaben umwandeln"
echo "echo \${msg,}"
echo "---"
echo ${msg,}
echo ""
#
echo "Alle Großbuchstaben in Kleinbuchstaben umwandeln"
echo "echo \${msg,,}"
echo "---"
echo ${msg,,}
echo ""
#
echo "Alternative Methode: Alle Großbuchstaben in Kleinbuchstaben umwandeln"
echo "echo \$msg | tr '[:upper:]' '[:lower:]'"
echo "---"
echo $msg | tr '[:upper:]' '[:lower:]'
echo ""
#
###############################################################################
#
echo "Prüfen, ob eine Variable eine positive Zahl ohne Vorzeichen + enthält"
echo "declare -a inp=(a -1 0 +1 1)"
echo "for n in \${inp[@]}"
echo "do"
echo "    if ! [[ "\$n" =~ ^[1-9][0-9]*$ ]]"
echo "    then"
echo "        echo \"$n - keine positive Zahl ohne Vorzeichen +\""
echo "    else"
echo "        echo \"$n - positive Zahl ohne Vorzeichen +\""
echo "    fi"
echo "done"
echo "---"
#
declare -a inp=(a -1 0 +1 1)
for n in ${inp[@]}
do
    if ! [[ "$n" =~ ^[1-9][0-9]*$ ]]
    then
        echo "$n - keine positive Zahl Zahl ohne Vorzeichen +"
    else
        echo "$n - positive Zahl Zahl ohne Vorzeichen +"
    fi
done
echo ""
#
###############################################################################
#
echo "Wert einer Zahl erhöhen"
echo "zahl=1"
echo "echo \$zahl"
echo "zahl=`expr \$zahl + 1`"
echo "echo \$zahl"
echo "---"
#
zahl=1
echo $zahl
zahl=`expr $zahl + 1`
echo $zahl
echo ""
#
###############################################################################
#
exit 0

