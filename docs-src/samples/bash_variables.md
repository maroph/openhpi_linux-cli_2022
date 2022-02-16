# Bash: Strings
Über Bash Variablen gibt es sehr viel zu sagen. Eine kurze Übericht zu diesem Thema
findet man hier: [Bash scripting cheatsheet](https://devhints.io/bash).

Ich gebe hier nur einige Beispiele an, die ich des öfteren verwende.

## Spezielle Bash Variablen

```
$BASH_VERSION : Version der verwendeten Bash
$0            : Dateiname des aufgerufenen Shell Skripts
$1, ..., $9   : die ersten 9 Argumente, die an das Shell Skript
                übergeben wurden
$$            : PID (Process Id) des Bash Prozesses
$?            : Exit Code des letzten Kommandos
                (typischerweise ein Wert >= 0 und <= 127)
$!            : PID des zuletzt in der Bash gestarten Hintergrundprozesses
```

Die Standard errno Werte sind als C/C++ Makro Definitionen in C/C++ Include
Dateien abgelegt und haben die folgende Form:

```c
#define ENOENT           2      /* No such file or directory */
```

Auf einem Debian System findet man diese Makro Definitionen in den Dateien

```
/usr/include/asm-generic/errno-base.h
/usr/include/asm-generic/errno.h
```

## Environmentvariablen
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

Beispiel:

```bash
$ msg="Hello"
$ echo "#!/bin/bash" >./tmp.bash
$ echo "echo "msg:\$msg\"" >>./tmp.bash
$ chmod 700 ./tmp.bash
$ ./tmp.bash
msg:
$ export msg
$ ./tmp.bash
msg:Hello
```

## Variable einen Wert zuweisen und ausgeben
```bash
msg="Hello World!"
echo "$msg"
```

## Länge der Zeichenkette in einer Variablen: ${#msg}
```bash
echo ${#msg}
```

## Variable schreibschützen (readonly)
```bash
msgr="Hello World! #1"
echo "$msgr"
Hello World! #1
```

```bash
declare -r msgr
msgr="Hello World! #2"
samples/bash_variables.bash: line 49: msgr: readonly variable
```

```bash
echo "$msgr"
Hello World! #1
```

## Bilden eines Teilstrings
```bash
echo "${msg:0:2}"
```

Es werden die Werte mit dem Index 0-1 ausgegeben.
Der erste Wert (1) gibt an, ab welchem Index die Ausgabe bebinnt und der zweite
Wert (2) gibt den ersten Index an, dessen Wert nicht mehr ausgegeben werden soll.

## Ist Teilstring in einem String enthalten
```bash
string='A long string'
if [[ $string == *"A long"* ]]
then
    echo "'A long' is part of the string"
fi
```

```bash
string='A long string'
if [[ $string != *"A short"* ]]
then
    echo "'A short' is not part of the string"
fi
```

## Ausgabe eines Programms in einer Variablen speichern
```bash
issue=`cat /etc/issue`
echo "$issue"
```

## Ausgabe eines Programms in einer Variablen speichern
```bash
issue=$(cat /etc/issue)
echo "$issue"
```

## Erstes Zeichen in einen Großbuchstaben umwandeln
```bash
echo ${msg^}
```

## Alle Kleinbuchstaben in Großbuchstaben umwandeln
```bash
echo ${msg^^}
```

### Alternative Methode: Alle Kleinbuchstaben in Großbuchstaben umwandeln
```bash
echo $uuid | tr '[:lower:]' '[:upper:]'
```

## Erstes Zeichen in einen Kleinbuchstaben umwandeln
```bash
echo ${msg,}
```

## Alle Großbuchstaben in Kleinbuchstaben umwandeln
```bash
echo ${msg,,}
```

### Alternative Methode: Alle Großbuchstaben in Kleinbuchstaben umwandeln
```bash
echo $msg | tr '[:upper:]' '[:lower:]'
```

## Prüfen, ob eine Variable eine positive Zahl ohne Vorzeichen + enthält
```bash
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
```

## Wert einer Zahl erhöhen
```bash
zahl=1
echo $zahl
zahl=`expr $zahl + 1`
echo $zahl
echo ""
```

Oder:

```bash
zahl=1
echo $zahl
zahl=$((zahl + 1))
echo $zahl
echo ""
```

---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[bash_variables.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/bash_variables.bash)
