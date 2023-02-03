---
date: 2020-12-29
title: "Ortelius A Single Source Of Truth"
linkTitle: "Ortelius A Single Source Of Truth"
author: Tracy Ragan
---

*Contributed by Tracy Ragan @TracyRagan*

The term 'single source of truth' is often associated with GitOps where a .yaml file stored in Git becomes our primary source of configuration information. However, there is additional data beyond what the .yaml file includes. While it is true, for basic deployment data, the use of a GitOps operator to manage a component's configuration is super useful. But it is not the only source of truth.

Ortelius is a microservice catalog that stores critical information about containers, DB updates and file based components including the data found in your deployment .yaml files. The goal of a microservice catalog is to store microservice data including ownership, usage, versions, deployment instructions and inventory. For this reason, the catalog becomes a source of truth for everything you need to know about a microservice or any type of component your application depends upon.

# A Component-Driven Single Source of Truth

Ortelius is an open source microservice catalog governed under the [Continuous Delivery Foundation](http://cd.foundation/). The Ortelius open source project evolves the DevOps pipeline to include automated supply chain management that tracks the lifecycle of a microservice or component, and the changes overtime. Ortelius performs version control of the microservices and rolls that versioning data up to all consuming 'logical applications.' Ortelius’s versioning reports on what version of a microservice is in a container, who is using it, who created it, and the microservice's relationship to all consuming applications.

# Critical Features for Microservice Architecture

When we created Ortelius, we knew we needed to address the new [microservice application.](https://www.deployhub.com/microservices-applications/) What we saw as critical was the ability to:

- Group ‘like’ microservices together in a Domain structure to encourage reuse.
- Restore the 'application' package as a logical collection of microservices and components.
- Provide a proactive view of the microservice deployment 'blast radius.'
- Create a history of changes through a versioning process of each cluster based on microservice patterns.

Ortelius uses the concepts of [Domain, Environment, Application, and Components](https://docs.ortelius.io/guides/userguide/concepts/basic-concepts/). Some of these terms we’ve seen before, like Environment and Application, but Domains and Components are new concepts which relate to how your services are organized. Just to make sure we are all on the same page, an Environment is a collection of endpoints where your Application is going to be deployed. Most traditional Application Release Automation solutions use these terms and concepts for doing software deployments. To support microservices, Ortelius uses the concept of Components and Domains to organize services. Ortelius defines an Application as a collection of Components. Your microservices map directly to Components. Your Application could have any combination of Component types, such as application services and database Services. A Domain is both an object unique to Ortelius and a concept used to organize microservices based on lines of business or ‘problems’. This is often referred to as [Domain Driven Design](https://www.deployhub.com/domain-driven-design-microservices/) (DDD).

# In Conclusion

Microservices are changing the way we develop, build, and deploy software. While solving many problems, microservices are also creating new challenges around tracking and versioning the use of Services in large Kubernetes clusters. New methods of managing microservice configurations are required to track what is in the ‘Microservice Soup.’ Ortelius is one such solution. Its microservice catalog design creates a single source of truth of all your microservice configurations across all clusters. It includes a back-end version control engine that tracks the changes and history of all configuration metadata. It also has features specific to organizing and sharing microservices across diverse team.
