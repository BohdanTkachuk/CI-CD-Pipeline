# Overview

This project deploy ML Flask App into Azure Cloud as Web Application.The main purpose of application is predict price of accomodation in Boston. The instruction consists all steps of deployments and demonstration of these steps
## Project Plan
Links below describes plans for this project

* https://trello.com/b/xIu9XW38/udacity-project-board
* https://docs.google.com/spreadsheets/d/1VxapU-LSE90nXnbve-oziRPMgGCONbyIlppw4FnV5Sw/edit#gid=1348135932

In the end, architecture of deployed project will follow the diagram below:
![Alt text](/screenshots/cd-diagram.png?raw=true "Title")

## Instructions
### Set up CI using GitHub Action
1. Copy this project to your own github repository 
2. Set up CI using gitHub action and creating a new workflow 
![Alt text](/screenshots/scrCIworkflow.png?raw=true "Title")
3. Instead of auto generated code for `main.yml` insert the code from the same file in `.github/workflows`
4. Commit and check current progress of workflows
![Alt text](/screenshots/scrWorkflow.png?raw=true "Title")
5. Clicking on specific workflow, you can find more information about it. make sure, that all workflows were completed successfully.

### Clone repository into Azure Cloud Shell 
1. Create (if you don't have one) Azure Account

2. Open Azure Portal 

3. Run Azure Cloud Shell 

4. Generate ssh key using command `ssh-keygen -t tsa`
![Alt text](/screenshots/sshGeneratedAzure.png?raw=true "Title")

5. Using `cat <your_location_of_ssh_key>` open file with ssh key and copy ssh key 
![Alt text](/screenshots/sshOpenedAzure.png?raw=true "Title")

6. Return to your githib repository, open `Settings` and `SSH and GPG keys`
![Alt text](/screenshots/sshKeyGit.png?raw=true "Title")

7. Copy the generated SSH key in Azure Cloud Shell into GitHub

8. Go to your repository, click on Code, choose SSH and copy link
![Alt text](/screenshots/sshClone.png?raw=true "Title")

9. Return to Azure Cloud Shell and run `git clone <your_copied_link>`
![Alt text](/screenshots/Screenshotgitclonesshkey.png?raw=true "Title") 

### Check project locally 
1. Go to Azure Cloud Shell
2. Run `python3 -m venv ~/.azure-devops`
3. Run `source ~/.azure-devops/bin/activate`

4. Run `make all`
![Alt text](/screenshots/makeAll.png?raw=true "Title")
5. Run `flask run`
![Alt text](/screenshots/flaskRun.png?raw=true "Title")
6. Open Web Preview to ensure that you web app deployed locally and correctly running
![Alt text](/screenshots/webPreview.png?raw=true "Title")
7. Run `az webapp up -n <webAppName>`
![Alt text](/screenshots/webappUp.png?raw=true "Title")
8. Use public IP address of deployed web app and check deployment
![Alt text](/screenshots/webappBrow.png?raw=true "Title")
9. Insert into `make_predict_azure_app.sh` your web app name
10. Run `./make_predict_azure_app.sh`
![Alt text](/screenshots/makePredict.png?raw=true "Title")


### Set up CD pipeline
1. Got to https://dev.azure.com/ and create an account if requiered
2. Add a new Azure Resource Manager connection 
![Alt text](/screenshots/newServConn.png?raw=true "Title")
3. Choose your Azure subscription and resource groupe 
4. Create a new pipeline using GitHub(YAML) and choosing your repository with project
5. Choose Python to Linux Web App on Azure and web app, which was deployed previously in Azure Cloud Shell
![Alt text](/screenshots/newWebAppPipeline.png?raw=true "Title")
6. Click Save and Run 
7. Check Jobs progress 
![Alt text](/screenshots/ProgressOfPipelin.png?raw=true "Title")
8. Ensure, that deployment completed successfully
![Alt text](/screenshots/AllDonePipeline.png?raw=true "Title")
9. Change `app.py` and commit change
![Alt text](/screenshots/CommitChange.png?raw=true "Title")
10. Ensure, that commit triggered CD process
![Alt text](/screenshots/commitTriggerBuild.png?raw=true "Title")
11. Check changes which was delivered by pipiline
![Alt text](/screenshots/ProofOfCD.png?raw=true "Title")
12. Check logs
![Alt text](/screenshots/logs.png?raw=true "Title")
`



## Enhancements
This project demonstrates basic functionality and provide only a simple insights of CI/CD pipeline. There is a huge field for improvment. First of all, it's great to have a good test coverage and test code with each commit using GitHub Action or during CD job building. Other approach of upgrading project is developing user friendly interface

## Demo 
https://www.youtube.com/watch?v=3R7AcYtJ8cw&feature=youtu.be


