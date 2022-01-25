# Über diese Site
Der gesamte Inhalt dieser Site (HTML und Skripte) ist abgelegt in meinem
GitHub Repository
[openhpi_linux-cli_2022](https://github.com/maroph/openhpi_linux-cli_2022/).

## Struktur der Site

* docs  
  Inhalt dieser Site
* docs-src  
  Markdown Sourcen dieser Site
* LICENSE  
  Lizenz des Repositories (CC-BY 4.0)
* README.md  
  Readme Datei des Repositories
* mkdocs.yml  
  [MkDocs](https://www.mkdocs.org/) Konfigurationsdatei

## MkDocs Virtual Environment
Für MkDocs verwende ich das folgende Virtual Environment:

```bash
python3 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip
python -m pip install --upgrade setuptools
python -m pip install --upgrade wheel
python -m pip install --upgrade mkdocs
```

Sollte das Modul venv nicht installiert sein, muss man das Package python3-venv
installieren.

Auf Debian/Ubuntu/Raspbian geht das mit dem folgenden Kommando

    sudo apt install python3-venv

## Lokale Erzeugung der Site

    ./build

## Veröffentlichung der Site
Für mein GitHub Repository 
[openhpi_linux-cli_2022](https://github.com/maroph/openhpi_linux-cli_2022/)
habe ich die GitHub Page 

<https://maroph.github.io/openhpi_linux-cli_2022/>

konfiguriert. Für diese GitHub Page werden die Daten aus dem Verzeichnis docs 
im Branch main verwendet.

Um diese Page zu aktualisieren, muss man die Änderungen im lokalen Git Repository
committen und in das GitHub Repository pushen:

    git commit -m "my commit message"
    git push

Nach einer relativ kurzen Zeit sind die Änderungen auf der GitHub Page zu sehen.

