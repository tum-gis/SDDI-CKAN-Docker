REM URL unter der der Katalog laufen wird
set ckan_url="http://localhost:5000"


REM Docker-Container erstellen
cd "SDDI-CKAN-Docker source files/contrib/docker"
docker-compose up -d --build
pause

REM PostGIS Datenbank konfigurieren
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/postgis.sql
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/spatial_ref_sys.sql
docker exec -it db psql -U ckan -d ckan -c "ALTER VIEW geometry_columns OWNER TO ckan;"
docker exec -it db psql -U ckan -d ckan -c "ALTER TABLE spatial_ref_sys OWNER TO ckan;"


REM Organisationen anlegen
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Technische UniversitÑt MÅnchen (TUM)' name='technische-universitat-munchen'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Lehrstuhl fÅr Geoinformatik' name='lehrstuhl-fur-geoinformatik'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Bayerische Vermessungsverwaltung' name='bayerische-vermessungsverwaltung'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Bayern Innovativ' name='bayern-innovativ'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Themenplattform Digitales Planen und Bauen' name='themenplattform-digitales-planen-und-bauen' groups:'[{\"capacity\":\"public\",\"name\":\"bayern-innovativ\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Themenplattform Smarte St‰dte und Regionen' name='themenplattform-smarte-stadte-und-regionen' groups:'[{\"capacity\":\"public\",\"name\":\"bayern-innovativ\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Firmen' name='firmen'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Technologieanbieter' name='technologieanbieter'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Softwareanbieter' name='softwareanbieter' groups:'[{\"capacity\":\"public\",\"name\":\"technologieanbieter\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Hardwareentwickler' name='hardwareentwickler' groups:'[{\"capacity\":\"public\",\"name\":\"technologieanbieter\"}]'"


REM Gruppen anlegen
REM Hauptkategorien
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Datensatz und Dokumente' name='dataset' image_url='%ckan_url%/base/images/group_icons/dataset.jpg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Online-Dienst' name='online-service' image_url='%ckan_url%/base/images/group_icons/online_service.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Projekt' name='project' image_url='%ckan_url%/base/images/group_icons/project.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Software' name='software' image_url='%ckan_url%/base/images/group_icons/software.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Online-Anwendung' name='online-application' image_url='%ckan_url%/base/images/group_icons/online_application.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Methode' name='method' image_url='%ckan_url%/base/images/group_icons/method.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='GerÑt / Ding' name='device' image_url='%ckan_url%/base/images/group_icons/device.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Geoobjekt' name='geoobject' image_url='%ckan_url%/base/images/group_icons/geoobject.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"

REM Themen
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Verwaltung' name='administration' image_url='%ckan_url%/base/images/group_icons/administration.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Stadtplanung' name='urban-planning' image_url='%ckan_url%/base/images/group_icons/urban_planning.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Umwelt' name='environment' image_url='%ckan_url%/base/images/group_icons/environment.png' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gesundheit' name='health' image_url='%ckan_url%/base/images/group_icons/health.png' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Energie' name='energy' image_url='%ckan_url%/base/images/group_icons/energy.png' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Informations-Technologie' name='information-technology' image_url='%ckan_url%/base/images/group_icons/it-technology.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Tourismus & Freizeit' name='tourism' image_url='%ckan_url%/base/images/group_icons/tourism.png' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Wohnen' name='living' image_url='%ckan_url%/base/images/group_icons/living.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Bildung' name='education' image_url='%ckan_url%/base/images/group_icons/education.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Arbeiten' name='work' image_url='%ckan_url%/base/images/group_icons/work.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Handel' name='trade' image_url='%ckan_url%/base/images/group_icons/trade.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Bauen' name='construction' image_url='%ckan_url%/base/images/group_icons/construction.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Kultur' name='culture' image_url='%ckan_url%/base/images/group_icons/culture.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Mobilit‰t' name='mobility' image_url='%ckan_url%/base/images/group_icons/mobility.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Landwirtschaft' name='agriculture' image_url='%ckan_url%/base/images/group_icons/agriculture.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gewerbe / Handwerk' name='craft' image_url='%ckan_url%/base/images/group_icons/craft.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"