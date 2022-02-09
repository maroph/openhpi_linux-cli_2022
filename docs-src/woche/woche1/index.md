# Woche 1

## Tastenkombinationen

```
Strg + C
Strg + D
Strg + Shift + C        in das Clipboard kopieren
Strg + Shift + V        aus dem Clipboard einfügen
Strg + L                Bildschirm leeren
Tab                     automatische Vervollständigung
Pfeiltasten oben/unten  zuletzt benutze Befehle
man <befehl>            öffntet das Manual für dne entsprechenden Befehl
```

## Unix-Dateirechte
Für Dateien/verzeichnisse in Linux gibt es 3 Standardzugriffsrechte:

```
r : Leserecht
w : Schreibrecht
x : Ausführungsrecht
```

**Leserecht**  
```
Datei       : die Datei darf gelesen werden
Verzeichnis : der Inhalt des Verzeichnisses darf gelesen werden (ls dir)
```

**Schreibrecht**  
```
Datei       : die Datei darf geschrieben und auch gelöscht werden.
Verzeichnis : es dürfen Dateien/Verzeichnisse in diesem Verzeichnis
              angelegt werden.
              Dateien dürfen geschrieben und gelöscht werden.
              Verzeichnisse dürfen gelöscht werden.
              Für beides gilt: das Objekt (Datei/Verzsichnis) im Verzeichnis
              muss ebenfalls das Schreibrecht gesetzt haben.
```


**Ausführungsrecht**  
```
Datei       : Dateien, die ein Skript oder ein Programm enthalten,
              dürfen ausgeführt werden.
Verzeichnis : Ausführbare Dateien im Verzeichnis dürfen aufgeführt werden.
              
              Hinweis: ist das Ausführungsrecht vergeben, aber die Datei
              enthält weder ein Programm noch ein Skript, gibt die Shell
              eine Fehlermeldung aus.
```

Diese 3 Dateizugriffsrechte kann man auf 3 Ebenen vergeben:

- Besitzer (user)
  Das Recht gilt für den Benutzer, der beim Anlegen einer Datei auch
  ihr Besitzer ist.
- Gruppe (group)
  Jeder Linux Benutzer gehört zu mindestens einer Gruppe. Die jeweiligen Rechte
  kann man auch der Gruppe gewähren.
- Andere (other)
  Alle Benutzer, die nicht zur Gruppe gehören, gehören zu den anderen.  
  Diesen kann man ebenfalls Rechte gewähren.

Weitere Details findet man im Wikipedia Artikel [Unix-Dateirechte](https://de.wikipedia.org/wiki/Unix-Dateirechte).

## Debian Paktetverwaltung
Weiß man nicht genau, in welchem Debian Paket ein Programm enthalten ist, kann
man das Pakte mit Hilfe der [Debian-Paketsuche](https://packages.debian.org/index)

## Daten für die Praktische Übung 1.9
Die Daten für die Praktische Übung 1.9 habe ich hier abgelegt:

- [week1-dir/](https://github.com/maroph/openhpi_linux-cli_2022/tree/main/samples/week1-dir)  
  Ausgepacktes Archiv
- [week1-dir.tar.gz](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/week1-dir.tar.gz)  
  TAR Datei der Daten
- [week1-dir.zip](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/week1-dir.zip)  
  Die original ZIP Datei

Auspacken der TAR Datei:

```bash
tar xvf week1-dir.tar.gz
```
finden.
