# stop the old
docker stop index1
docker ps -a
docker rm index1
docker ps -a
docker pull nhoskins/website_repo:latest
docker images
docker run -d --restart unless-stopped -p 8080:80 --name index1 nhoskins/website_repo
