---
date: 2021-01-18
title: "Ortelius Joins GSOC"
summary: January 2021 Newsletter
author: Tracy Ragan
---


## Ortelius joins GSOC - A Learning Experience for all

<div class="col-center">
<img src="/images/googlesummerofcode-300x300.png" alt="Google Summer of Code" height="400px" width="200px" />
</div>
<p></p>

Ortelius submitted 3 projects to the GSOC as part of the Continuous Delivery Foundation. The projects include integration of automated configuration management in CD, microservice versioning and tracking for deployments managed by Spinnaker and ArgoCD, and a project for improving the mapping of data graphs for bigger amounts of data for interns interested in data science.

Ortelius mentors will include [Steve Taylor](https://github.com/sbtaylor15), [Karamjot Singh](https://github.com/karamjotsingh/), [Sacha Wharton](https://github.com/sachajw/), and [Neetu Jain](https://github.com/Neetuj/).

Ortelius is a microservice management platform that provides a microservice catalog and inventory of services across hybrid clusters. As an incubating member of the CD Foundation, Ortelius will participate in GSOC as part of the CD Foundation. Below are the descriptions of the three projects for GSOC:
#### Requirements for Spinnaker Integration</h2>
There is a need to create an Ortelius Spinnaker plugin for capturing configuration, deployment data and relationships for visualization in the Ortelius UI. [Spinnaker Plugin Guide](https://spinnaker.io/guides/developer/plugin-creators/).

Configuration Data:
{{% blocks/table_center2 %}}
Field | Description  
 --- | ----------- 
Build Job | The Continuous Delivery Build Job that is used to build/compile the <em>Component</em>.
Last Build Number | The number of the last Continuous Delivery (CD) Workflow that created the files referenced within the <em>Component.</em> This number will default to the Build ID if one is not set by the CD Workflow.
Build ID | The internal identifier for the <em>Build Engine</em>.
Build URL|The URL to the <em>Build Engine</em>.
Build Date | The timestamp from when the last build job was run.
Helm Chart | The Helm Chart used to deploy the <em>Component</em>.
Helm Chart Version | The Helm Chart Version from the Helm Repository.
Helm Chart Namespace | The sub-division of the Kubernetes cluster where your <em>Component</em> Container should run.
Operator |The RedHat Operator used to deploy your <em>Component</em> container.
Container Registry | The Container registry where the Container is stored.
Container Digest | The SHA number of the Container image.
Container Tag | The tag that was assigned to the Container image.
Git Commit| The Git SHA number. Populated when integrated into Continuous Delivery Pipelines.
Git Repo | The Git Repository that triggered the build.Populated when integrated into Continuous Delivery Pipelines.
Git Tag | The last tag for the Git Repository. Populated when integrated into Continuous Delivery Pipelines.
Git URL | The URL for the Git Repository.Populated when integrated into Continuous Delivery Pipelines.</td>
{{% /blocks/table_center2 %}}

Deployment Data:
{{% blocks/table_center2 %}}
Field | Description  
 --- | ----------- 
Application Version | Version of the application deployed.
Environment | Name of the environment that the application was deployed to.
Endpoints | Endpoints in the environment that were updated by the deployment.</tr>
{{% /blocks/table_center2 %}}

Relationships:
{{% blocks/table_center2 %}}
Field | Description  
 --- | ----------- 
Application Version | Version of the application.
Components Versions | Component versions that belong to the Application Version.
{{% /blocks/table_center2 %}}

The plugin should grab this information and push it to Ortelius via the Ortelius RestAPIs


#### Requirements for ArgoCD Integration 
There is a need to create an Ortelius resource hook for capturing deployment data and relationships for visualization in the Ortelius UI. [ArgoCD Resource Hook Example](https://argoproj.github.io/argo-cd/user-guide/resource_hooks/)

Deployment Data:
{{% blocks/table_center2 %}}
Field | Description  
 --- | ----------- 
Application Version | Version of the application deployed.
Environment | Name of the environment that the application was deployed to.
Endpoints | Endpoints in the environment that were updated by the deployment.
{{% /blocks/table_center2 %}}

Relationships:
{{% blocks/table_center2 %}}
Field | Description  
 --- | ----------- 
Application Version |Version of the application.
Components Versions | Component versions that belong to the Application Version.
{{% /blocks/table_center2 %}}

The plugin should grab this information and push it to Ortelius via the Ortelius RestAPIs

Argo does not have a CI/CD process so no way to hook into the build process for docker image creation. This means that the Git info that triggered the docker build does not exist. For example, Jenkins would be the orchestration tool that has a pipeline step to do the docker build, docker push and git push to the application git repo to update the manifests with the new docker digest/tag info. Argo will monitor that application Git Repo for resource changes in which trigger syncing the k8s manifests with the clusters.

The ArgoCD resource hook (PostSync) logic could be used to capture updates to the clusters from other GitOps controllers such as fluxd.


#### Relationships Visualization
The current visualized relationships are: Application Version to Component Versions (Consumer -&gt; Producer), Component Versions to Application Versions (Producer -&gt; Consumers) and Environments to Application Versions and Component Versions.

<div class="col-center">
<img src="/images/dependencymap.jpg" alt="Dependency Map"/>
<p>Component Version to Application Version</p>
</div>
<p></p>

<div class="col-center">
<img src="/images/impact.jpg" alt="Impact Map"/>
<p>Component Blast Radius</p>
</div>
<p></p>

<div class="col-center">
<img src="/images/DeployedComponent.png" alt="Deployed Component Map"/>
<p>Component to Cluster Inventory Map</p>
</div>
<p></p>

These visualizations need to handle 500+ relationships and extend beyond the single relationship. Application Sets and Component Sets will add an additional levels to the visualization. Multi-level visualization will be a must.

The current visualizations are written in D3.js.
