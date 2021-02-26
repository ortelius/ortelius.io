---
title: Microservice Versioning
description: Ortelius vesioning features.
summary: Microservice Versioning
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Versioning and Tracking Microservices</h1>
<hr>

## Microservice Versioning and the Application Package

Microservice architecture is vastly different from monolithic applications. With a microservice architecture, your application is a collection of loosely coupled microservices and components.  With monolithic you relied on the build step of the Continuous Integration workflow to create a binary that represented a version of your application as a whole. This binary was then carefully moved through dev, test and prod states of the life cycle.  All of the linking was done at development in the build.

In a microservice architecture that linking is done dynamically at the dev, test and prod runtime environments, defining your microservice patterns. But as the saying goes, "the more things change, the more things stay the same." While your application is a collection of loosely coupled microservices, it is still an application that needs to be managed as a package with versions that you are delivering to your customers.

#### Microservice Architecture Complexities

One of the complexities of a microservice architecture is the loss of the application package and version.  Even though microservices are loosely coupled, you will still need to track what version of each microservice you application version is using. Remember, each time a microservice is updated, it creates a new version of your application, and you may not know when that happens. In other words, microservice patterns are constantly changing, based on new updates. In a microservice architecture you will find yourself asking question like, "What version of a microservice is this version of my application using?", "Who is using my microservice?", "When can I deprecate the service?", or "Who created this microservice?"  Ortelius manages your microservice architecture in order to easily answers these questions and track your microservice patterns.

Ortelius manages your microservice architecture by putting the application package back into the picture.  As you begin to decompose your monolithic application into several independently deployed components defining your microservice patterns, you begin to realize the need to track service to application relationships, including their versions. Some Site Reliability Engineers may manage their microservice patterns using a Helm script or a Kubernetes Deployment YAML file. Others might trace logs to see transactions between microservices based on a single cluster. At Ortelius we believe that a microservice pattern, with versioning, is the safest and most efficient method of getting the job done. And capturing that information before anything is deployed is the safest way to manage change. What we don't want to do is wait for an incident report to learn that something went wrong. Knowledge is key to eliminating confusion and risk when releasing components into a Kubernetes cluster.

#### Microservice Patterns and a Logical Application View

A 'logical' view of your application and application versions is a critical piece of understanding your microservice patterns. Ortelius allows you to define your microservice architecture based on patterns through the use of an Application Package.  You define your Application Package using an application baseline designer. With DeployHub you use the microservice baseline designer to define a logical view of your application's Baseline Version.    The application baseline is then used to track and progressively version your application changes overtime. Each time a microservice version is updated, a new application version is created.  Once a baseline is defined, you can integrate with a CD pipeline to automatically track the version changes using Ortelius'  automated configuration management.

<div class="col-center">
<img src="/images/applicationpackaging.jpg" alt="application package" />
<p>Microservice Architecture and Logical Applications</p>
</div>

#### Automated Configuration Management

You may be thinking, "Do I have to update the application package every time a new version of the microservice is released?"  Now that would be time consuming.  The answer is no. Once your Baseline has been defined, your CD process will call Ortelius to automatically increment the application version if a new version of a microservice it consumes is deployed.  You can also subscribe to a microservice which then notifies you if a new version of that microservice has been created.  As microservices are consumed by applications, DeployHub tracks the dependencies.  It can tell you at any point in time which version of the microservices your application is consuming, how many different versions have been deployed to your Kubernetes cluster, and who is using the same microservices.

#### Microservice Architecture BoM Maps

Once you have defined your application's microservice architecture to Ortelius, it will provide you the visualization maps needed to understand your applications dependencies (Bill of Material), Difference Maps based on Cluster and microservice Impact Analysis. This data can help you deploy your microservices confidently and without waiting for an incident report to tell you that something went wrong.

<div class="col-center">
<img src="/images/dependencymap.jpg" alt="Bill of Material" />
<p>Application Dependency Map</p>
</div>

<div class="col-center">
<img src="/images/LastDeploymentDifference.jpg" alt="Difference Map" />
<p>Application Difference Report based on Cluster</p>
</div>

<div class="col-center">
<img src="/images/impact.jpg" alt="Impact Analysis" />
<p>Microservice Application Impact Analysis</p>
</div>

#### Microservice Architecture and Database Updates

Because Ortelius sees everything as a Component, a DB update is no different. Well that is not completely true.  If you define a Component as a DB update, you will be given the option of defining both a roll-forward step and a roll back step.  This allows DeployHub to track the incremental changes of each associated DB schema.  DeployHub allows you to add a DB update as part of your microservice architecture

## Conclusion

You can expect to be managing thousands of microservices in your Kubernetes cluster, which is why you need a method of defining and versioning your entire microservice architecture based on application versions and microservice versions.  Ortelius provides you a method for managing your microservice inventory along with all deployment configuration details.  It integrates with your CI/CD process to continually update new versions of your microservices that in turn creates new versions of your applications.  With our inventory system, you always know what version of a microservice your application version is dependent upon.  You have the insights on the meta data to resolve issues, and expose the level of impact a new microservice version may create.

{{< /blocks/section >}}