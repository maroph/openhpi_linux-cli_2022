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

## Passwort prüfen
Basierend auf dem heise Artikel
[Nach dem Passwort-Leak: Eigene Passwörter lokal checken](https://www.heise.de/security/artikel/Nach-dem-Passwort-Leak-Eigene-Passwoerter-lokal-checken-4284756.html)
habe ich mir das Skript
[checkPassword.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/checkPassword.bash)
geschrieben.

Das Skript prüft, ob das angegebene Passwort in der
[Pwned Passwords Datenbank](https://haveibeenpwned.com/Passwords)
enthalten ist. Man kann das Passwort auch auf der Site angeben, aber es wird dann
auch an die Site übertragen.

Wie man diese Datenbank nutzen kann, ohne das Passwort an die Site zu übertragen,
ist im heise Artikel beschrieben.

Hier einige Bespielaufrufe:

```bash
$ ./checkPassword.bash 123456
checkPassword.bash: number of hits : 37359195
$ ./checkPassword.bash geheim
checkPassword.bash: number of hits : 46130
$ ./checkPassword.bash secret
checkPassword.bash: number of hits : 352091
$ ./checkPassword.bash DasSuperGeheimePassword
checkPassword.bash: password not found
```
