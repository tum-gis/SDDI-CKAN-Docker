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
* [Verwendete Erweiterungen](#verwendete-erweiterungen)
* [CKAN Dokumentation und Hilfe](ckan-dokumentation-und-hilfe)
* [Lizenz](lizenz)


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

### Basis-Installation

1. Installieren Sie [Docker](https://docs.docker.com/get-docker/) auf Ihrem Betriebssystem.
2. Clonen Sie die SDDI-CKAN-Docker Installationsdateien in ein beliebiges Verzeichnis auf Ihrem Computer:  
`cd INSTALL_DIRECTORY` `git clone https://github.com/tum-gis/SDDI-CKAN-Docker.git`
3. Öffenen Sie die Datei *SDDI-CKAN-Docker source files/contrib/docker/.env.template* mit einem Texteditor. Ändern Sie den Wert CKAN_SITE_URL auf die Adresse unter der der Katalog erreichbar sein soll, und setzen Sie ein neues Passwort für die Datenbank im Wert POSTGRES_PASSWORD. Speichern Sie die Datei und benennen Sie sie anschließend in *.env* um.
4. Öffnen Sie die Datei *SDDI-CKAN-Docker source files/production.ini* mit einem Texteditor und geben Sie in Zeile 60 die URL an, unter der der Katalog erreichbar sein wird.
4. Wenn Sie die Vorauswahl an CKAN-Extensions ändern möchten, öffnen Sie die Datei *SDDI-CKAN-Docker source files/production.ini* und entfernen in Zeile 106 die entsprechenden Einträge.
5. Wenn Sie nicht mit der SDDI-Gruppenauswahl arbeiten möchten (Schritt 9), dann müssen Sie die Erweiterungen [grouphierarchy](https://github.com/tum-gis/ckanext-grouphierarchy-sddi), [scheming](https://github.com/tum-gis/ckanext-scheming-sddi) und [userautoaddgroup](https://github.com/tum-gis/ckanext-userautoaddgroup-sddi) entfernen oder so modifizieren, dass sie mit Ihrer Gruppenauswahl übereinstimmen. In der Datei *SDDI-CKAN-Docker source files/Dockerfile* können dazu die entsprechenden Erweiterungen auf ein anderes Git Repository umgeleitet werden.
6. Um den Email-Support zu aktivieren, öffnen Sie die Datei *SDDI-CKAN-Docker source files/production.ini* und tragen Sie ab Zeile 207 die entrpechenden Werte ein (siehe [CKAN Dokumentation](https://docs.ckan.org/en/2.9/maintaining/configuration.html#email-settings)).
7. Öffnen Sie die Datei *SDDI-CKAN-Docker source files/production.ini* und tragen Sie in Zeile 114 einen Admin-Benutzernamen ein (Nur Kleinbuchstaben und -_). Merken Sie sich diesen Benutzernamen für Schritt 10.
8. Führen Sie die Datei *Setup CKAN Docker.bat* im Hauptverzeichnis aus. Dieser Schritt wird einige Minuten in Anspruch nehmen.
9. Öffnen Sie die Datei *Setup Gruppen SDDI Themenplattform.bat* und setzen Sie die URL ein, unter der der Katalog erreichbar sein wird. Führen Sie das Script anschließend aus. Dies erstellt die Gruppen, welche im SDDI-Paket verwendet werden.
10. Öffnen Sie die Datei *Setup Systemadmin erstellen.bat* und tragen Sie hier den selben Benutzernamen ein wie in Schritt 7. Führen Sie die Datei anschließend aus.


### Gruppen und Organisationen

#### Gruppen
Im Ramen der Themenplattform Smarte Städte und Regionen sind 8 Hauptkategorien, und 16 Nebenkategorien entstanden, die dabei helfen Datensätze übersichtlich zu ordnen. Diese Gruppen können mittels eines Scriptes installiert werden. Öffnen Sie die Datei *Setup Gruppen SDDI Themenplattform.bat* und setzen Sie die URL ein, unter der der Katalog erreichbar sein wird. Führen Sie das Script anschließend aus. Dieser Schritt sollte während der Installation bereits erfolgt sein.

Um eigene Gruppen zu erstellen, kann die Datei *Setup Gruppen Template.bat* verwendet werden. Öffnen Sie sie mit einem Texteditor und bearbeiten Sie ihre Gruppe(n).

#### Organisationen
In CKAN werden Benuter verschiedenen Organisationen zugeordnet. Die Katalogplattform kann direkt mit den organisationen befüllt werden, welche in der Themenplattform Smarte Städte und Regionen eine Rolle spielen. Führen Sie hierzu die Datei *Setup Organisationen SDDI Themenplattform.bat* aus.

Um eigene Gruppen zu erstellen, kann die Datei *Setup Organisationen Template.bat* verwendet werden. Öffnen Sie sie mit einem Texteditor und bearbeiten Sie ihre Gruppe(n).


### Troubleshooting

Nach der Installation empfiehlt es sich die Liste der laufenden Docker COntainer anzuzeigen. Dies geschieht über den Befehle
```
docker ps
```
Sind hier nicht Folgende Container aufgelistet ist etwas schiefgegangen:
```
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS                    NAMES
f0558213d9f6        docker_ckan                 "/ckan-entrypoint.sh…"   25 minutes ago      Up 25 minutes       0.0.0.0:5000->5000/tcp   ckan
76614dd75524        clementmouchet/datapusher   "python datapusher/m…"   29 minutes ago      Up 29 minutes       0.0.0.0:8800->8800/tcp   datapusher
8a4fa20d7b35        docker_db                   "docker-entrypoint.s…"   29 minutes ago      Up 25 minutes       5432/tcp                 db
ef2187e5199f        docker_solr                 "docker-entrypoint.s…"   29 minutes ago      Up 29 minutes       8983/tcp                 solr
058ea7466ff5        redis:latest                "docker-entrypoint.s…"   29 minutes ago      Up 29 minutes       6379/tcp                 redis
```
In diesem Fall hilft es eventuell die Installation erneut durchzuführen.

Über folgenden Befehl können die Docker Volumes (Hier werden die Daten gespeichert) zurückgesetzt werden:
```
docker volume ls //Listet die volumes auf
docker volume prune //Entfernt alle volumes (und alle Daten!)
docker volume rm [name] //Entfernt ein einzelnes volume
```
Beispiel für CKAN volumes:
```
docker volume ls
docker_ckan_config: Enthält die Config Datei (production.ini)
docker_ckan_home: Enthält die CKAN-Sinatllation mitsamt den Erweiterungen
docker_ckan_storage: Enthält die gespeicherten Dateien innheralb der Datensätze
docker_ckan_db: Enthält die Datenbank von CKAN (Benutzer, Organisationen, Gruppen und Datensätzte)
```


## Verwendete Erweiterungen
Die Katalogplattform verwnedet verschiedene Erweiterungen um die für die SDDI benötigte Funktionalität bereitzustellen. Nachfolgend steht eine Liste mit allen verwendeten Erweiterungen. Um eine oder mehrere der Erweiterungen im Katalog zu deaktivieren, können in der Datei *SDDI-CKAN-Docker source files/production.ini* in Zeile 106 die entprechenden Einträge entfernt werden.

* [Stats](https://github.com/ckan/ckan/tree/master/ckanext/stats)
* [TextView](https://github.com/ckan/ckan/tree/master/ckanext/textview)
* [ImageView](https://github.com/ckan/ckan/tree/master/ckanext/imageview)
* [ReclineView](https://github.com/ckan/ckan/tree/master/ckanext/reclineview)
* [Scheming](https://github.com/tum-gis/ckanext-scheming-sddi)
* [Hierarchy](https://github.com/ckan/ckanext-hierarchy)
* [Spatial](https://github.com/tum-gis/ckanext-spatial-sddi)
* [GeoView](https://github.com/ckan/ckanext-geoview.git)
* [Repeating](https://github.com/tum-gis/ckanext-repeating-sddi)
* [Composite](https://github.com/tum-gis/ckanext-composite-sddi)
* [GroupHierarchy](https://github.com/tum-gis/ckanext-grouphierarchy-sddi)
* [Relation](https://github.com/tum-gis/ckanext-relation-sddi)
* [Disqus](https://github.com/ckan/ckanext-disqus)
* [TemporalSearch](https://github.com/tum-gis/ckanext-temporalsearch-sddi)
* [UserAutoAddGroup](https://github.com/tum-gis/ckanext-userautoaddgroup-sddi)
* [Restricted](https://github.com/tum-gis/ckanext-restricted-sddi)
* [GDPR](https://github.com/datopian/ckanext-gdpr)


## CKAN Dokumentation und Hilfe

Die offizielle CKAN-Dokumentation finden Sie unter: [https://docs.ckan.org/en/2.9](https://docs.ckan.org/en/2.9).
Informationen zur Benutzung der CKAN-API finden Sie unter: [https://docs.ckan.org/en/2.9/api/index.html](https://docs.ckan.org/en/2.9/api/index.html)


## Lizenz

The content of this repository is released under the terms of the [Apache-2.0 License](https://github.com/tum-gis/3dcitydb-docker-postgis/blob/master/LICENSE). The software components used in this project may be subject to different licensing conditions. Please refer to the website of the individual projects for further information.