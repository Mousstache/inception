docker stop mydb
docker rm mydb
docker build -t mydb .
docker run -d --name mydb -p 3306:3306 mydb
docker logs mydb