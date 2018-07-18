#!/bin/bash

# Jenkins & Java

echo "Installing Jenkins and Java"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install openjdk-8-jdk > /dev/null 2>&1
sudo apt-get -y install jenkins > /dev/null 2>&1
sudo systemctl start jenkins 


# Docker

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y install docker-ce > /dev/null 2>&1
sudo systemctl enable docker > /dev/null 2>&
sudo usermod -aG docker ${USER}
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu


# Install Maven

echo "Install Maven"
sudo apt-get -y install maven > /dev/null 2>&1


# Install Git

echo "Install Git"
sudo apt-get install -y git-core > /dev/null 2>&1


# Install Ansible

sudo apt-add-repository -y ppa:ansible/ansible > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y ansible > /dev/null 2>&1
sudo apt-get install -y python-software-properties > /dev/null 2>&1
sudo apt-get install -y python > /dev/null 2>&1
sudo cp /vagrant/ansible/hosts /etc/ansible/


#Install Artifactory
sudo apt-get -y install unzip > /dev/null 2>&1
cd /
sudo wget https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-5.1.3.zip
sudo unzip download_file?file_path=jfrog-artifactory-oss-5.1.3.zip
sudo artifactory-oss-5.1.3/bin/artifactoryctl start
echo "DONE!"
echo ""
echo ""

sudo cp /var/lib/jenkins/secrets/initialAdminPassword /vagrant/JenkinsPass.txt
