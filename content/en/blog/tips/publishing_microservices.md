---
date: 2020-12-29
title: "Publishing Microservices"
summary: "Publishing Microservices"
author: Tracy Ragan
---

# PLACEHOLDER IMAGE

Publishing microservices is the easiest way to share them across teams. If you are a microservice developer, you need a way to inform other application developers that it your microservice is available for use, and how to use it.   In addition, you need a method of defining attributes of your microservice such as what container registry it can be found in, its key value pairs and what to use for deployment (Helm Chart for example.)  This is the purpose of defining your microservice to an Ortelius Component and publishing the Component to a Domain.

# Publishing Microservice as a Component
Ortelius manages microservices and other reusable objects as Components. Components are assigned to an Application even though they are managed independently. Assign Components to Applications to track a ‘logical’ view of your software solution. In a monolithic approach, we performed this step during the software compile and link, or ‘build’ process. In microservices, they are loosely coupled and linked at run-time. Defining Components to [Applications](https://docs.ortelius.io/guides/userguide/packaging-applications/buildingapplications/) puts the Application in a ‘logical’ view.

If you are an API or microservice developer, this will be where you do most of your work with Ortelius. However, application developers may also define Components that are used only by their specific Application. Components are microservices (containers), Database updates or files, along with Pre and Post [Actions](https://docs.ortelius.io/guides/userguide/customizations/2-define-your-actions/#intro-to-actions) that are used to control the deployment of the Component. By tracking the low level deployment metadata for a Component, it can be easily shared and released in a consistent way across organizational teams and Environments.

Components change over time, and so Ortelius contains Component Base Versions and Component Versions.

Component Base Version : The initial definition of a Component.
Component Version : A child of the Component Base Version that represents changes.

# Components and Domains
Components are organized by Domains and make the process of publishing microservices more organized. When you create a new Component you publish it to the Domain that defines the “Solution Space” the Component addresses. By organizing Components into Domains, you create a catalog that allows other teams within your organization to find and reuse your Components. The organization of Components by Domains support the Domain Driven Design of a microservices architecture. Before you begin publishing Components, you will need to have a Domain ready. For more on Domains see the Building Your [Domain Catalog](https://docs.ortelius.io/guides/userguide/first-steps/2-defining-domains/).

# Components and Applications
Components are consumed by Applications. You track a ‘logical’ view of your complete software solution by seeing which Components the Application uses. Defining Components to Applications is a “packaging” process done at the Application level.

There is a many-to-many relationship between Applications and Components. An Application can contain many different Components. A Component can be used across many different Applications. Components can be easily shared between Applications. Ortelius tracks and versions these Component relationships including to which Applications they have been assigned.

# Publishing Microservices for Sharing
If you want your microservice Component to be shared across your teams, publish your Component to a Domain that allows sharing. If it is defined to only your Application, then only your team will be able to see it.

# Component Versioning
Ortelius uses a backend versioning engine for publishing microservices and tracking their changes overtime. Versioning tracks Component attributes including low level information that is needed for other teams to reuse your Component including:

- GiHub, Bugzilla, Jire Change Request (DeployHub Pro Feature)
- Gitrepo
- Git commit (Branch and Tag)
- CD Build / Workflow Number
- Container SHA
- Docker Registry
- Enviornment Vairaibles
- Deployment script (Hlem Chart, Ansible Playbook, etc.)
- Any Attributes (DB Name for example) such as the Action used to perform the deployment, environment variables, and database schemas.

This information is collected when you define your Component to the Ortelius catalog. You can use the Ortelius APIs to automatically update this information via your CD Pipeline once you have defined your Component Base Version. When your CD engine initiates a workflow for the Component, it indicates that a new version of the Component is being pushed across the Pipeline causing all consuming Applications to be automatically incremented to a new version number. If a Component changes, the consuming Application also changes. Both get a new version number. For more information see [CD Engines](https://docs.ortelius.io/guides/userguide/integrations/ci-cd_integrations/).

After publishing your microservice as a Component, Ortelius tracks it as the Component Base Version. Subsequent updates to that Component creates a new Component Version which represent the updates over time. A Component Base Version is always the first one created, and it acts as a model for subsequent Component Versions. Otherwise they are identical types of objects.

Ortelius uses a simple versioning number schema starting at 1 and incrementing over time, for example: 
```
Myapp;1, Myapp;2.
```

You can use your CI/CD process to include variance in your versioning number (base name, variant, version).