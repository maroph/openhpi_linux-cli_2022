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

## Bash Script Template                                    #
Die Datei [template.bash](https://raw.githubusercontent.com/maroph/openhpi_linux-cli_2022/main/samples/template.bash)
enthält einen einfachen Rahmen zur Erstellung von Bash Skripten mit Optionen und
Argumenten.

**Variablen**

* SCRIPT_NAME  
  Diese Variable enthält den Namen des Skripts
* SCRIPT_DIR  
  Diese Variable enthält den vollen Pfadnamen des Verzeichnisses, in dem das
  Skript abgelegt ist.
* VERSION  
  Diese Variable enthält eine Versionsinformation zum Skript.

**Weiter Variablen** 
Diese Variaben sind nur Beispiele, die zeigen sollen, wie man Variablen über
Optionen setzen kann.

* number  
  Ein Beispiel für eine numerische Variable
* string  
  Ein Beispiel für eine String Variable

**Optionen**

    -h oder --help     : Ausgabe der Hilfeinformation und beenden des Skripts
    -V oder --version  : Ausgabe der Version und beenden des Skripts
    -n oder --number   : setzen der Variablen number
    -s oder --string   : setzen der Variablen string
    --                 : es wird nicht weiter auf Optionen geprüft
                         sinnvoll, wenn das erste Argument mit - oder --
                         beginnt.

**Argumente**  
Das Skript erwartet ein Argument. Der Wert wird in der Variablen arg1 abgelegt.

** Funktion print_usage**  
Gibt den Hilfetext aus

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

### Beispiel für eine Abfrage der Daten
Wie man diese Datenbank nutzen kann, ohne das Passwort an die Site zu übertragen,
ist im heise Artikel beschrieben. Im folgenden Beispiel wird das Passwort 
123456 benutzt.

Zuerst bildet man den SHA1 (Secure Hash Algorithm 1) Wert des Pasworts:

```bash
$ echo -n "123456" | sha1sum
7c4a8d09ca3762af61e59520943dc26494f8941b  -
```
Warum wird echo mit -n aufgerufen?

```bash
echo "123456" | sha1sum
c4f9375f9834b4e7f0a528cc65c055702bf5f24a  -
```

D.h.: man erhält einen anderen Hashwert.

```bash
$ echo -n "123456" | xxd
00000000: 3132 3334 3536                           123456
$ echo "123456" | xxd
00000000: 3132 3334 3536 0a                        123456.
```

Der Aufruf _echo_ hängt an das Ende der Zeichenkette noch das Steuerzeichen 0x0a an,
das für einen Zeilenvorschub sorgt. Da aber nur die Zeichenkette selbst gehasht 
werden soll, muss man _echo_ mit der Option _-n_ aufrufen.

Am Ende der Ausgabe des Hashwerts steht nach dem Hashwert noch " -". Diesen Teil
kann man folgendermaßen entfernen:

```bash
$ echo -n "123456" | sha1sum | awk '{ print $1; }'
7c4a8d09ca3762af61e59520943dc26494f8941b
```

Das awk Kommando bewirkt, dass von jeder gelesen Zeile (hier nur eine Zeile) das 
erste Wort ausgegeben wird.

Soweit so gut, aber: der Suchstring für die Abfrage muss Großuchstaben statt 
Kleinbuchstaben enthalten.

```bash
$ echo -n "123456" | sha1sum | awk '{ print $1; }' | tr '[a-z]' '[A-Z]'
7C4A8D09CA3762AF61E59520943DC26494F8941B
```

Man kann hier auch das folgende verwenden:

```bash
$ echo -n "123456" | sha1sum | awk '{ print $1; }' | tr '[:lower:]' '[:upper:]'
7C4A8D09CA3762AF61E59520943DC26494F8941B
```

Für die Suche werden nur die ersten 5 Zeichen ("7C4A8") gesendet. Dazu ruft man
mit einem HTTP Get Request die folgende URL auf:

https://api.pwnedpasswords.com/range/7C4A8

Als Ergebnis erhält man eine Liste von Hashwerten (ohne die ersten 5 Zeichen) und
die Anzahl der Treffer in der Datenbank. Die Zeilen haben dabei das folgende 
Format:

<Resthash>:<Trefferanzahl>

Für das Passwort 123456 sieht die Zeile folgendermaßen aus:

```
D09CA3762AF61E59520943DC26494F8941B:37359195
```

Die benötigten Wert kann man sich in der Bash folgendermaßen in Variablen
speichern:

```bash
hash=`echo -n ${password} | sha1sum | awk '{ print $1; }' | tr '[a-z]' '[A-Z]'`
#
# benutze die ersten 5 Zeichen für die Suche
lookup=${hash:0:5}
#
# benutze den Rest als Suchstring in der erhaltenen Liste
rest=${hash:5}
```

Der HTTP Get Request kann in der Shell folgendermaßen erzeugt werden:

```bash
curl --tlsv1.3 --silent -o ./checkPassword.bash.txt https://api.pwnedpasswords.com/range/7C4A8
```

Hier die Bedeutung der verwendeten curl Optionen:

```
--tlsv1.3    : verwende das TLS 1.3 Protokoll
--silent     : curl soll keine unnötigen Ausgaben machen
-o dateiname : schreibe die Antwort vom GET Request ind die Datei dateiname
```

Die erhaltenen Daten werden in der ./checkPassword.bash.txt gespeichert.

Zuerst wird dann geprüft, ob es den vom Passwort gebildet Resthash in der Datei gibt.
Ist der Exit Code der grep Suche ungleich 0, gabe es keinen Treffer. Gibt es einen 
Treffer, wird die Trefferanzahl mit einem sed Aufruf aus der Zeile herausgeholt.

```bash
grep ${rest} ./checkPassword.bash.txt >/dev/null
if [ $? -ne 0 ]
then
    echo "./checkPassword.bash.: password not found"
else
    echo -n "./checkPassword.bash: number of hits : "
    grep ${rest} ./checkPassword.bash.txt | sed -e 's/^.*://'
fi
```


### Bespielaufrufe

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

