---
title: Component and Microservice Versioning
description: Ortelius versioning features.
summary: Component and Microservice Versioning
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Component and Microservice Versioning</h1>
<hr>

## Know What Changed

As we move into a decoupled, cloud-native architecture we must take additional steps to track the hundreds of changes moving across our pipeline. When you fully embrace microservices you quickly start asking questions about who is consuming a service, what version is running in what cluster, who owns it and where can you find the associated software bill of material and CVE.

In our monolithic days, it was important to version source code so we understood what version of the code was compiled/linked into our builds. We now must track this at the run-time level. A deployment of a new shared container is our new 'compile/link' step. For this reason, microservice versioning is critical. Tracking hundreds of changes occurring at the same time requires continuous data gathering for each change, captured and tagged as a version. A new version of a lower level component impacts all 'logical' applications who consume it. This means a new application version is created each time a dependency is updated. A single 'logical application' that you deliver to an end user could have many new versions over the course of a few days. Each new version has a new software bill of material and CVE for example. In cloud-native, nothing stays the same for long.

#### Impact on Logical Applications

Logical applications are a collection of components (containers, DB Objects, files). 'Logical applications' are impacted and changed when its dependencies are updated. In our monolithic world, we would use the build number to version the release candidate. In a decoupled architecture, component and microservice versioning tracks the new releases. As microservices become more of the norm, developers will begin to share and reuse microservices across company silos. This sharing will create more microservice dependencies between teams. While this adds to the complexity of a microservice architecture, it also creates a more stable environment by reducing redundant code.

The use of versioning at the component, microservice and application level addresses the complexity and keeps everyone informed of service usage across many teams.

## Conclusion

Ortelius is a central 'evidence' store of all supply chain data and DevOps intelligence used across teams and organizational siloes. Ortelius integrates into your DevOps Pipeline to automate the collection of this data with versioning at both your component and 'logical application' levels. Ortelius is called at the 'build' step of your updated container or object. Ortelius captures Swagger logs, readme, SBOMs, and other build data, and then collects the new container data, such as the tag, when the container is registered. With this information, Ortelius creates a new version of the component. This in turn creates new versions of all consuming 'logical' applications. No manual work required.

Ortelius exposes risk by consuming each Component's Software Bill of Material (SBOM). This information provides a mountain of security data including the open-source packages and licenses. Ortelius can use this data to make it easy to answer the question "Where are we using Log4J?"

<br>
<br>

<div class="col-center">
<p class="text-center"><strong>Component Details</strong></p>
<img src="/images/componentdetails.png" alt="Component Details" />
</div>
<br>
<br>
<br>

<div class="col-center">
<p class="text-center"><strong>Component Versions</strong></p>
<img src="/images/componentversions.png" alt="component versions" />
</div>
<br>
<br>
<br>
<div class="col-center">
<p class="text-center"><strong>Application Versions</strong></p>
<img src="/images/applicationversions.png" alt="application versions" />
</div>

{{< /blocks/section >}}
