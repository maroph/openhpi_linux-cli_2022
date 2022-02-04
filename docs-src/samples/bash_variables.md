# Bash: Strings
Über Bash Variablen gibt es sehr viel zu sagen. Ich gebe deshalb hier nur einige
Beispiele an, die ich des öfteren verwende.

## Variable einen Wert zuweisen und ausgeben
```bash
msg="Hello World!"
echo "$msg"
```

## Länge der Zeichenkette in einer Variablen: ${#msg}
```bash
echo ${#msg}
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

---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[bash_variables.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/bash_variables.bash)
