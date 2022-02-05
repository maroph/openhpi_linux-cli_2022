# Beispiele für das Kommando date
## Einfacher Zeitstempel für Logdateien und temporäre Dateien

Ausgabeformat: YYYYMMDDhhmmss
```bash
date +"%Y%m%d%H%M%S"
20220205171709
```

## RFC3339 Zeitstempelformat erzeugen
[RFC3339: Date and Time on the Internet: Timestamps](https://datatracker.ietf.org/doc/html/rfc3339)

```bash
date +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T17:17:09+01:00
```

### Ausgabe in UTC Zeit
```bash
date --utc +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T16:17:09+00:00
```

## Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit
In Linux wird die Zeit intern in Sekunden (oder auch Milli- bzw. Nanosekunden) seit
dem 01.01.1970 um 00:00:00 Uhr UTC Zeit berechnet. In vielen Logdateien wird dieser
Wert als Zeitstempel benutzt. Mit dme date Kommando kann man sich diesen Wert 
ausgeben lassen:

```bash
date +%s
1644077829
```
#
### Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit in Datum umwandeln
Findet man in einer Logdatei so einen Zeitstempel, kann man ihn mit dem date
Kommando einfach in ein Datum samt Uhrzeit.

Zuerst holen wir uns einen Zeitstempel (um Beispiel die aktuelle Zeit)

```bash
now=$(date +%s)
echo "${now}"
1644077829
```

Diesen Zeitstempel kann man folgendermaßen im date Kommando nutzen

```bash
date --date=@${now}
Sat 05 Feb 2022 05:17:09 PM CET
```

Zusätzlich kann man auf ein Ausgabeformat angeben (hier das RFC3339 Format)

```bash
date --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T17:17:09+01:00
```

Alternativ kann man auch eine Ausgabe in der UTC Zeit erhalten

```bash
date --utc --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T16:17:09+00:00
```

---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[date_samples.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/date_samples.bash)

