echo This script serves as an example of how to create a new group.
echo After starting the Docker containers, groups can also be created manually via the web interface.
ckan_url = "$ANS_URL"
echo An example fo a group:
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gruppe eins' name='gruppe-eins' image_url='%ckan_url%/base/images/group_icons/gruppe_eins.jpg'" /
echo Example of a group that is a child of another group. The "name" value in the "group" tag refers to the "name" value of the parent group.
docker exec -it ckan sh -c ". usr/lib/ckan/venv/bin/activate; ckanapi action group_create -c etc/ckan/production.ini title='Gruppe zwei' name='gruppe-zwei' image_url='%ckan_url%/base/images/group_icons/gruppe_zwei.jpg' groups:'[{\"capacity\":\"public\",\"name\":\"main-categories\"}]'" /
echo The setup is finished.
