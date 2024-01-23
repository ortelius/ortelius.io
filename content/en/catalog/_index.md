---
title: Supply Chain Data and DevOps Intelligence Dashboard
description: Ortelius Aggregates Supply Chain Data Across the Pipeline
summary: Use the Evidence You Already Collect
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Aggregated Security and DevOps Intelligence Across the Organization</h1>
<hr>

Ortelius is your go to place for DevOps and Security intelligence. The Ortelius evidence store and dashboard collects and displays as much data as possible from the DevOps Pipeline process. DevOps and Security data is fragmented across tools and left in the underlying build directory where the DevOps pipeline was executed. Most of the data is collected for one container at a time, making it difficult to see a complete software application's security profile, CVEs and SBOMs. By aggregating the data, Ortelius provides critical software supply chain intelligence needed for rapidly responding to cyber threats. Most important, Ortelius shows your open-source usage and details across the organization with ['logical applications'](/microservicemapping/ mapping. Some of the data collected by Ortelius includes:

* SBOM (SPDX or CycloneDX formats)
* Aggregated SBOMs in a Decoupled Architecture
* Open-source usage and inventory 
* SonarQube
* Syft
* OSV.dev
* CVE for each service with data aggregated up to the logical application
* Dora Metrics
* Ownership (email, Pagerduty, phone)
* Swagger
* Readme
* Open-source packages and licenses
* Versions over time based on the Container Tag
* Logical Application versions based on changes to the supporting microservices
* CD Pipeline and tooling (Jenkins, Tekton, Spinnaker, Commercial pipeline tools)
* Deployment Engine
* Key Value Pairs
* Environments and Endpoints
* Blast Radius and Usage
* Organization
* Inventory by version across all environments


## Components and Logical Applications

Each time a shared component is updated, all of the consuming 'logical' applications are impacted. Ortelius automatically tracks this impact by creating a new version number at the application level. This alerts all teams consuming that component that a new release candidate is available. Tracking changes at the logical application level gives project teams the knowledge of how their application changes overtime, even when they don't make an update. It also allows for reporting of SBOM and CVEs at the logical application level based on a specific version.

And when a new version of the component has been created, Ortelius provides a view of all 'logical' applications that are impacted by an update, what we like to call the 'blast radius.' And yes, each impacted 'logical application' gets a new software bill of material report and CVE, with all lower level transitive dependencies and open-source packages.

<div class="col-center">
<p class="text-center"><strong>Component Usage</strong></p>
<img src="/images/impact.jpg" alt="Component Usage" />
</div>

## Conclusion

Lets face it, implementing a decoupled cloud-native architecture could become a huge tangled hair ball without an evidence catalog to organize the data and a dashboard to use it. Ortelius is the easiest way to manage your software component supply chain across all clusters and endpoints.

</div>
{{< /blocks/section >}}
