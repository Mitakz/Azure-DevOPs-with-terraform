# Azure-DevOPs-with-terraform
Creating a weatherAPI .netcore:7 app, containerizing iT to A Docker image, pushing it to the Docker HUB, initializing terraform and building the container into a Azure Container registry.
All thsese actions are triggered up on a GitHUB  commit.
The Process is automated with an Azure DevOps pipeline with a self-hosted agent pool on my windows 10 computer.
![image](https://user-images.githubusercontent.com/63946278/226641924-9684819f-f3d5-4137-b8d2-0cb99c7f7fd6.png)
![image](https://user-images.githubusercontent.com/63946278/226643102-cbf33690-bdf9-42ab-a7ca-e989bdef6492.png)




Authentication method: Service principle
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

Docs: https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops
Keep in mind, after  configuring the agent as a Service, you have to add it to the Docker group and  change the logOn to a local system account :

![image](https://user-images.githubusercontent.com/63946278/226191232-48915280-7035-4853-8a08-5ca8cc89b244.png)
![image](https://user-images.githubusercontent.com/63946278/226191263-df40440f-90b4-40b4-ad2f-f5764dcbebe2.png)

test
