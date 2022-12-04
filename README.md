# cicd-3120-nhoskins328
## Project Overview
### Run Project Locally
#### How to Install Docker
First you want to use sudo apt-get update
Then you'll want to use sudo apt-get install docker
To verify run the command sudo docker run hello-world
#### How to setup a Dockerfile
Once Docker is all set up you can begin to use images such as httpd
To start use the command sudo docker pull httpd
You'll then want to set up what is known as a Dockerfile, run the command vim Dockerfile
To start you'll want to have the following two lines in the Dockerfile
FROM httpd:2.4
COPY ./website/ /usr/local/apache2/htdocs/
#### How to run the container 
Run the following two commands 
docker build -t my-apache2 .
docker run -dit --name example-app -p 8080:80 my-apache2
#### How to view the running containter
If you ran the container on a local device, then simply open a browser and type 'localhost:8080' and hit enter
If you ran the container in a instance you'll need the IP the instance uses and type the same command but replace' 'localhost' with the IP address followed by 8080

