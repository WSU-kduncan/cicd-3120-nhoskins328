# stop the old
docker stop index
docker ps -a
docker rm index
docker ps -a
docker pull nhoskins/website_repo:latest
docker images
docker run -d -p 8080:80 --name index nhoskins/website_repo
