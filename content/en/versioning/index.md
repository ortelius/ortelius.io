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

As we move into a decoupled, cloud-native architecture we must take additional steps to track the hundreds of changes moving across our pipeline. When you fully embrace a decoupled architecture you quickly start asking questions about who is consuming a component, what version is running in what cluster, who owns it, and where are the associated software bill of material and CVE reports.

In our monolithic days, it was important to version source code so we understood what version of the code was compiled/linked into our builds. We now must track this at the run-time level. A deployment of a new shared container is our new 'compile/link' step. For this reason, software supply chain versioning is critical. Tracking hundreds of changes requires continuous data gathering for every change, with tagged versions. A new version of a lower level component impacts all 'logical' applications who consume it. This means a new application version is created each time a dependency is updated. A single 'logical application' that you deliver to an end user could have many new versions over the course of a few days. Each new version has a new software bill of material and CVE updates. Cloud-native, decoupled architectures are highly dynamic with hundreds of dependencies changing all day long. 

#### Impact on Logical Applications

Decoupled applications disrupts the application release process. Now, the application is collection of independently deployed components (containers, DB Objects, AI Agents, files). A logical representation of the application is needed to aggregate security reports such as SBOMs and CVEs. Managing this data one container at a time impedes a rapid response to high-risk vulnerabilities across the entire organization. A decoupled architecture creates a more stable environment by reducing redundant code and objects. However, it fragments the security and DevOps intelligence causing application level SBOMs and CVE reports to be lost. 

## How Ortelius Helps - Tracking the Software Supply Chain with Logical Applications and Versions
The Ortelius evidence store has the ability to track component versions aggregated up to the logical application version. Each time a component is updated, a new logical version of all consuming applications is created, along with new SBOMs and new CVE analysis. This tracking information is also associated to any environment where the change has been deployed providing a full inventory of where all open-source packages are running and when they were installed providing CISO Teams the ability to quickly evaluate risk and response to supply chain security events. 


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
<br>
<br>
<br>
<div class="col-center">
<p class="text-center"><strong>Aggregated Application Version SBOM and CVEs </strong></p>
<img src="/images/SBOMandCVE.png" alt="application SBOMs in a decoupled architecture" />
</div>
<br>

## Conclusion

Ortelius is a central 'evidence' store of all supply chain and DevOps intelligence collected from the DevOps pipeline, and aggregated to application and organizational levels. Ortelius captures security results from tools such as Syft, SonarKube, and Veracode along with deployment insights to create a record of truth for every component update. With this information, Ortelius provides continuous, sweeping insights about open-source usage and inventory, component sharing, and logical application configurations with all security and DevOps insights needed by CISO and Development teams to confidently consume open-source across the organization. 


{{< /blocks/section >}}
