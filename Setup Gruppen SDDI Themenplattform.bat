REM URL unter der der Katalog laufen wird. Hier muss die selbe URL eingetragen werden, die auch in der production.ini Datei festgelegt worden ist.
REM Am Ende der URL darf kein / stehen.
set ckan_url="http://localhost:5000"



REM Haben Sie die ckan_url angepasst?
pause
REM exit REM Diese Zeile muss entfernt werden. Sie dient als Sicherung, damit die obige URL auch tats�chlich ver�ndert worden ist.




REM Hauptkategorien
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Hauptkategorien' name='main-categories'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Datensatz und Dokumente' name='dataset' image_url='%ckan_url%/base/images/group_icons/dataset.jpg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Online-Dienst' name='online-service' image_url='%ckan_url%/base/images/group_icons/online_service.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Projekt' name='project' image_url='%ckan_url%/base/images/group_icons/project.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Software' name='software' image_url='%ckan_url%/base/images/group_icons/software.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Online-Anwendung' name='online-application' image_url='%ckan_url%/base/images/group_icons/online_application.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Methode' name='method' image_url='%ckan_url%/base/images/group_icons/method.png' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Ger�t / Ding' name='device' image_url='%ckan_url%/base/images/group_icons/device.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Geoobjekt' name='geoobject' image_url='%ckan_url%/base/images/group_icons/geoobject.svg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"

REM Themen
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Themen' name='topics'"
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
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Mobilit�t' name='mobility' image_url='%ckan_url%/base/images/group_icons/mobility.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Landwirtschaft' name='agriculture' image_url='%ckan_url%/base/images/group_icons/agriculture.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gewerbe / Handwerk' name='craft' image_url='%ckan_url%/base/images/group_icons/craft.svg' groups:'[{\"capacity\":\"public\",\"name\":\"topics\"}]'"


REM Der Setup ist beendet.
pause