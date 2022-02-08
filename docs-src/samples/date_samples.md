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

## ISO 8601 Zeitstempelformat erzeugen

```bash
date +"%Y-%m-%dT%H:%M:%S%z"
2022-02-05T17:17:09+0100
```

D.h: der einzige Unterschied ist der Doppelpunkt (:) in der Zeitzonenangabe. Das 
RFC3339 Format ist aber auch ein gültiges ISO 8601 Format.

Weitere Details findet man hier: [RFC 3339 vs ISO 8601](https://ijmacd.github.io/rfc3339-iso8601/).

## Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit

In Linux wird die Zeit intern in Sekunden (oder auch Milli- bzw. Nanosekunden) seit
dem 01.01.1970 um 00:00:00 Uhr UTC Zeit berechnet. In vielen Logdateien wird dieser
Wert als Zeitstempel benutzt. Mit dme date Kommando kann man sich diesen Wert 
ausgeben lassen:

```bash
date +%s
1644077829
```

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

Zusätzlich kann man auch ein Ausgabeformat angeben (hier das RFC3339 Format)

```bash
date --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T17:17:09+01:00
```

Alternativ kann man auch eine Ausgabe in der UTC Zeit erhalten

```bash
date --utc --date=@${now} +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-05T16:17:09+00:00
```

## Git: Letzten commit Zeitstempel für eine Datei ausgeben

Den Zeitstempel, in Sekunden seit dem 01.01.1970, 00:00:00 Uhr UTC-Zeit, erhält
man folgendermaßen:

```bash
git log -1 --format=%ct docs-src/samples/date_samples.md
1644230639
```

Das zugehörige Datum kann man dann so ausgeben:

```bash
date --date=@1644230639
Mon 07 Feb 2022 11:43:59 AM CET
```

Hier noch der Zeitstempel im RFC3339 Format:

```bash
date --date=@1644230639 +"%Y-%m-%dT%H:%M:%S%:z"
2022-02-07T11:43:59+01:00
```

---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[date_samples.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/date_samples.bash)

