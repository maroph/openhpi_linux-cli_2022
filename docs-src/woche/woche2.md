# Woche 2
Themen der Woche 2

- Pipes und Filters
- Konsolenanwendungen
- Komfortabel in der Kommandozeile

In den Videos wird die folgende Beispieldatei genutzt:

- [rezept.txt](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/week2-dir/rezept.txt)

## Standard Streams

- stdin 
  Stream für die Eingabedaten (z.B. Eingagen über die Tastatur)
- stdout
  Stream für die Ausgabedaten
- stderr
  Stream für die Fehlermeldungen

## Filter

Filter sind Programme, die Daten von stdin lesen und nach stdout ausgeben.

## Pipes (Pipelines)

Pipes verbinden 2 oder mehr Filter. Dabei wird die stdout Ausgabe des Vorgängers
an stdin Eingabe des Nachfolgers weitergeleitet.

## Hintergrundprozesse

Zum Thema jobs (Vodergrund-/Hintergrundprozesse) gibt es einen kurzen 
Übersichtsartikel: 
[Jobs im Griff mit jobs, bg, fg und &](https://www.linux-community.de/ausgaben/easylinux/2009/03/jobs-im-griff-mit-jobs-bg-fg-und/).

Ergänzend kann man in der Shell noch folgendes nutzen: nach dem Starten eines 
Kommandos/Prozesses im Hintergrund kann man sich seine Prozess ID (pid) über die 
Variable $! holen.

```bash
sleep 100 &
bgpid=$!
```

Die PID des laufenden Shell Prozesses bekommt man über die Variable $$. Wenn man auf 
das Ende eine Hintergrundprozesses warten will, geht das über das Kommando wait

```bash
wait $bgpid
```

Wie erkenne ich, das ein Prozess ein Hintergrundprozesse meiner Shell ist?  
Die PPID (Parent PID) des Hintergrundprozesses verweist auf die PID meines Shell
Prozesses.

Jetzt alles zusammen:

```bash
sleep 3 &
bgpid=$!
echo "pid   : $$"
echo "bgpid : $bgpid"
echo ""
ps -opid,ppid,cmd
echo "----------"
#
echo ""
wait $bgpid
ps -opid,ppid,cmd
echo "----------"
```

Die Ausgabe sieht dann im Wesentlichen so aus (die Prozesse oberhalb von -bash 
habe ich aus der Liste gelöscht):

```
pid   : 1724923
bgpid : 1724924

    PID    PPID CMD
1724826 1724825 -bash
1724923 1724826 /bin/bash ./xx
1724924 1724923 sleep 3
1724925 1724923 ps -opid,ppid,cmd
----------

    PID    PPID CMD
1724826 1724825 -bash
1724923 1724826 /bin/bash ./xx
1724926 1724923 ps -opid,ppid,cmd
----------
```

Der sleep Hintergrundprozess hat die PID 1724924 und die PPID 1724923. Das ist die 
PID von meinem laufenden Skript xx.

## Kommandos verketten
Man kann in einer Anweisung mehrere Kommandos angeben (verketten). Da jedes 
Kommando bei seiner Beendigung einen Exit Code zurückliefert, kann man mit Hilfe 
dieses Wertes die Abarbeitung der Verkettung steuern.

Der Exit Code eines Kommandos ist eine Zahl >=0 und kann direkt nach dem Ende des 
Kommandos in der Shell mit der Variablen $? abgefragt werden. Dabei bedeutet 0 ein
erfolgreiches Ende des Kommandos und ungleich 0, das ein Fehler im Ablauf des
Kommandos aufgetreten ist.

```bash
$ ls
week1-dir
$ echo $?
0
```

```bash
$ ls unbekannteDatei
ls: cannot access 'unbekannteDatei': No such file or directory
$ echo $?
2
```


### Kommandos bis zum ersten Fehler ausführen
```
kommando_1 && kommando_2 && ... && kommando_n
```

Die Kommandos werden nacheinander ausgeführt, bis ein Fehler in einem Kommando
auftritt.

Beispiel:

```bash
ls datei1 && echo "wird nur angezeigt, wenn es datei1 gibt"
```

### Kommandos bis zum ersten Erfolg ausführen
```
kommando_1 || kommando_2 || ... || kommando_n
```

Die Kommandos werden nacheinander ausgeführt, bis das erste Kommando erfolgreich
ausgeführt wurde.

Beispiel:

```bash
ls datei1 || echo "wird nur angezeigt, wenn es datei1 nicht gibt"
```

### Kommandos verketten
Mit dem Zeichen ; können Kommandos verkettet werden

```
kommando_1 ; kommando_2 ; ... ; kommando_n
```
Alle Kommandos werden nacheinander ausgeführt - egal ob ein Fehler aufgetreten ist 
oder nicht.

## Shell Eigenschaften

### Environmentvariablen
Shellvariablen sind nur in der aktuelle Shell bekannt. Environmentvariablen dagegen
werden an alle Subprozesse der Shell vererbt. Ein Subprozess ist ein Prozess, der
von der aktuellen Shell gestartet wurde. Eine Variable wird zu einer
Environmentvariablen, indem man sie mit _export_ deklariert:

```bash
export ENV_VARIABLE="Hallo"
```

Oder auch länger:

```bash
ENV_VARIABLE="Hallo"
export ENV_VARIABLE
```

All derzeit deklarierten Environmentvariablen kann man sich mit dem folgenden
Kommando ausgeben lassen:

```bash
env
```

Die folgenden Environmentvariablen sind in der Shell immer gesetzt:

- HOME
  Enthält das Homeverzeichni des Benutzers
- PATH  
  Enthält (durch : getrennt) alle Verzeichnisse, in denen die Shell nach einem
  Kommando sucht.

### alias / unalias
Mit _alias_ kann man sich ein eigenes Kommando builden.

```bash
alias ll='ls -l'
alias bilder='cd $HOME/Bilder;pwd'
```

Gibt man _ll_ ein, wird das Kommando _ls -l_ ausgeführt. Gibt man bilder ein, wird
die Kommandoverkettung _cd $HOME/Bilder;pwd_ ausgeführt.

Mit _unalias_ kann man ein vorher erzeugtes Alias läschen.

```bash
unalias ll
```

Gibt man nur _alias_ ein, werden alle deklarierten Aliases angezeigt.

```bash
alias
```

### History
Die Shell führt eine History der aufgerufenen Kommandos.

```
history     : anzeigen der History
Strg + R    : suchen in History
!!          : letztes Komando wiederholen
Kommando !! : Kommando mit dem letzten Kommando als Argument ausführen
```

