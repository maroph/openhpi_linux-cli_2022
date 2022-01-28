# Bash: Assoziative Arrays

## Anlegen eines Arrays
### Anlegen eines leeren Arrays

```bash
declare -A aArray
```

### Anlegen eines vorbelegten Arrays
```bash
declare -A aArrayPre=( [key1]=val1 [key2]=val2 [key3]=val3 )
```

## Key/Value Paare zu einem Array hinzufügen
```bash
aArray["key1"]="value1"
aArray["key2"]="value2"
```

## "Zugriff auf ein Element mit dem Schlüssel (key)
```bash
echo "${aArray["key1"]}"
echo "${aArray["key2"]}"
```

## Länge eines Arrays
```bash
echo "Länge des Arrays aArray : ${#aArray[@]}"
```

## Iteration über den Schlüssel (key)
```bash
for key in "${!aArray[@]}"
do
    echo "key : ${key}"
    echo "key : ${key} , value: ${aArray[${key}]}"
done
```

## Iteration über den Wert (value)
```bash
for value in "${aArray[@]}"
do
    echo "value: ${value}"
done
```

## Prüfen, ob ein Schlüssel (key) im Array enthalten ist
```bash
if [ ${aArray[key1]+_} ]
then
    echo "key1 gefunden"
fi
```

## Prüfen, ob ein Schlüssel (key) im Array nicht enthalten ist
```bash
if [ ! ${aArray[keyNONE]+_} ]
then
    echo "keyNONE nicht gefunden"
fi
```

## Löschen eines Schlüssels aus einem Array
```bash
unset aArray[key1]
```

## "Löschen eines Arrays
```bash
unset aArray
```
---

Ein Skript, dass alle hier beschriebene Operationen ausführt, findet man hier:
[bash_aArrays.bash](https://github.com/maroph/openhpi_linux-cli_2022/blob/main/samples/bash_aArrays.bash)
