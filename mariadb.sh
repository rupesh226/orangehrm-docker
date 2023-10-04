docker rm -f mariadb
docker run --name mariadb \
  -e MYSQL_ROOT_PASSWORD=password \
  --net orangehrm-tier \
   -d mariadb:10.4.30
