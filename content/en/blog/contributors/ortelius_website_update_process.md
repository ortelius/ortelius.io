---
date: 2021-03-19
title: "Ortelius Website Google Cloud Build Update Process"
linkTitle: "Ortelius Website Google Cloud Build Update Process"
author: Sacha Wharton
---

*Contributed by Sacha Wharton, Ortelius Core Contributor* 

@sachajw

<div>
<img src="/images/ufo-abduct-cow.jpg" alt="Ortelius" height="192px" width="192x" />
</div>
<p></p>

## Intro
I thought aliens were not real until I got abducted by the Ortelius open source project. Now, I am a convert and follower of the "beam me up scotty" container age. I would like to abduct some of your time to share the process we use to update the Ortelius website. I have the privilege of being one of the community members and contributors to the open source Ortelius project.

The Ortelius web site runs on [Nginx](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiSt--aw7zvAhWGSxUIHYv1D20QFjAAegQIBBAE&url=https%3A%2F%2Fwww.nginx.com%2F&usg=AOvVaw10RW2cXcmCuZ2YnsYWHFKR) and [Hugo Server](https://gohugo.io/commands/hugo_server/).

## GitHub
[Github](https://github.com/ortelius/website) is our source control, and on a side note I am quite famous for getting myself into a pickle with Git and having one of our mentors, like Steve Taylor, untangle my birds nest. Ok back to our initial topic. Lets go and have a gander at a few of the most important files in our repo.

### Dockerfile
We use a multi-staged [Dockerfile](https://github.com/ortelius/website/blob/main/Dockerfile) which starts with a base Nginx build. The build takes place in the working directory ```/build```, where the Hugo Server is substantiated and the node modules are installed. The node modules will be cached unless ```package.json``` changes. The next stage of the build proceeds with a custom container containing Nginx with [Google PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/). Google PageSpeed is fantastic, it analyses the content of a web page, then generates suggestions to make that page faster. From there the build is copied from ```/build/public``` to ```/etc/nginx/html``` along with ```/build/conf/pagespeed.conf``` and ```/build/config/nginx.conf``` and finally the PageSpeed cache permissions are rectified.
<div>
<img src="/images/dockerfile.png" alt="Dockerfile" />
</div>
<p></p>

### Google Cloud Build
Google [Cloud Build](https://cloud.google.com/build) is watching the GitHub website repo, which will kick off a build when there is a change to the ```main``` branch as a result of the configured trigger. The configuration is stored in [cloudbuild.yaml](https://github.com/ortelius/website/blob/main/cloudbuild/cloudbuild.yaml). We have also enabled Cloud KmS which stores our GitHub SSH key to securely authenticate and Secret Manager which stores our Redhat Quay container registry authentication details.

### Google Cloud Functions
When a build is completed a notification is triggered by our Google Cloud Function which is just eagerly waiting like a Jack Russell chewing your neighbours gate post to send that notification to our Discord channel #bot-build-results. The Cloud Function is built in Nodejs and can be used as a template to add any other providers.

## Redhat Quay Container Registry
Yes and there we have it folks once Google Cloud Build has done its magic a new container magically appears in the [Quay](https://quay.io/repository/ortelius/ortelius) container registry. We use Quay because we have found it be far more stable and reliable.

## DeployHub
Now enters the mothership [DeployHub](https://www.deployhub.com/) (SaaS) herself, "The one ring to rule them" in a good way that is. Now how does DeployHub know about what went down in the land of containerised micro-services, why the variables in the ```cloudbuild.yaml``` file of course. The information in the variables is recorded in DeployHub.
<div>
<img src="/images/deployhub-variables.png" alt="Variables" />
</div>
<p></p>

## Microsoft Azure Kubernetes
We have now reached the end of our journey with DeployHub pushing the container image into Azure Kubernetes to serve [Ortelius](https://ortelius.io/) on a fresh plate of HTML.

## Outro
That's all the time we have this time folks, I appreciate your time and I look forward to you all going bananas giving Ortelius a test-drive and crying with joy as you experience all your containerised aches and pains disappear. 
