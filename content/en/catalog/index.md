---
title: Microservice Catalog
description: Ortelius catalog features.
summary: Microservice catalog
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Catalog and Publish Your Microservices</h1>
<hr>

Publish your microservice to facilitate reuse. Microservice publishing is required to make it easy for all developers to find and share services and begin recognizing your microservices patterns. Ortelius is built upon a [Domain Driven Design](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html) to make it easy for teams to organize and share services.  A Domain Driven Design is critical in controlling microservice sprawl.  The challenge in microservices is how a developer communicates the availability of a new microservice, telling application teams where to find it, what it does and how it should be deployed. This is the purpose of the Ortelius Domain Catalog.

Ortelius' Domain Catalog is designed to make microservice publishing and sharing easy.  Developers publish their microservices to a specific solution space along with the critical deployment meta data such the Helm chart and container registry. Other developers can then consume the microservice without the need to create their own deployment logic.  In addition, the Ortelius catalog acts as a microservice or 'component' versioning solution. Once a component is defined to the Domain Catalog, any update to the component creates a new version of the component keeping everyone in the loop as to the most recent version of the microservice.

Ortelius' Domain Driven Design allows you to define categories of microservices, version the changes and determine to whom they can be shared.  In this way, you can classify your microservices into 'solution spaces' based on your organizational structures, geographical areas, or lines of business.  Ortelius' Domains create a 'catalog' of shareable microservices that allows development teams to easily publish and/or reuse microservices across your organization. 

## Domain Driven Design Structure

Ortelius' Domain Driven Design structure can be used to:

* group 'like' microservices together as a package;
* organize microservices, with sub-domains, based on a 'business' or 'problem' space;
* encourage re-use and collaboration;
* track a service version to an application version, providing a single source of truth.

Ortelius' Domain Catalog includes 4 levels of Domains:

{{% blocks/table_center2 %}}
Domain | Description  
 --- | ----------- 
Site Domain | This is the highest-level of your Domain Driven Design structure. Any microservice define to the Site Domain is shared to all Division and Project Domains.
Catalog Domain | You organize your microservices into 'solution spaces' that map to a Catalog Domain. Catalog Domains can have child Sub-Domains, but are not associated to a Life Cycle Sub-Domain.
Project Domain | You assign your software project to a Project Domain. You can create as many Project Domains as needed. Unlike a Catalog Domain, Project Domains cannot have child Sub-Project Domains, but they do have Life Cycle Sub-Domains for mapping to Environments where they will be deployed. Project Domains are integrated into your continuous delivery pipeline
Life Cycle Sub-Domain | Life Cycle Sub-Domains are associated to Project Domains and map to Environments in your Delivery Pipeline. Only Project Domains can have Life Cycle Sub-Domains. You create Life Cycle Sub-Domains to map to each stage in your continuous delivery Pipeline. Life Cycle Sub-Domains allow you to automate the push of your continuous deployments from development through production. Ortelius can be called by your Continuous Delivery Engine (Jenkins, CircleCI, GitLab, GitHub Actions, etc.) to perform the continuous deployments across all states of your pipeline. If you are not using a Continuous Delivery orchestration engine, you can assign Tasks to your Life Cycle Sub-Domain to define a continuous delivery process. You can create as many Life Cycle Sub-Domains as you need for each of your Project Domains. You can also rename Life Cycle Domains if your Pipeline changes.

{{% /blocks/table_center2 %}}

## Configuration Management and the Catalog
When you publish a microservice you define critical deployment details allowing the service to be consistently deployed across all clusters. Initially, a developer defines attributes associated to the 'base line' version of a microservice including: 

* Git repo
* CI/CD Build Engine
* Container Registry
* Container Digest
* Container Tag
* Git Commit
* Key Value Pairs
* Deployment Script (Helm Chart, Ansible Playbook, etc.)

 Once the base line is defined, Ortelius automatically tracks changes to the microservice at the point where a new version has been updated to the container registry, including: 

* CI/CD Build Number
* Container Digest
* Container Tag
* Git Commit

And when a new version of the Container has been created in the Ortelius version control engine, Ortelius automatically increments the versions of all consuming applications, providing a [map](/microservicemapping/) that shows all applications that could be impacted by an update, what we like to call the 'blast radius.'


## Conclusion

Lets face it, implementing microservices could become a huge tangled hair ball without a Domain Driven Design.   We know from our experience around Object-Oriented Programming that sharing and collaborating around the use of services will become critical for their success. We know we’re failing when each team begins to ‘copy’ and ‘rename’ their own versions of services and implement them using a unique Kubernetes Namespace.  This is counter productive to building and service-oriented architecture. The Ortelius Domain catalog provides a collaboration framework so that your service can be published and shared across teams using the Domain Driven Design that your organization created. This allows developers to choose a microservice or component version from the catalog adding it to their application package.  Domain Driven Design is easiest to follow when you have a central tool to organize and share the microservices.  Ortelius achieves this through a Domain catalog that is shared across teams and organizational silos.

</div>
{{< /blocks/section >}}