REM Docker-Container erstellen
cd "SDDI-CKAN-Docker source files/contrib/docker"
docker-compose up -d --build

echo "Hier bitte eine Minute warten (?)"
pause

REM PostGIS Datenbank konfigurieren
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/postgis.sql
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/spatial_ref_sys.sql
docker exec -it db psql -U ckan -d ckan -c "ALTER VIEW geometry_columns OWNER TO ckan;"
docker exec -it db psql -U ckan -d ckan -c "ALTER TABLE spatial_ref_sys OWNER TO ckan;"