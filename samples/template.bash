#!/bin/bash
#
###########################################################
# Bash Script Template                                    #
# Copyright (c) 2022 by Manfred Rosenboom (maroph@pm.me)  #
#                                                         #
# This work is licensed under a Creative Commons          #
# Attribution 4.0 International License.                  #
# CC-BY 4.0: https://creativecommons.org/licenses/by/4.0/ #
###########################################################
#
SCRIPT_NAME=`basename $0`
SCRIPT_DIR=`dirname $0`
VERSION="$SCRIPT_NAME  1  (08-MAR-2021)"
#
###############################################################################
#
cwd=`pwd`
if [ "${SCRIPT_DIR}" = "." ]
then
    SCRIPT_DIR=${cwd}
else
    cd ${SCRIPT_DIR}
    SCRIPT_DIR=`pwd`
    cd ${cwd}
fi
cwd=
unset cwd
#
###############################################################################
#
umask 0027
export LANG="en_US.UTF-8"
#
###############################################################################
#
number=42
string="Don't Panic!"
#
###############################################################################
#
print_usage() {
    cat <<EOT

Usage: ${SCRIPT_NAME} [<options>] <arg1> [<arg2> ...]
       This command ...

    Options:
    -h|--help    : show this help and exit
    -V|--version : show version information and exit
    -n|--number <number> : an integer > 0 (default: ${number})
    -s|--string <string> : a non empty string (default: ${string})

    Arguments:
    arg1 : argument #1
    arg2 : argument #2
    ...
    argN : argument #N

EOT
}
#
###############################################################################
#
while :
do
    option=$1
    case "$1" in
        -h | --help)    
            print_usage
            exit 0
            ;;
        -V | --version)
            echo $VERSION
            exit 0
            ;;
        -n | --number)
            shift
            if [ "$1" = "" ]
            then
                echo "${SCRIPT_NAME}: option ${option} : number missing"
                exit 1
            fi
            if ! [[ "$1" =~ ^[1-9][0-9]*$ ]]
            then
                echo "${SCRIPT_NAME}: option ${option}: value is not a positive integer number"
                exit 1
            fi
            number=$1
            ;;
        -s | --string)
            shift
            if [ "$1" = "" ]
            then
                echo "${SCRIPT_NAME}: option ${option} : string missing"
                exit 1
            fi
            string=$1
            ;;
        --)
            shift 1
            break
            ;;
        --*)
            echo "${SCRIPT_NAME}: '$1' : unknown option"
            exit 1
            ;;
        -*)
            echo "${SCRIPT_NAME}: '$1' : unknown option"
            exit 1
            ;;
        *)  break;;
    esac
#
    shift 1
done
#
###############################################################################
#
if [ $# -eq 0 ]
then
    echo "${SCRIPT_NAME}: argument(s) missing"
    print_usage
    exit 1
fi
#
arg1=$1
#
###############################################################################
#
#
#
###############################################################################
#
exit 0

