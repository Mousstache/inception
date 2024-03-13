docker stop mywordpress
docker rm mywordpress
docker build -t mywordpress .
docker run -d -p 9000:9000 --name mywordpress-container -e SQL_DATABASE=yourdb -e SQL_USER=youruser -e SQL_PASSWORD=yourpass -e SQL_HOST=yourhost -e DOMAIN_NAME=yourdomain.com -e SITE_TITLE="Your Site Title" -e ADMIN_USER=admin -e ADMIN_PASSWORD=adminpass -e ADMIN_EMAIL=youremail@example.com mywordpress
docker logs mywordpress