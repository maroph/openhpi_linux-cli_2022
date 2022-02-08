# Über diese Site
Der gesamte Inhalt dieser Site (HTML und Skripte) ist abgelegt in meinem
[GitHub Repository](https://github.com/maroph/openhpi_linux-cli_2022/).

## Benutzte Linux Versionen
Für meine Beispiele habe ich die folgenden Linux Versionen benutzt:

**Debian 11.2 on WSL2 (Windows Subsystem for Linux)**
```bash
echo $BASH_VERSION
5.1.4(1)-release
```

**Raspberry Pi OS 10.11**
```bash
echo $BASH_VERSION
5.0.3(1)-release
```

## Struktur der Site
Die Daten auf dieser Site sind folgendermaßen strukturiert:

* docs  
  Inhalt dieser [Site](https://maroph.github.io/openhpi_linux-cli_2022/)
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
python -m pip install --upgrade mkdocs-material
python -m pip install --upgrade mkdocs-git-revision-date-plugin
```

Sollte das Modul venv nicht installiert sein, muss man das Package python3-venv
installieren.

Auf Debian/Ubuntu/Raspbian geht das mit dem folgenden Kommando

```bash
sudo apt install python3-venv
```

## Lokale Erzeugung der Site

```bash
./build
```

## Veröffentlichung der Site
Für mein GitHub Repository habe ich die GitHub Page 

<https://maroph.github.io/openhpi_linux-cli_2022/>

konfiguriert. Für diese GitHub Page werden die Daten aus dem Verzeichnis docs 
im Branch main verwendet.

Um diese Page zu aktualisieren, muss man die Änderungen im lokalen Git Repository
committen und in das GitHub Repository pushen:

```bash
git commit -m "my commit message"
git push
```

Nach einer relativ kurzen Zeit sind die Änderungen auf der GitHub Page zu sehen.

