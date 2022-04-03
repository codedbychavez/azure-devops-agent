# azure-local-agent
A Dockerized solution for Azure DevOps self hosted agent.

## Introduction

Welcome to Azure Local Agent repository.

The purpose of this repository is to provide a self hosted dockerized agent solution for our Azure DevOps pipelines to use for building and deploying our apps.

### How to use this self hosted dockerized agent solution additional on pipelines defined in other project repositories:

1. Open the Make file and go to the `run:` section.

... -e **AZP_URL**=https://dev.azure.com/cbsuk -e **AZP_TOKEN**=pusqt36t2saobskcdxrzxriw6kivqmup62fyuevteujmmqsolaeq -e AZP_AGENT_NAME=mydockeragent -e **AZP_POOL**=selfhosted dockeragent:latest --once

Adjust the bolded environment variables as needed, See below for details.

### Definitions for variables

**AZP_URL** The URL of the Azure DevOps or Azure DevOps Server instance.

**AZP_TOKEN** [Personal Access Token (PAT)](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops) with Agent Pools (read, manage) scope, created by a user who has permission to [configure agents](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/pools-queues?view=azure-devops#create-agent-pools), at AZP_URL.

**AZP_AGENT_NAME** Agent name (default value: the container hostname).

**AZP_POOL** Agent pool name (default value: Default).

**AZP_WORK** Work directory (default value: _work).

#### Find more info here if you are curious: 
https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops

## How to run the self hosted agent:

1. Clone the repository
2. Run the command `make all`

If the agent is not running this will be shown, so wait sometime for the dockerized agent to be up:
![image](https://user-images.githubusercontent.com/74829200/161313771-2cba09c5-24e9-41c8-b53d-2ea7d5457e09.png)

As you can see, the agent is now starting:
![image](https://user-images.githubusercontent.com/74829200/161314160-4d34342e-c81d-4df9-a358-4421fdfecd31.png)
3. When the agent starts you'll see the below:
![image](https://user-images.githubusercontent.com/74829200/161314309-08bbc6f8-8814-45be-b044-077fe9c348b7.png)

### Confirming in Azure DevOps...

4.Confirm in the Azure DevOps platform that the self hosted agent is running:
![image](https://user-images.githubusercontent.com/74829200/161314549-b09754da-0dc2-4c74-b009-ac1ad7abfbb9.png)

### Configuring your pipeline to use your self hosted agent:

5. Next, you'll need to tell your pipeline that you want to use your self hosted agent.
6. Locate `azure-pipelines.yml` in your repo on Azure:
![image](https://user-images.githubusercontent.com/74829200/161315172-e6fa7a78-4982-4a28-b59d-753379d70738.png)

7. Locate your pipeline and click the edit button:
![image](https://user-images.githubusercontent.com/74829200/161315422-3eba2b25-674c-4cfa-98d1-f80f5e895114.png)

8. Add the name of pool where your self hosted agent is located:
![image](https://user-images.githubusercontent.com/74829200/161315837-4eeb5e6f-2bae-4405-8087-0670712e85ce.png)

9. Click the **Save** button on the top right to save the pipeline.

### An example run in action:
10. Any changes to the main branch will trigger the pipeline to run. You don't need to keep the self hosted agent running... If the agent is not running the pipeline won't run.
You can setup branch and pull request policies to control this.

Here is a side by side comparison (Docker: right, Azure DevOps: left) showing that the local agent was successful in running a pipeline:
![image](https://user-images.githubusercontent.com/74829200/161316819-cf5aaaec-edec-436c-94d7-5379bcb7f7c8.png)

## Issues ?
Open an issue
