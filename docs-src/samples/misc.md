# Verschiedenes

## Shell Zen
[zen.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/zen.bash)
ist ein kleines Skript zur Entspannung. Wesentlicher Teil des Skripts ist eine 
Schleife:

```bash
count=0
maxcount=10
while [ ${count} -lt ${maxcount} ]
do
    ...
    count=$((count + 1))
done
```

Ablauf: so lange die Variable count kleiner als die Variable maxcount ist, wird die 
Schleife durchlaufen. Am Ende der Schleife wird der Wert der Variablen count um 1
vergrößert.
