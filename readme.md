# Docker Container für die SDDI CKAN-Katalogplattform

Die Themenplattform Smarte Städte und Regionen setzt unter anderem die [Smart District Data Infrastructure (SDDI)](https://www.lrg.tum.de/gis/projekte/sddi/) Strategie für den Aufbau einer Dateninfrastruktur in smarten Städten und Regionen. SDDI wurde im Ramen des [Smart Sustainable Districts (SSD)](https://www.lrg.tum.de/gis/projekte/smart-sustainable-districts-ssd/) Projekts entwickelt und enthält als zentralen Inhalt eine Katalogplattform, in der alle relevanten Daten, Projekte und Dienste registriert sind.

Dieses Repository enthält alle benötigten Dateien, um eine Instanz einer [CKAN-Katalogplattform](https://ckan.org) mitsamt allen für SDDI relevanten Erweiterungen in einem Docker Container aufzusetzen.


## Features

* Setup Script um die Katalogplattform mittels docker-compose aufzusetzen
* Setup Scripte um vordefinierte Gruppen und Organisationen im Katalog anzulegen
* Setup Scripte mit Beispielen für eigene Gruppen und Organisationen


## Inhalt

* [Features](#features)
* [Inhalt](#inhalt)
* [SDDI und die Katalogplattform](#sddi-und-die-katalogplattform)
* [Installation](#installation)
* [Gruppen und Organisationen](#gruppen-und-organisationen)


## SDDI und die Katalogplattform

Im Ramen der [Themenplattform Smarte Städte und Regionen](https://www.bayern-innovativ.de/seite/zdb-themenplattform-digitales-planen-bauen-smart-cities-regions) wird das SDDI-Konzept verwendet, um eine Dateninfrastruktur in smarten Städten und Regionen aufzubauen. SDDI ([Smart District Data Infrastructure](https://www.lrg.tum.de/gis/projekte/sddi/)) ist ein Konzept welches am Lehrstuhl für Geoinformatik an der TUM entwickelt wurde und bereits europaweiten Einsatz findet.

Die SDDI ist modular aufgebaut und definiert einen organisatorischen und technischen Rahmen, der aus den Akteuren, Anwendungen, Sensoren, urbanen Analysewerkzeugen und einem virtuellen Distriktmodell besteht. Akteure können neben den Bürgern und der Stadtverwaltung u.a. auch die Ver- und Entsorger, Verkehrsbetriebe und die Immobilienwirtschaft sein. Sensoren können u.a. Stadtklimamessstellen, Wetterradar, Verbrauchsmessgeräte / Smart Meter, Videokameras und verkehrstechnische Sensoren sein. Urbane Analysewerkzeuge sind Softwarekomponenten, die beispielsweise die Energiebedarfe oder das Solarenergiepotenzial für alle Gebäude schätzen, Verkehrsdichte und Personenströme simulieren oder Lärmausbreitungs- und Überflutungssimulationen durchführen. Die SDDI setzt auf offene Standards und ist herstellerunabhängig.

Das Besondere an der SDDI ist, dass alle Informationen, Sensoren und Anwendungen unterschiedlicher Fachdisziplinen in einem gemeinsamen, sogenannten semantischen 3D-Stadtmodell, das auf dem internationalen CityGML-Standard basiert, verortet sind. Dieses 3D-Modell dient dabei zu mehr als nur der hübschen Visualisierung: es ist zugleich fachübergreifende Datendrehscheibe und wesentliche Grundlage für die meisten Simulationen und Analysewerkzeuge. So können z. B. der Energiebedarf der Gebäude mit ihren baulichen Zuständen und sozio-ökonomischen Kennzahlen im virtuellen Distriktmodell miteinander in Beziehung gesetzt werden und die Auswirkungen geplanter Umbauprojekte auf die verschiedenen Bereiche wie Umwelt, Mobilität, Energie und Soziales gleichzeitig betrachtet werden. Mit der SDDI werden dabei bestehende Informationssysteme nicht ersetzt, sondern auf der Basis internationaler Standards intelligent miteinander vernetzt.
![SDDI-Konzept](images/sddi.png?raw=true "SDDI-Konzept")

Im Zentrum der SDDI steht der Katalogdienst, der die verfügbaren Ressourcen registriert und so eine Übersicht darüber schafft, was bereits vorhanden ist, und wo. Das Wort "Ressourcen" dient hierbei als Überbegriff für Datensätze, Online-Dienste, Projekte, und mehr. Die Katalogplattform selbst ist ein zentraler Speicherort, die Ressourcen selbst sind dezentral bei den jeweiligen Eigentümern hinterlegt. Der Katalog verweist somit nur auf den tatsächlichen Speicherort, und kann daher auch als Metadatenkatalog angesehen werden.

Die Katalogplattform basiert auf der Open Source Software [CKAN](https://ckan.org) und ist mit zahlreichen Erweiterungen ausgestattet, um den Anforderungen der SDDI gerecht zu werden. CKAN verfügt über moderne Indizierungs- und Suchfunktionen und kann nach eigenen Zwecken sehr leicht modifiziert werden.
![Startseite der Katalogplattform](images/catalog.png?raw=true "Startseite der Katalogplattform")

## Installation
Dieses Kapitel beschreibt wie die Katalogplattform als Docker Container installiert werden kann.

1. Installieren Sie [Docker](https://docs.docker.com/get-docker/) auf Ihrem Betriebssystem.
2. Clonen Sie die SDDI-CKAN-Docker Installationsdateien in ein beliebiges Verzeichnis auf Ihrem Computer:
```bat
cd INSTALL_DIRECTORY
git clone https://github.com/tum-gis/SDDI-CKAN-Docker.git
```
3. Öffenen Sie die Datei */SDDI-CKAN-Docker source files/contrib/docker/.env.template* mit einem Texteditor. Ändern Sie den Wert CKAN_SITE_URL auf die Adresse unter der der Katalog erreichbar sein soll, und setzen Sie ein neues Passwort für die Datenbank im Wert POSTGRES_PASSWORD. Speichern Sie die Datei und benennen Sie sie anschließend in *.env* um.
4. Führen Sie die Datei *Setup CKAN Docker.bat* im Hauptverzeichnis aus. Dieser Schritt wird einige Minuten dauern.
5. Führen Sie die Datei *Setup Gruppen SDDI Themenplattform* aus. Wird dieser Schritt übersprungen, kann es aktuell noch im Katalog zu Fehlern kommen.


## Gruppen und Organisationen

### Gruppen

Im Ramen der Themenplattform Smarte Städte und Regionen sind 8 Hauptkategorien, und 16 Nebenkategorien entstanden, die dabei helfen Datensätze übersichtlich zu ordnen. Diese Gruppen können mittels eines Scriptes installiert werden.
Führen Sie hierzu die Datei *Setup Gruppen SDDI Themenplattform.bat* aus.

Um eigene Gruppen zu erstellen, kann die Datei *Setup Gruppen Template.bat* verwendet werden. Öffnen Sie sie mit einem Texteditor und bearbeiten Sie ihre Gruppe(n).


### Gruppen

In CKAN werden Benuter verschiedenen Organisationen zugeordnet. Die Katalogplattform kann direkt mit den organisationen befüllt werden, welche in der Themenplattform Smarte Städte und Regionen eine Rolle spielen.
Führen Sie hierzu die Datei *Setup Organisationen SDDI Themenplattform.bat* aus.

Um eigene Gruppen zu erstellen, kann die Datei *Setup Organisationen Template.bat* verwendet werden. Öffnen Sie sie mit einem Texteditor und bearbeiten Sie ihre Gruppe(n).


## Weitere Befehle ?


## ...