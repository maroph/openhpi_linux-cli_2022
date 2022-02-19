#!/bin/bash
#
###########################################################
# Copyright (c) 2022 by Manfred Rosenboom                 #
#                                                         #
# This work is licensed under a Creative Commons          #
# Attribution 4.0 International License.                  #
# CC-BY 4.0: https://creativecommons.org/licenses/by/4.0/ #
###########################################################
#
#######################################################################
#
# Password will be checked against the data on the Pwned Passwords site
# https://haveibeenpwned.com/Passwords
# 
# The query API is described here
# https://www.troyhunt.com/ive-just-launched-pwned-passwords-version-2/#cloudflareprivacyandkanonymity
#
# Or also in this German article:
# Nach dem Passwort-Leak: Eigene Passwörter lokal checken
# https://www.heise.de/security/artikel/Nach-dem-Passwort-Leak-Eigene-Passwoerter-lokal-checken-4284756.html
#
###############################################################################
#
declare -r SCRIPT_NAME=`basename $0`
declare -r VERSION="$SCRIPT_NAME  1  (19-FEB-2022)"
#
###############################################################################
#
print_usage() {
    cat <<EOT

Usage: ${SCRIPT_NAME} [<options>] <password>
       Check password against data on the Pwned Passwords site
       https://haveibeenpwned.com/Passwords

    Options:
    -h|--help    : show this help text and exit
    -V|--version : show version information and exit
    -v|--verbose : verbose mode

    Arguments:
    password : the password to check

    Output:
        ${SCRIPT_NAME}: number of hits : <#hits>
    or
        ${SCRIPT_NAME}: password not found

EOT
}
#
###############################################################################
#
verbose=0
curl_opt="--silent"
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
        -v | --verbose)
            verbose=1
            curl_opt="-w %{http_code}"
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
if [ "$1" = "" ]
then
    echo "${SCRIPT_NAME}: password missing"
    exit 1
fi
password="$1"
#
###############################################################################
#
# build SHA-1 hash of the password string
hash=`echo -n ${password} | sha1sum | awk '{ print $1; }' | tr '[a-z]' '[A-Z]'`
#
# extract the password database lookup string
lookup=${hash:0:5}
#
# extract the rest for lookup in the result set
rest=${hash:5}
#
if [ ${verbose} -eq 1 ]
then
    echo "password : ${password}"
    echo "hash     : ${hash}"
    echo "lookup   : ${lookup}"
    echo "rest     : ${rest}"
    echo "----------"
fi
#
###############################################################################
#
rm -f ./${SCRIPT_NAME}.txt
touch ./${SCRIPT_NAME}.txt
chmod 600 ./${SCRIPT_NAME}.txt
#
###############################################################################
#
# send a request with the lookup string
curl --tlsv1.3 ${curl_opt} -o ./${SCRIPT_NAME}.txt https://api.pwnedpasswords.com/range/${lookup}
#
if [ ${verbose} -eq 1 ]
then
    echo ""
    echo "----------"
fi
#
if [ -s ./${SCRIPT_NAME}.txt ]
then
    grep ${rest} ./${SCRIPT_NAME}.txt >/dev/null
    if [ $? -ne 0 ]
    then
        echo "${SCRIPT_NAME}: password not found"
    else
        echo -n "${SCRIPT_NAME}: number of hits : "
        grep ${rest} ./${SCRIPT_NAME}.txt | sed -e 's/^.*://'
    fi
else
    echo "${SCRIPT_NAME}: no data received"
    exit 1
fi
#
###############################################################################
#
rm -f ./${SCRIPT_NAME}.txt
exit 0

