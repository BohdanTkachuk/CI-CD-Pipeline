#!/usr/bin/env bash

#generate ssh key
ssh-keygen -t tsa

#open file with ssh key
cat <your_location_of_ssh_key>

#clone repository using ssh connection
git clone <your-ssh-link>

#create Virtual Environment
python3 -m venv ~/.azure-devops

#initialize Virtual Environment
source ~/.azure-devops/bin/activate

make all

#deploy web application
az webapp up -n <your-appservice>
