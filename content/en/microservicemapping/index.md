---
title: Mapping Logical Applications
description: Ortelius Logical Application Mapping Features
summary: Logical Application Mapping for Supply Chain Management
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Mapping Logical Applications</h1>
<hr>

## Mapping Logical Applications

Applications are a collection of components and microservices in a cloud-native architecture. Application mapping shows a 'logical' representation of the application's high-level components and microservices with their versions. Ortelius uses this information to show you how your 'logical' application has changed over time. As we work to harden cybersecurity, it is important to monitor your application's changes, even when you did not make the change.

In a decoupled architecture, your applications will consume shared components. When these shared components are updated you have a new version of your application. Ortelius shows you the versions of all components and microservice that a specific version of your application is using.  While microservices move us away from traditional build and release approaches, we still need a method of tracking their changes and a way to make them unique. Like a software version control solution, Ortelius tracks specific information in the microservice mapping to track its changes and uniquely identify a version. Changes to a microservice impacts your microservice architecture<a href="https://www.deployhub.com/microservice-architecture/">.</a> This means that every logical application that consumes that service will have a potential impact. Microservice mapping tracks that for you.

As microservices are consumed by applications, Ortelius tracks the dependencies. It can tell you at any point in time which version of the microservices your application is consuming, how many different versions have been deployed to your Kubernetes cluster, and who is using the same microservice. Ortelius builds a map that displays this data overtime.

## Logical Application SBOMs and CVEs

By tracking how your logical application changes, Ortelius can aggregate all lower level microservice data up to your logical application level. SBOMs and CVEs at the application level are aggregated based on the microservices your application consumes.
<br>
<br>

<div class="col-center">
<p class="text-center"><strong>Application Details</strong></p>
<img src="/images/applicationdetails.png" alt="Application Details" />
</div>

<br>
<br>

## Conclusion

You should expect to be managing thousands of components and microservices in your cloud-native environment. A decoupled architecture will require a process of mapping shared component  usage across all applications, keeping teams informed of what versions of shared objects they are using. Ortelius provides a method for managing your application's inventory along with all configuration details. It integrates with your CI/CD process to continually update new versions of your shared services that in turn creates new versions of your applications. With our inventory system, you always know what version of a microservice your application version is dependent upon. You have the insights on the meta data to resolve issues, and expose the level of impact a new microservice version may create.

## Mapping in Action

Ortelius tracks microservice versions to their 'logical' application versions.
<br>
<br>
<video autoplay="autoplay" loop="loop" controls="controls" width="60%" height="60%"><source src="/images/mapview.mp4" type="video/mp4" />
</div>

{{< /blocks/section >}}
