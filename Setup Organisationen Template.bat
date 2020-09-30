REM Dieses Script dient als Beispiel, wie eine neue Organisation angelegt werden kann.
REM Nach Starten der Docker Container können Organisationen auch Manuell über das Web-Interface angelegt werden.
REM für den Wert "name" dürfen nur Kleinbuchstaben und "-" verwendet werden.


REM Beispiel für eine Organisation
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Organisation eins' name='organisation-eins'"


REM Beispiel für eine Organisation, die einer anderen Organisation untergeordnet ist. Der Wert "name" im "group"-Tag bezieht sich auf den Wert "name" der übergeordneten Organisation.
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Organisation zwei' name='organisation-zwei' groups:'[{\"capacity\":\"public\",\"name\":\"haupt-organisation\"}]'"