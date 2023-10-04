docker rm -f orangehrm;
docker run -d --name orangehrm -p 80:80 -p 443:443 \
  --net orangehrm-tier \
  orangehrm/orangehrm:5.5

