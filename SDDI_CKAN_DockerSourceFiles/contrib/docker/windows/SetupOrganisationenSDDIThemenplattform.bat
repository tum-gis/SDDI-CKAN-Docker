REM Dieses Script legt die Organisationen an, welche f¸r SDDI und die Themenplattform Smarte St‰dte und Regionen relevant sind

docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Technische UniversitÑt MÅnchen (TUM)' name='technische-universitat-munchen'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Lehrstuhl fÅr Geoinformatik' name='lehrstuhl-fur-geoinformatik' groups:'[{\"capacity\":\"public\",\"name\":\"technische-universitat-munchen\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Bayerische Vermessungsverwaltung' name='bayerische-vermessungsverwaltung'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Bayern Innovativ' name='bayern-innovativ'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Themenplattform Digitales Planen und Bauen' name='themenplattform-digitales-planen-und-bauen' groups:'[{\"capacity\":\"public\",\"name\":\"bayern-innovativ\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Themenplattform Smarte St‰dte und Regionen' name='themenplattform-smarte-stadte-und-regionen' groups:'[{\"capacity\":\"public\",\"name\":\"bayern-innovativ\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Firmen' name='firmen'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Technologieanbieter' name='technologieanbieter'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Softwareanbieter' name='softwareanbieter' groups:'[{\"capacity\":\"public\",\"name\":\"technologieanbieter\"}]'"
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Hardwareentwickler' name='hardwareentwickler' groups:'[{\"capacity\":\"public\",\"name\":\"technologieanbieter\"}]'"




REM Der Setup ist beendet.
pause