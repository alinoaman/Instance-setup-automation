#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Java (required for Jenkins)
sudo apt install openjdk-11-jdk -y

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y

# Start and enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Git (if not already installed)
sudo apt install git -y

# Install Ansible (if not already installed)
sudo apt install software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

echo "Setup complete! Jenkins, Git, and Ansible have been installed."
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Print versions
echo "Installed versions:"
java -version
jenkins --version
git --version
ansible --version

