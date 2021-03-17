---
date: 2020-12-29
title: "Ortelius A Single Source Of Truth"
linkTitle: "Ortelius A Single Source Of Truth"
author: Tracy Ragan
---

*Contributed by Tracy Ragan @TracyRagan*

A single source of truth beyond just matching a .yaml file to a cluster is what will be needed to manage microservices across all clusters and stages of the life cycle. Have you thought about what your future looks like when you’re managing hundreds of containers and microservices that make up a single version of your software solution? Let’s just say, you’re going to need more than an Excel spreadsheet. Containers and microservices are game changers in terms of how we develop and deliver software. In the past, we have relied on a monolithic approach, with everything moving at the same time in an orchestrated dance that was somewhat guaranteed to work just right. With microservices, we are deconstructing that dance into individual steps, allowing for its unique parts to be independently deployed. While solving many problems, this approach also creates its own set of issues. The primary problem is how to visualize what those individual Services create overtime in terms of the base application and subsequent application versions.

# What is a Microservice?
Let’s start from the top. What is a microservice and how do we decompose a monolithic application into Services? I like how Chris Richardson of CloudFoundry fame defines a Service:

- A service should implement a small set of strongly related functions;
- Services that change together should be packaged together;
- The service can be changed without affecting clients;
- And, each team that owns one or more services must be autonomous. A team must be able to develop and deploy their services with minimal collaboration with other teams.

With microservices, we let go of the concept of a monolithic software application or linear pipeline. We instead have a non-linear configuration of different points of Services that represents the application. It’s still there, but just represented by many parts.

# A Single Source of Truth

Ortelius is an open source microservice management solution governed under the [Continuous Delivery Foundation](http://cd.foundation/). The Ortelius open source project evolves the DevOps pipeline to include automated configuration management serving as a single source of truth about microservice usage, ownerships and inventory across all clusters using a central catalog of microservice configuration and deployment data. Ortelius was designed to centralize microservice configurations providing critical data, such as a microservice's blast radius before it is ever deployed. Ortelius performs version control of the microservices running in your containers and rolls that versioning data up to all consuming 'logical applications.' Ortelius’s versioning reports on what version of a microservice is in a container, who is using it, who created it, and the microservices relationship to all consuming applications.

# Critical Features for Microservice Architecture
When we created Ortelius, we knew we needed to address the new microservices architecture. What we saw as critical for was the ability to:

- Group ‘like’ microservices together in a Domain structure to encourage reuse.
- Restore the 'application' package as a logical collection of microservices.
- Provide a proactive view of the microservice deployment 'blast radius' based on a cluster.
- Create a history of changes through a versioning process of each cluster based on microservice patterns.

Ortelius uses the concepts of [Domain, Environment, Application, and Components](https://docs.ortelius.io/guides/userguide/concepts/basic-concepts/). Some of these terms we’ve seen before, like Environment and Application, but Domains and Components are new concepts which relate to how your services are organized. Just to make sure we are all on the same page, an Environment is a collection of endpoints where your Application is going to be deployed. Most traditional Application Release Automation solutions use these terms and concepts for doing software deployments. To support microservices, Ortelius uses the concept of Components and Domains to organize services. Ortelius defines an Application as a collection of Components. Your microservices map directly to Components. Your Application could have any combination of Component types, such as application services and database Services. A Domain is both an object unique to Ortelius and a concept used to organize microservices based on lines of business or ‘problems’. This is often referred to as Domain Driven Design (DDD).

# In Conclusion
Microservices are changing the way we develop, build, and deploy software. While solving many problems, microservices are also creating new challenges around tracking and versioning the use of Services in large Kubernetes clusters. New methods of managing microservice configurations are required to track what is in the ‘Microservice Soup.’ Ortelius is one such solution. Its microservice management design creates a single source of truth of all your microservice configurations across all clusters. It includes a back-end version control engine that tracks the changes and history of all configuration metadata. It also has features specific to organizing and sharing microservices across diverse team.