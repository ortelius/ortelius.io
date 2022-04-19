---
title: Microservice Supply Chain Mapping
description: Ortelius microservice mapping features.
summary: Microservice mapping for supply chain management.
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">What is Microservice Mapping?</h1>
<hr>

## Mapping Logical Applications
Microservice mapping shows a 'logical' application's supply chain, with versions. 

Ortelius can easily show you how your 'logical' application has changed over time. As we work to harden cybersecurity, it is important to monitor your application's changes, even when you did not make the change. In a microservice architecture, your application will consume shared components. When these shared components are updated you have a new version of your application. Ortelius shows you the versions of all microservice that a specific version of your application is using.  While microservices move us away from traditional build and release approaches, we still need a method of tracking their changes and a way to make them unique. Like a software version control solution, Ortelius tracks specific information in the microservice mapping to track its changes and uniquely identify a version. Changes to a microservice impacts your microservice architecture<a href="https://www.deployhub.com/microservice-architecture/">.</a> This means that every logical application that consumes that service will have a potential impact. Microservice mapping tracks that for you.

As microservices are consumed by applications, Ortelius tracks the dependencies. It can tell you at any point in time which version of the microservices your application is consuming, how many different versions have been deployed to your Kubernetes cluster, and who is using the same microservice. Ortelius builds a map that displays this data overtime.

## Logical Application SBOMs and CVEs
By tracking how your logical application changes, Ortelius can aggregate all lower level microservice data up to your logical application level. SBOMs and CVEs at the application level are aggregated based on the microservices your application consumes. 

## Mapping in Action
This video shows how Ortelius tracks microservice versions to their 'logical' application versions.
<p></p>
<video autoplay="autoplay" loop="loop" controls="controls" width="60%" height="60%"><source src="/images/mapview.mp4" type="video/mp4" />

## Conclusion

You can expect to be managing thousands of microservices in your Kubernetes cluster, requiring the process of microservice mapping. Ortelius provides a method for managing your microservice inventory along with all configuration management details. It integrates with your CI/CD process to continually update new versions of your microservices that in turn creates new versions of your applications. With our inventory system, you always know what version of a microservice your application version is dependent upon. You have the insights on the meta data to resolve issues, and expose the level of impact a new microservice version may create.

{{< /blocks/section >}}