---
title: Microservice Mapping
description: Ortelius microservice mapping features.
summary: Microservice mapping for configuration management.
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">What is Microservice Mapping?</h1>
<hr>

Microservice mapping is a configuration management process that tracks changes to microservices and their consuming applications over time.  In monolithic development, configuration management was done at the 'software' level, and called software configuration management or SCM. With SCM, version control and configuration management was done by checking in source code to a version repository, and checking it out for a compile/link step. This is where the core of all SCM was done. The results of SCM was the ability to clearly see the changes between two releases shown via a Bill of Material Report, Difference Report and Impact Analysis Report. With microservices we have shifted from tracking at the SCM level and now need to track at the microservice level. Changes to a microservice impacts your microservice architecture<a href="https://www.deployhub.com/microservice-architecture/">.</a> This means that every logical application that consumes that service will have a potential impact. Microservice mapping tracks that for you. </p>

Microservice mapping includes the process of versioning all microservice deployment and configuration meta data to allow visibility into what microservices are running in your cluster, their versions, how they got there and which applications are using them. While microservices move us away from traditional build and release approaches, we still need a method of tracking their changes and a way to make them unique. Like a software version control solution, Ortelius tracks specific information in the microservice mapping to track its changes and uniquely identify a version. 

As microservices are consumed by applications, Ortelius tracks the dependencies. It can tell you at any point in time which version of the microservices your application is consuming, how many different versions have been deployed to your Kubernetes cluster, and who is using the same microservice. Ortelius builds a map that displays this data overtime.

## Mapping in Action
This video shows how Ortelius tracks microservice versions to their 'logical' application versions.
<p></p>
<video autoplay="autoplay" loop="loop" controls="controls" width="60%" height="60%"><source src="/images/mapview.mp4" type="video/mp4" />

## Conclusion

You can expect to be managing thousands of microservices in your Kubernetes cluster, requiring the process of microservice mapping. Ortelius provides a method for managing your microservice inventory along with all configuration management details. It integrates with your CI/CD process to continually update new versions of your microservices that in turn creates new versions of your applications. With our inventory system, you always know what version of a microservice your application version is dependent upon. You have the insights on the meta data to resolve issues, and expose the level of impact a new microservice version may create.

{{< /blocks/section >}}