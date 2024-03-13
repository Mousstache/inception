docker stop mynginx
docker rm mynginx
docker build -t mynginx .
docker run --name mynginx -p 443:443 -d mynginx
docker exec -it mynginx bash