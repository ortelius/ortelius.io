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

Publishing microservices allows everyone to see what services are available, their CVEs, SBOMs, inventory and ownership across your software supply chain. This is the core purpose of using a microservice catalog. Imagine working on the support team and being asked about a microservice you know nothing about, or trying to provide an application level SBOM in microservice architecture. These are not an uncommon problems in a de-coupled environment. A microservice catalog tracks many attributes of a microservice including:

* Ownership (email, Pagerduty, phone)
* Swagger, CVE, and SBOMs for each microservice with aggregated data up to the logical application
* Versions over time based on the Container Tag
* Logical Application versions based on changes to the supporting microservices
* CD Pipeline and tooling
* Deployment Engine
* Key Value Pairs
* Environments and Endpoints
* Blast Radius and Usage

The Ortelius microservice catalog is built upon a [Domain Driven Design](https://www.deployhub.com/domain-driven-design-microservices/) to make it easy for teams to organize and share services.  A Domain Driven Design is critical in controlling microservice sprawl.  The challenge in microservices is how a developer communicates the availability of a new microservice, telling application teams where to find it, what it does and how it should be deployed. Managing services by Domains organizes the data so it is easy to understand.

## Services and Logical Applications

Each time a microservice is updated, all of the consuming 'logical' applications are impacted. Ortelius automatically tracks this impact by creating a new version number at the application level. This alerts all teams consuming that microservice that they have a new release available. Tracking changes at the logical application level gives project teams the knowledge of how their application changes overtime, even when they don't make an update. It also allows for reporting of SBOM and CVEs at the logical application level based on a specific version.

And when a new version of the service has been created, Ortelius provides a [map](/microservicemapping/) that shows all 'logical' applications that are impacted by an update, what we like to call the 'blast radius.'

## Conclusion

Lets face it, implementing microservices could become a huge tangled hair ball without a catalog to organize and track their usage and inventory. With the Ortelius catalog, microservice developers register their base microservice and application teams create their base 'logical' application package. The registration of microservices, components and applications is done once. Ortelius tracks the updates automatically when connected to your DevOps Pipeline. Ortelius is the easiest way to manage your software component supply chain across all clusters and endpoints. 

</div>
{{< /blocks/section >}}