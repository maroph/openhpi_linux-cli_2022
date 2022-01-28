# Bash: Arrays

## Anlegen eines Arrays
### Anlegen eines leeren Arrays

```bash
declare -a array
```

### Anlegen eines vorbelegten Arrays
```bash
declare -a arrayPre=(wert1 wert2 wert3 wert4)
```

## Werte an ein Array anhängen
```bash
array+=("wert1")
array+=("wert2")
array+=("wert3")
array+=("wert4")
```

## Zugriff auf ein Element mit Index
Das erste Element in einem Bash Array hat den Index 0.

```bash
echo "${array[0]}"
echo "${array[1]}"
```

## Einer Wert mit Index setzen
```bash
array[1]="wert2_neu"
echo "${array[1]}"
```

```bash
array[5]="wert5"
echo "${array[5]}"
```
Was ist der Wert vom Element mit dem nicht belegtem Index 4 ?

```bash
echo "${array[4]}"
```
Da dem Array mit dem Index 4 noch kein Wert zugewiesen wurde, wird der Ausdruck
_${array[4]}_ zu einem Leerstring expandiert

## Länge eines Arrays
```bash
echo "Länge des Arrays array    : ${#array[@]}"
echo "Länge des Arrays arrayPre : ${#arrayPre[@]}"
```

## Array kopieren
```bash
array2=("${array[@]}")
```

## Array konkatenieren
```bash
array3=("${array[@]}" "${array2[@]}")
```

## Teilbereich (von/bis) eines Arrays ausgeben
```bash
echo "${array[@]:1:4}"
```
Es werden die Werte mit dem Index 1-3 ausgegeben.
Der erste Wert (1) gibt an, ab welchem Index die Ausgabe bebinnt und der zweite
Wert (4) gibt den ersten Index an, dessen Wert nicht mehr ausgegeben werden soll.

## Ausgabe des gesamten Arrays
```bash
echo "${array[@]}"
```

## Werte bei der Ausgabe ersetzen
```bash
echo "${array[@]/wert/value}"
```
Dieser Ausdruck gibt alle Werte des Array aus. Dabei wird der String "wert" durch den
String "value" ersetzt.

## Iteration über ein Array
```bash
for wert in "${array[@]}"
do
    echo "Wert : ${wert}"
done
```

## Prüfen, ob ein Wert im Array enthalten ist
```bash
if [[ " ${array[@]} " =~ " wert1 " ]]
then
    echo "der Wert wert1 ist im Array array enthalten"
fi
```

## Prüfen, ob ein Wert nicht im Array enthalten ist
```bash
if [[ ! " ${array[@]} " =~ " wertNONE " ]]
then
    echo "der Wert wertNone ist im Array array NICHT enthalten"
fi
```

## Löschen eines Elementes aus einem Array
```bash
unset array[5]
```

##  Löschen eines Arrays
unset array

## Zeilenweises Einlesen einer Datei in ein Array
Diesen Code habe ich in der
[BashFAQ/005](https://mywiki.wooledge.org/BashFAQ/005)
im Kapitel "2.1. Loading lines from a file or stream" gefunden.

```bash
mapfile -t array < ./tmp.txt
echo "Anzahl gelesener Zeilen: \${#array[@]}: ${#array[@]}"
for line in "${array[@]}"
do
    echo ">>>>> ${line}"
done
```

---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[bash_arrays.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/bash_arrays.bash)

