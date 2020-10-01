REM Der Benutername darf nur aus Kleinbuchstaben und -_ bestehen

docker exec -it ckan /usr/local/bin/ckan-paster --plugin=ckan sysadmin -c /etc/ckan/production.ini add benutzername

REM Der Benutzer wurde angelegt mit Adminrechten
pause