---
title: Supply Chain Data and DevOps Intelligence Dashboard
description: Supply Chain Data in Ortelius
summary: Supply Chain Data and DevOps Intelligence Dashboard
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Supply Chain Data and DevOps Intelligence for Hardening Cybersecurity</h1>
<hr>

Ortelius collects and versions as much data as possible from the DevOps Pipeline process. Much of this data is left in the underlying build directory where the DevOps pipeline was executed. Ortelius collects and presents this data in a central catalog and dashboard, providing critical reports at both the component and consuming ['logical application'](/microservicemapping/) levels.

* Ownership (email, Pagerduty, phone)
* Swagger
* CVE for each service with data aggregated up to the logical application
* SBOMs for each service with data aggregated up to the logical application
* Readme
* Open-source packages and licenses
* Versions over time based on the Container Tag
* Logical Application versions based on changes to the supporting microservices
* CD Pipeline and tooling
* Deployment Engine
* Key Value Pairs
* Environments and Endpoints
* Blast Radius and Usage
* Organization
* Inventory by version across all environments

The Ortelius microservice catalog is built upon a Domain Driven Design to make it easy for teams to organize and share services.  A Domain Driven Design is critical in controlling microservice sprawl.  The challenge in microservices is how a developer communicates the availability of a new microservice, telling application teams where to find it, what it does and how it should be deployed. Managing services by Domains organizes the data so it is easy to understand.

## Services and Logical Applications

Each time a component or microservice is updated, all of the consuming 'logical' applications are impacted. Ortelius automatically tracks this impact by creating a new version number at the application level. This alerts all teams consuming that component or microservice that they have a new release candidate. Tracking changes at the logical application level gives project teams the knowledge of how their application changes overtime, even when they don't make an update. It also allows for reporting of SBOM and CVEs at the logical application level based on a specific version.

And when a new version of the service has been created, Ortelius provides a map that shows all 'logical' applications that are impacted by an update, what we like to call the 'blast radius.' And yes, each impacted 'logical application' gets a new software bill of material report and CVE, with all lower level transitive dependencies and open-source packages. 


<div class="col-center">
<p class="text-center"><strong>Component Usage</strong></p>
<img src="/images/impact.jpg" alt="Component Usage" />
</div>

## Conclusion

Lets face it, implementing a decoupled cloud-native architecture could become a huge tangled hair ball without a catalog to organize the data and a dashboard to use it. Ortelius is the easiest way to manage your software component supply chain across all clusters and endpoints. 

</div>
{{< /blocks/section >}}