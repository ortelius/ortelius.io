---
title: Track Open-Source and Shared Component Changes
description: Continuous Software Supply Chain Versioning
summary: Track Open-Source and Shared Component Changes
type: contributor
---


{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Continuously Monitor the Updates to Your Software Supply Chain</h1>
<hr>

## Change Happens

Software systems undergo daily changes and enhancements driven by the constant need for business agility. High-frequency software updates allow developers to submit modifications, updates, and new features, on a daily to hourly basis, ensuring that the software evolves rapidly in response to business demands. As a result, users benefit from not only the latest features but also ongoing bug fixes. However, with an increase in the frequency of software updates, the risk of introducing a new open-source software vulnerability increases. For this reason, the ability to view the changes to an organization's complete software supply chain is important. Change is where historical data is derived and trends can be analyzed. 

## Know What Changed

As we move into a decoupled, cloud-native architecture we must take additional steps to track the hundreds of changes moving across our pipeline. When you fully embrace a decoupled architecture you quickly start asking questions about who is consuming a component, what version is running in what cluster, who owns it and where can you find the associated software bill of material and CVE.

In our monolithic days, it was important to version source code so we understood what version of the code was compiled/linked into our builds. We now must track this at the run-time level. A deployment of a new shared container is our new 'compile/link' step. For this reason, software supply chain versioning is critical. Tracking hundreds of changes requires continuous data gathering for every change, with tagged versions. A new version of a lower level component impacts all 'logical' applications who consume it. This means a new application version is created each time a dependency is updated. A single 'logical application' that you deliver to an end user could have many new versions over the course of a few days. Each new version has a new software bill of material and CVE for example. In high frequency agile environments, nothing stays the same for long. 

#### Impact on Logical Applications

Logical applications are a collection of components (containers, DB Objects, files). 'Logical applications' are impacted and changed when its dependencies are updated. In our monolithic world, we would use the build number to version the release candidate. In a decoupled architecture, software supply chain versioning tracks the new releases. As decoupled architecture become the norm, developers will begin to share and reuse objects across organizational silos. This sharing will create more software dependencies between teams. A decoupled architecture creates a more stable environment by reducing redundant code and objects. However, the security and DevOps intelligence becomes fragmented as it is collected for one object at a time. Logical application SBOMs and CVEs are lost. 

The use of versioning at the contianer and application level addresses the complexity and keeps everyone informed of shared usage across teams, and where open-source packages are consumed. 

## Conclusion

Ortelius is a central 'evidence' store of all supply chain data and DevOps intelligence used across teams and organizational siloes. Ortelius integrates into your DevOps Pipeline to automate the collection of this data with versioning at both your component and 'logical application' levels. Ortelius is called at the 'build' step of your updated container or object. Ortelius captures SBOMs, Swagger logs, readme, and other build data, and then collects the new container data, such as the tag, when the container is registered. With this information, Ortelius creates a new version of the component. This in turn creates new versions of all consuming 'logical' applications. No manual work required.

Ortelius exposes risk by consuming each Component's Software Bill of Material (SBOM). This information provides a mountain of security data including the open-source packages and licenses. Ortelius continuously tracks this level of software supply chain data making it easy to answer the question "Where are we using Log4J?"

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
