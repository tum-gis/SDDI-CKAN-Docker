echo This script serves as an example of how to create a new organization.
echo After starting the Docker containers, organizations can also be created manually via the web interface.
echo for the value "name" only lowercase letters and "-" may be used.
echo Example for an organization
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Organisation eins' name='organisation-eins'" /
echo Example of an organization that is a child of another organization. The "name" value in the "group" tag refers to the "name" value of the parent organization.
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action organization_create -c etc/ckan/production.ini title='Organisation zwei' name='organisation-zwei' groups:'[{\"capacity\":\"public\",\"name\":\"haupt-organisation\"}]'" /

