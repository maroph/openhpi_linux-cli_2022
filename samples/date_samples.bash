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
echo "Beispiele für das Kommando date"
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
echo "Einfacher Zeitstempel für Logdateien und temporäre Dateien"
echo "date +\"%Y%m%d%H%M%S\""
echo "    %Y : Jahr vierstellig"
echo "    %m : Monat (01, 02, ..., 12)"
echo "    %d : Tag im Monat (01, ..., 31)"
echo "    %H : Stunde (00, 01, ..., 23)"
echo "    %M : Minute (00, 01, ..., 60)"
echo "    %S : Sekunde (00, 01, ..., 60)"
echo "---"
date +"%Y%m%d%H%M%S"
echo ""
#
###############################################################################
#
echo "RFC3339: Date and Time on the Internet: Timestamps"
echo "https://datatracker.ietf.org/doc/html/rfc3339"
echo "RFC3339 Zeitstempelformat erzeugen"
echo ""
echo "date +\"%Y-%m-%dT%H:%M:%S%:z\""
echo "---"
date +"%Y-%m-%dT%H:%M:%S%:z"
echo ""
echo "Ausgabe in UTC Zeit"
echo "date --utc +\"%Y-%m-%dT%H:%M:%S%:z\""
echo "---"
date --utc +"%Y-%m-%dT%H:%M:%S%:z"
echo ""
#
###############################################################################
#
echo "ISO 8601 Zeitstempelformat erzeugen"
echo "Weitere Details: RFC 3339 vs ISO 8601"
echo "https://ijmacd.github.io/rfc3339-iso8601/"
echo ""
echo "date +\"%Y-%m-%dT%H:%M:%S%z\""
echo "---"
date +"%Y-%m-%dT%H:%M:%S%z"
echo ""
#
###############################################################################
#
echo "Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit"
echo "date +%s"
echo "---"
date +%s
echo ""
#
echo "Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit in Datum umwandeln"
echo "now=\$(date +%s)"
echo "echo \"\${now}\""
echo "date --date=@\${now}"
echo "date --date=@\${now} +\"%Y-%m-%dT%H:%M:%S%:z\""
echo "date --utc --date=@\${now} +\"%Y-%m-%dT%H:%M:%S%:z\""
echo "---"
now=$(date +%s)
echo "${now}"
date --date=@${now}
date --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
date --utc --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
echo ""
#
###############################################################################
#
exit 0

