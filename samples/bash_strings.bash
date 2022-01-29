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
echo "Beispiele: Bash Strings"
echo ""
echo "Bash Version : ${BASH_VERSION}"
echo ""
echo ""
#
###############################################################################
#
msg="Hello World!"
echo "$msg"
#
echo "length of string: ${#msg}"
#
echo "${msg:0:2}"
#
# first char to upper
echo ${msg^}
#
#  all chars to upper
echo ${msg^^}
#
# first char to lower
echo ${msg,}
#
#  all chars to lower
echo ${msg,,}
#
###############################################################################
#
exit 0

