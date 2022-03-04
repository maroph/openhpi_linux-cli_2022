# Bash: Funktionen
Werden Blöcke von Statements in einem Skript an mehreren Stellen verwendet, ist
praktisch, diese Blöcke an einer Stelle im Skript zu hinterlegen und dann überall
dort, wo diese Blöcke genutzt werden, auf diese Stelle zu verweisen.

In der Bash sind das Funktionen, die man deklariert. Diese Funktionen können dann
innerhalb eines Skripts aufgerufen werden.

## Funktionsdeklaration
Funktionen können auf zwei Arten deklariert werden.

Variante 1  

```bash
function function_name() {
    statement1
    ...
    statementN
}
```

Variante 2  

```bash
function_name() {
    statement1
    ...
    statementN
}
```

## Funktionsdeklaration und Aufruf
Hier ein einfaches Besipiel in beiden Varianten

```bash
function hallo1() {
    echo "Hallo1!"
}
hallo1
```

```bash
hallo2() {
    echo "Hallo2!"
}
hallo2
```

Der Aufruf einer Funktion sieht genauso aus wie der Aufruf eines
Kommandos/Programms.

## Übergabeparameter
Parameter werden genau wie bei Kommandos übergeben. Im Scope der Funktion kann
man für den Zugriff auf die Parameter die Shell Variable $1, ,,, $9, $#, $*, $@

```bash
function zeigeUebergabeParameter() {
    echo "Anzahl Parameter : $#"
    echo "Parameter 1      : $1"
    echo "Parameter 2      : $2"
    echo "Alle Parameter:"
    echo "$@"
}
zeigeUebergabeParameter p1 p2 p3 p4
```

```
Anzahl Parameter : 4
Parameter 1      : p1
Parameter 2      : p2
Alle Parameter:
p1 p2 p3 p4
```

## Globale/Lokale Variablen
Variablen, die außerhalb einer Funktion deklariert wurden (globale Variablen),
können auch innerhalb einer Funktion genutzt und geändert werden.

Wird eine Variable in einer Funktion deklariert, ist sie nach dem Aufruf der Funktion
auf außerhald der Funktion deklariert und ist damit auch eine globale Variable.

Den Gültigkeitsbereich einer Variablen kann man auf eine Funktion beschränken, wenn
man sie in der Funktion vor einer Variablendeklaration das Schlüsselwort _local_
setzt.

```bash
var1=1
var2=2
#
use_of_variables() {
    local var1=10
    var2=7
    var3=42
    local var4=2525
    echo "In der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
}
#
echo "Vor dem Aufruf der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
use_of_variables
echo "Nach dem Aufruf der Funktion: var1: $var1, var2: $var2, var3: $var3, var4: $var4"
```

```
Vor dem Aufruf der Funktion: var1: 1, var2: 2, var3: , var4:
In der Funktion: var1: 10, var2: 7, var3: 42, var4: 2525
Nach dem Aufruf der Funktion: var1: 1, var2: 7, var3: 42, var4:
```

## Rückgabewert
Der Rückgabewert einer Bash Funktion ist der Exit Code des letzten ausgeführten
Statements.

```bash
FULL_SCRIPT_NAME=$0
#
function file_size() {
    stat --format "%n: %s Bytes" $1
}
file_size ${FULL_SCRIPT_NAME}
echo "exit code : $?"
echo ""
file_size diese_datei_gibt_es_nicht
echo "exit code : $?"
echo ""
```

Der obige Coder erzeugt die folgende Ausgabe:

```
./bash_functions.bash: 3314 Bytes
exit code : 0

stat: cannot statx 'diese_datei_gibt_es_nicht': No such file or directory
exit code : 1
```

Mit dem Schlüsselwort _return_ kann man eine Funktion jederzeit beenden und einen 
Exit Code setzen.

```bash
FULL_SCRIPT_NAME=$0
#
function file_size_return() {
    return 42
    stat --format "%n: %s Bytes" $1
}
file_size_return ${FULL_SCRIPT_NAME}
echo "exit code : $?"
```

Ausgabe:

```
exit code : 42
```

---

Ein Skript, dass alle hier gezeigten Beispiele ausführt, findet man hier:
[bash_functions.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/bash_functions.bash)
