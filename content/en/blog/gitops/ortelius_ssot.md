---
date: 2020-12-29
title: "Ortelius A Single Source Of Truth"
linkTitle: "Ortelius A Single Source Of Truth"
author: Tracy Ragan
---

*Contributed by Tracy Ragan @TracyRagan*

A single source of truth is what will be needed to manage microservices. Have you thought about what your future looks like when you’re managing hundreds of containers and microservices that make up a single version of your software solution? Let’s just say, you’re going to need more than an Excel spreadsheet. Containers and microservices are game changers in terms of how we develop and deliver software. In the past, we have relied on a monolithic approach, with everything moving at the same time in an orchestrated dance that was never guaranteed to work just right. With microservices, we are deconstructing that dance into individual steps, allowing for its unique parts to be independently deployed. While solving many problems, this approach also creates its own set of issues. The primary problem is how to visualize what those individual Services create overtime in terms of the whole base application and subsequent application versions.

# What is a Microservice?
Let’s start from the top. What is a microservice and how do we decompose a monolithic application into Services? I like how Chris Richardson of CloudFoundry fame defines a Service:

- A service should implement a small set of strongly related functions;
- Services that change together should be packaged together;
- The Service can be changed without affecting clients;
- And, each team that owns one or more services must be autonomous. A team must be able to develop and deploy their services with minimal collaboration with other teams.

With microservices, we let go of the concept of a monolithic software application or linear pipeline. We instead have a non-linear configuration of different points of Services that represents the application. It’s still there, but just represented by many parts.

# A Single Source of Truth
# PLACEHOLDER IMAGE


Ortelius is an open source microservice management solution governed under the [Continuous Delivery Foundation](http://cd.foundation/).  Ortelius is hosted  by DeployHub Inc. as [DeployHub Team](https://www.deployhub.com/deployhub-team/).  The Ortelius open source project evolves continuous delivery to include automated configuration management serving as a single source of truth using an intelligent repository of microservice configuration and deployment data. Ortelius was designed to be the ‘single source of truth’ for microservice configurations, particularly around the Kubernetes architecture. Ortelius performs version control of the microservices running in your containers and continuously deploys updates. Ortelius’s versioning reports on what microservice is in a container, who is using it, and the microservices relationship to the larger applications. Ortelius versions and deploys database updates, environment variables, Kubernetes configurations, infrastructure components, application artifacts, and other critical parts of your software release. By versioning these individual parts, Ortelius can iteratively update, rollback, roll forward or jump versions to any state. It was designed with microservices in mind but can also support agile teams working in legacy architectures with safe, iterative releases.

# Critical Features for Kubernetes Deployments
When we created Ortelius, we knew we needed to address the new microservices architecture. What we saw as critical for Kubernetes deployments was the ability to:

- Group ‘like’ Services together as a package
- Support Domain Driven Design (DDD) with sub-domains
- Services organized based on a ‘business’ or ‘problem’ space
- Encourage re-use and collaboration of Services
- Perform continuous deployments without agents for frictionless implementation
- Track a Service version to an application version, providing a single source of truth

To provide the framework for managing Services in their Containers, DeployHub uses the concepts of [Domain, Environment, Application, and Component](https://docs.ortelius.io/guides/userguide/concepts/basic-concepts/). Some of these terms we’ve seen before, like Environment and Application, but Domains and Components are new concepts which relate to how your Services are organized. Just to make sure we are all on the same page, an Environment is a collection of endpoints where your Application is going to be deployed. Most traditional Application Release Automation solutions use these terms and concepts for doing software deployments. To support microservices, Ortelius uses the concept of Components and uses Domains to organize them. Ortelius defines an Application as a collection of Components. Your Microservices map directly to Components. Your Application could have any combination of Component types, such as application Services and database Services. A Domain is both an object unique to Ortelius and a concept used to organize Microservices based on lines of business or ‘problems’. This is often referred to as Domain Driven Design (DDD).

Ortelius Team (open source) provides you with two levels of Domains — a Global Domain and a Project Domain. Ortelius Pro supports a third level called the ‘Divisional’ Domain. Components are organized under the Domain structure. Collaborating for Success As Developers, we know from our experience around Object-Oriented Programming that sharing and collaborating around the use of Services will become critical for their success. We know we’re failing when each team begins to ‘copy’ and ‘rename’ their own versions of Services. This would be bad. Ortelius provides a collaboration framework so that your Service can be published and shared across teams. This allows them to choose a Service from a Component list. Providing a central repository of the available Components also reduces the temptation of taking an older version of a Service and making it ‘our own.’

# In Conclusion
Microservices are changing the way we develop, build, and deploy software. While solving many problems, microservices are also creating new challenges around tracking and versioning the use of Services in large Kubernetes clusters. New methods of managing microservice configurations are required to track what is in the ‘Microservice Soup.’ Ortelius is one such solution. Its microservice management design creates a single source of truth of all your microservice configurations across all clusters. It includes a back-end version control engine that tracks the changes and history of all configuration metadata. It also has features specific to organizing and sharing microservices across diverse team.