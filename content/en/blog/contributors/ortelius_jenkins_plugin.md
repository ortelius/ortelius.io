---
date: 2021-01-05
title: "Ortelius Jenkins Plugin"
linkTitle: "Ortelius Jenkins Plugin"
author: Tracy Ragan
---
# PLACEHOLDER IMAGE
*Contributed by Phil Gibbs, Ortelius Core Contributor* 

@philgibbs

The Ortelius Jenkins plugin (https://plugins.jenkins.io/deployhub) allows Jenkins to notify Ortelius that a build has been performed and (optionally) trigger Ortelius to perform a deployment, which enables [Jenkins to scale to thousands](https://www.deployhub.com/scalable-jenkins-workflows-plugin/) of endpoints without agents.

To link from Ortelius to Jenkins, create a Build Engine in Ortelius, which is linked to the external Jenkins Server. You then create one or more Build Jobs within it. Each one is associated with a Project in the associated Jenkins Server. Once this is done, you can view the Jenkins Build History and open Jenkins Build Logs directly from inside Ortelius.

Once these Build Jobs have been defined, you can link them to Components. Ortelius updates the “Last Build Number” for each component as notified once completed.

This last step has led to some confusion amongst the Ortelius community. Our support team have had many calls stating that a build has been done and yet the last build number for the associated component(s) have not been updated. The purpose of this post is to explain how Ortelius determines the Build Engine (and from there, the Build Job and associated Component) from the incoming Jenkins message.

# How Ortelius Locates the Build Engine
Firstly, the Jenkins plugin does not ask you to provide details of the Build Engine in Ortelius. It was felt that from a Jenkins user perspective having to supply this information would be confusing. In addition, a Build Engine could always be renamed in DeployHub and this would result in the need to change the values in the plugin. All that the Jenkins plugin requires is the URL of the DeployHub server and some login credentials.

Secondly, there could be multiple Jenkins instances all notifying Ortelius that a build has taken place. Two or more of those instances could even be on the same physical or virtual server. So how does DeployHub link the Jenkins Instance to the Build Engine?

The answer lies in the Jenkins URL, set in Jenkins itself (Manage Jenkins -> Configure System) and  sent out as part of its notification. On receiving the build notification, Ortelius then attempts to match this “Jenkins URL” with the “Server URL” that is defined for the Build Engine. Once a match is found, the connection can be made to the underlying Build Job and from there to all the components associated with it.

It is therefore essential that the “Jenkins URL” defined in the Jenkins Instance matches the “Server URL” defined for the Ortelius Build Engine. If there is a mismatch, the Build Engine cannot be determined and the build number will not be updated. This discrepancy is the most common cause of the Jenkins plugin not seeming to update the “Last Build Number”.

# Advanced Configuration
Version 8.0.1 of Ortelius also has another enhancement. Along with “Server URL” there is a new (optional) attribute for a Build Engine called “Jenkins Match URL”. If this attribute is specified, Ortelius will compare the incoming “Jenkins URL” with the “Jenkins Match URL” and not just the “Server URL”.

You can use this technique when Ortelius requires a different IP address or hostname. For example, if Ortelius and Jenkins are both hosted in containers then the “external” URL that Jenkins will present to the outside world will resolve to a different IP Address than DeployHub will need to use to connect to the Jenkins Container. In these circumstances, you can set the “Server URL” to the IP Address of Jenkins as seen from DeployHub and set the “Jenkins Match URL” to the value of the “Jenkins URL” in the Jenkins instance. That allows DeployHub to connect to Jenkins to display the Build Logs etc but still allows it to match the “Jenkins URL” when a build notification takes place.

# Jenkins Pipeline Support
Call Ortelius from your Jenkins File to perform deployment actions as part of your pipeline. A Ortelius [Groovy library](https://www.deployhub.com/native-groovy-api/) provides this support.

Further reading:  [https://www.deployhub.com/continuous-deliv…lease-automation/](https://www.deployhub.com/continuous-delivery-vs-application-release-automation/) ‎

See Jenkins and Ortelius (DeployHub Team) Working Together

# PLACEHOLDER VIDEO

Jenkins, BlueOcean and DeployHub Team based on Ortelius