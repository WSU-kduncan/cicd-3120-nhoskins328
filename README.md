# cicd-3120-nhoskins328
## Project Overview
### Part 1. Dockerize it
#### How to Install Docker
First you want to use sudo apt-get update
Then you'll want to use sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
To verify run the command sudo docker run hello-world
#### How to setup a Dockerfile
Once Docker is all set up you can begin to use images such as httpd
To start use the command sudo docker pull httpd
You'll then want to set up what is known as a Dockerfile, run the command vim Dockerfile
To start you'll want to have the following two lines in the Dockerfile
'FROM httpd:2.4'
'COPY ./website/ /usr/local/apache2/htdocs/'
#### How to run the container 
Run the following two commands 
'docker build -t my-apache2 .'
'docker run -dit --name example-app -p 8080:80 my-apache2'
#### How to view the running containter
If you ran the container on a local device, then simply open a browser and type 'localhost:8080' or whatever your private IP is followed by 8080.
If you are using a proxy you can only use a localhost:8080 to view the page.
### Part 2. Github Actions and DockerHub
#### Creating a Repo
To create a public repo on dockerhub, login and head to the repositories tab near the top, then select 'Create repository'. There you will give it a name and an optional description, also here is where you can set your repo to be public or private.
#### How to Login via CLI
In your CLI use the command 'docker login' there you will be asked to input your username and password, or a authorization token. Personally I feel the token is a bit more secure than passwords.
#### How to push container to Docker
First you're going to use the command 'docker tag container user/repo', replace container with the container you're pushing and user with your username and repo with what repo you are sending it to. After that use the command 'docker push user/repo' to send it to DockerHub.
#### Configuring GitHub Secrets
To add a github secret you need to go to the repo you're currently working in and select 'Settings' there you'll see a tab on the left called secrets, select the actions option. This will take you to that repos actions secrets where you can add any secrets you will need to use in any workflow files you create for this repo.
#### Behavior of GitHub Workflow 
The workflow is a file that essentially runs a bunch of automated processes and are triggered by an event that you can define, for example if a docker image is pushed. Some things in a workflow may be unique to you, such as what repo you are pushing to or what kind of authentication you use whether that is a token or a password, so be on the lookout if you're using a template.
### Part 3. Deployment
#### refresh.sh
Our refresh script contains the following commands that allow a new version of the docker image to be ran. First, in case you have any running container with the same name you want to first stop the container than remove it. After that you want to pull the latest image from your dockerhub repo and lastly run it using the accompanying tags, -d, --restart, and p.
#### Setting up webhook on your server
You first want to use the command 'sudo apt-get install webhook' in your CLI.
Then you're going to make a .json file where you're going to put the configuration files.
First is the line '"id": "name",'.
The second line '"execute-command": "/home/ubuntu/refresh.sh",'.
Lastly the third line should look like this '"command-working-directory": "/var/webhook"'
To keep the instance running your going to need to head over to the folder /etc/systemd/system.
Here your going to make a new file, something with the extension '.service'.
There are three sections in this file, [Unit], [Service], and [Install].
For [Unit] there are two lines you need,
'Description=Webhook services in go' and
'After=multi.user.target'.
Next is the [Service] section you also need two lines here.
'ExecStart=/home/ubuntu/go/bin/webhook -hooks /home/ubuntu/hooks.json'
 then the line 'Type=simple'.
 The third and final section, [Install] will only have one line,
 'WantedBy=multi.user.target'.
 After this is done you'll want to start the service by using 'sudo systemctl start webhooks.service'. 
 To setup a notifier on dockerhub go to your dockerhub repository and click the section called webhooks.
 There you can give a name for the webhook and also provide the url the webhook will use, i.e. 'http://0.0.0.0:9000/hooks/name.
 After that your webhook should be ready.
 
