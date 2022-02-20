#!/bin/bash
echo "INSTALLING DOCKER & LAUNCHING HTTPD CONTAINERS (Installation source https://docs.docker.com/engine/install/ubuntu/)"
echo "Update the apt package index and install packages to allow apt to use a repository over HTTPS"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
echo "Adding Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "set up the stable repository"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Install Docker Engine"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
echo "Starting Docker"
sudo systemctl enable docker
sudo systemctl restart docker
sudo systemctl status docker
sudo docker --version
echo "creating local directory to mount on containers"
cd /root
mkdir my-httpd-files
echo "<h1>Container launched Successfully</h1>" >> /root/my-httpd-files/index.html
echo "launching httpd containers"
sudo docker run -d -p 5555:80 -v /root/my-httpd-files:/usr/local/apache2/htdocs --name my_apache1 httpd
sudo docker run -d -p 7777:80 -v /root/my-httpd-files:/usr/local/apache2/htdocs --name my_apache2 httpd
sudo docker run -d -p 8888:80 -v /root/my-httpd-files:/usr/local/apache2/htdocs --name my_apache3 httpd
sudo docker ps #check running containers
echo "SUCCESSFULLY LAUNCHED 3HTTPD CONTAINERS"
