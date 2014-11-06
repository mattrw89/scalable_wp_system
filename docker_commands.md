DBID=$(sudo docker run -d --name mysql_db -e MYSQL_PASS=1234567890ABC -e DB_NAME=green_space_leaders --volumes-from dbData1 -p 3309:3306 tutum/mysql)


DBLOADID=$(sudo docker run -d --name mysql_load_db -e MYSQL_PASS=1234567890ABC --volumes-from dbData1 tutum/mysql /bin/bash -c /create_db.sh green_space_leaders)


DATAID=$(sudo docker run -d --name dbData1 --volume /var/lib/mysql -p 49100:22 tutum/ubuntu-trusty)




sudo docker rm -f $(sudo docker ps -a -q)

sudo docker rm $DBLOADID1 $DBLOADID0





mysql -uadmin -p1234567890ABC -h127.0.0.1 -P3309