REM Dieses Script dient als Beispiel, wie eine neue Gruppe angelegt werden kann.
REM Nach Starten der Docker Container können Gruppen auch Manuell über das Web-Interface angelegt werden.
REM für den Wert "name" dürfen nur Kleinbuchstaben und "-" verwendet werden.



REM URL unter der der Katalog laufen wird. Hier muss die selbe URL eingetragen werden, die auch in der production.ini Datei festgelegt worden ist.
REM Am Ende der URL darf kein / stehen.
set ckan_url="http://localhost:5000"




exit REM Diese Zeile muss entfernt werden. Sie dient als Sicherung, damit die obige URL auch tatsächlich verändert worden ist.


REM Beispiel für eine Gruppe.
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gruppe eins' name='gruppe-eins' image_url='%ckan_url%/base/images/group_icons/gruppe_eins.jpg'"


REM Beispiel für eine Gruppe, die einer anderen Gruppe untergeordnet ist. Der Wert "name" im "group"-Tag bezieht sich auf den Wert "name" der übergeordneten Gruppe.
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gruppe zwei' name='gruppe-zwei' image_url='%ckan_url%/base/images/group_icons/gruppe_zwei.jpg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'"