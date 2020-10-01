REM Docker-Container erstellen
cd "SDDI-CKAN-Docker source files/contrib/docker"

REM Container starten
docker-compose up -d --build

REM Damit der Datenbankcontainer richtig initiiert wird, muss er zwei mal gestartet werden
docker-compose up -d --build

REM PostGIS Datenbank konfigurieren
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/postgis.sql
docker exec -it db psql -U ckan -d ckan -f /usr/share/postgresql/11/contrib/postgis-2.5/spatial_ref_sys.sql
docker exec -it db psql -U ckan -d ckan -c "ALTER VIEW geometry_columns OWNER TO ckan;"
docker exec -it db psql -U ckan -d ckan -c "ALTER TABLE spatial_ref_sys OWNER TO ckan;"

REM Ab jetzt kann CKAN gestartet werden
docker-compose up -d --build

REM Der Setup von SDDI CKAN Docker ist Beendet.
pause