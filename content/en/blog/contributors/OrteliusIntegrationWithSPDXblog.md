---
date: 2024-10-28
title: "How Ortelius Integrates and Consumes SPDX and CycloneDX SBOMs for Enhanced Software Visibility"
linkTitle: "How Ortelius Integrates and Consumes SPDX and CycloneDX SBOMs for Enhanced Software Visibility"
author: Jing Chen and Jesse Ku
---

## Introduction
Software Bill of Materials (SBOMs) in modern software development is critical for managing software security, compliance, and supply chain integrity. Security breaches like the SolarWinds attack have underlined the need for transparency in the software supply chain. Increasing regulatory demands, such as U.S. Executive Order 14028, mandate SBOMs for federal software procurement. Widely adopted formats like **SPDX** and **CycloneDX** accommodate the complex structure of large software projects, which often consist of hundreds of dependencies (connections and relationships between various components), making it challenging to manage all the details in an SBOM. 

Integrating SBOMs into DevSecOps processes not only automates the generation of SBOMs during the build and deployment stages but also ensures that each release includes an updated SBOM. This is particularly invaluable for managing complex microservices and software dependencies. Tools like Ortelius enhance this process by visualising microservice architectures, tracking dependencies, and continuously updating SBOMs within the CI/CD pipeline.

## What are SPDX and CylconeDX?
Software Package Data Exchange ([SPDX](https://spdx.dev/)) is an open standard (publicly available), maintained by the Linux Foundation and recognised as an ISO standard. It provides a structured format for recording metadata about software components, including licensing, versioning, and security details.

<div style="text-align: center;">
  <img src="/images/spdxjasonsample.png" alt="SPDXJSON Sample (spdx-spec, 2010)">
  <p><em>SPDXJSON Sample (spdx-spec, 2010)</em></p>
</div>

<br>

[CycloneDX](https://cyclonedx.org/), initially developed by **OWASP**, focuses on software supply chain transparency, tracking component vulnerabilities, and managing dependencies. It is widely used in cybersecurity and DevSecOps practices and is an international standard for Bill of Materials, ECMA-424. 

<br>

<div style="text-align: center;">
  <img src="/images/cyclonedxjsonsample.png" alt="CycloneDX JSON example (Cyclone.org,2924)">
  <p><em>CycloneDX JSON example (Cyclone.org,2924)</em></p>
</div>

## How Ortelius Integrates SPDX and CycloneDX?

Follow the [Ortelius Installation Guide](https://docs.ortelius.io/guides/userguide/installation-and-support/) to ensure Ortelius is properly installed and configured.
1. Components are organized within Ortelius by domain and can be linked to specific applications as necessary. Ortelius mandates [adding components and applications](https://docs.ortelius.io/guides/userguide/addingtopipeline/) through CI/CD pipelines, utilizing the Ortelius [Command Line Interface (CLI)](https://docs.ortelius.io/guides/userguide/installation-and-support/0-commandlineinterface/) within the CI/CD processes to automate the capture of supply chain data at both the build and deployment stages.

2.	Components such as containers, jar files and executables, organised into Domains and Applications within Ortelius, facilitate systematic tracking and updates. [Ortelius tracks each component's security data](https://docs.ortelius.io/guides/userguide/2-define-components/), including SBOMs and vulnerabilities, providing detailed security profiles. 

3.	[Ortelius’ integration with SPDX and CycloneDX](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/)’s generated SBOMs can manage software components' security and compliance more effectively. If not already generating SBOMs, one can include Syft in their CI/CD pipeline to create SBOMs for various programming environments and Docker images. The Ortelius CLI is used post-build to update component data with SBOM information, facilitating continuous monitoring and management of software vulnerabilities and compliance.


## Benefits of SBOM Integration with Ortelius

- Aggregated SBOMs are key in a cloud-native architecture. Ortelius shares SBOMs at the Component level and generates a [logical application SBOM](https://ortelius.io/catalog/). 
- Real-time tracking of all dependencies and versions allows organizations to proactively address vulnerabilities after the build step and before they are exploited.
- Documentation of software licenses through SBOMs ensures compliance with open-source licensing and reducing legal risks.
- Ortelius offers a **single pane of glass** view into the entire software supply chain, simplifying the management of complex microservice-based architectures.
- Integrating SBOM generation and monitoring into CI/CD pipelines enhances security and compliance workflows.

<br>
<div style="text-align: center;">
  <img src="/images/sbom-application.png" alt="sample sbom gets updated during the build">
  <p><em>Federated SBOM</em></p>
</div><br>


<div style="font-size:1.6em;text-align:left;margin-top:10px;">

[View Compete Application-level SBOM](/images/application-sbom.pdf)

</div>

## Conclusion

With the growing importance of adopting SBOMs for software transparency and security, Ortelius offers a method of consumption of the data for continuous vulnerability management. Ortelius streamlines the integration and management of SPDX and CycloneDX SBOMs, helping organizations in efficiently securing their software supply chain. For more information on optimizing SBOM management in complex, microservice-based environments, explore [Ortelius](https://docs.ortelius.io/guides/).

## References
CycloneDX.org (2024) CycloneDX Use Cases. 2024. https://cyclonedx.org/use-cases/ [Accessed: 25 October 2024].

spdx-spec (2010) spdx-spec/examples/SPDXJSONExample-v2.2.spdx.json at development/v2.2.2 · spdx/spdx-spec. 29 January 2010. GitHub. https://github.com/spdx/spdx-spec/blob/development/v2.2.2/examples/SPDXJSONExample-v2.2.spdx.json [Accessed: 25 October 2024].



{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Authors</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Jing Chen](https://www.linkedin.com/in/jingchen-ku/) 
- [Jesse Ku](https://www.linkedin.com/in/jesse-ku-978693319/)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/Jingandjesse.png" alt="Meet the Speakers"  />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}



