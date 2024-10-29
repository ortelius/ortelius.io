# How Ortelius Integrates and Consumes SPDX and CycloneDX SBOMs for Enhanced Software Visibility
by **Jing Chen**, **Jesse Ku** | 28 October 2024
## Introduction
Software Bill of Materials (SBOMs) in modern software development is critical for managing software security, compliance, and supply chain integrity. Security breaches like the SolarWinds attack have underlined the need for transparency in the software supply chain. Increasing regulatory demands, such as U.S. Executive Order 14028, mandate SBOMs for federal software procurement. Widely adopted formats like **SPDX** and **CycloneDX** accommodate the complex structure of large software projects, which often consist of hundreds of dependencies (connections and relationships between various components), making it challenging to manage all the details in an SBOM. 

Integrating SBOMs into DevSecOps processes not only automates the generation of SBOMs during the build and deployment stages but also ensures that each release includes an updated SBOM. This is particularly invaluable for managing complex microservices and software dependencies. Tools like Ortelius enhance this process by visualising microservice architectures, tracking dependencies, and continuously updating SBOMs within the CI/CD pipeline.

## What are SPDX and CylconeDX?
Software Package Data Exchange ([SPDX](https://spdx.dev/)) is an open standard (publicly available), maintained by the Linux Foundation and recognised as an ISO standard. It provides a structured format for recording metadata about software components, including licensing, versioning, and security details.

<div style="text-align: center;">
  <img src="SPDXJSON Sample.png" alt="SPDXJSON Sample (spdx-spec, 2010)">
  <p><em>SPDXJSON Sample (spdx-spec, 2010)</em></p>
</div>

<br>

[CycloneDX](https://cyclonedx.org/), initially developed by **OWASP**, focuses on software supply chain transparency, tracking component vulnerabilities, and managing dependencies. It is widely used in cybersecurity and DevSecOps practices and is an international standard for Bill of Materials, ECMA-424. 

<br>

<div style="text-align: center;">
  <img src="CycloneDX JSON example.png" alt="CycloneDX JSON example (Cyclone.org,2924)">
  <p><em>CycloneDX JSON example (Cyclone.org,2924)</em></p>
</div>

## How Ortelius Integrates SPDX and CycloneDX?

Follow the [Ortelius Installation Guide](https://docs.ortelius.io/guides/userguide/installation-and-support/) to ensure Ortelius is properly installed and configured.
1. Components are organised within Ortelius by domain and can be linked to specific applications as necessary. Ortelius mandates [adding components and applications](https://docs.ortelius.io/guides/userguide/addingtopipeline/) through CI/CD pipelines, utilising the Ortelius Command Line Interface (CLI) within the CI/CD processes to automate the capture of supply chain data at both the build and deployment stages.

2.	Components such as containers, jar files and executables, organised into Domains and Applications within Ortelius, facilitate systematic tracking and updates. [Ortelius tracks each component's security data](https://docs.ortelius.io/guides/userguide/2-define-components/), including SBOMs and vulnerabilities, providing detailed security profiles. 

3.	[Ortelius’ integration with SPDX and CycloneDX](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/)’s generated SBOMs can manage software components' security and compliance more effectively. If not already generating SBOMs, one can include Syft in their CI/CD pipeline to create SBOMs for various programming environments and Docker images. The Ortelius CLI is used post-build to update component data with SBOM information, facilitating continuous monitoring and management of software vulnerabilities and compliance.

<br>
<div style="text-align: center;">
  <img src="sample sbom gets updated during the build.png" alt="sample sbom gets updated during the build">
  <p><em>sample SBOM gets updated during the build</em></p>
</div>

## Benefits of SBOM Integration with Ortelius

- Real-time tracking of all dependencies and versions allows organisations to proactively address vulnerabilities before they are exploited.
- Documentation of software licenses through SBOMs ensures compliance with open-source licensing and reducing legal risks.
- Ortelius offers a **single pane of glass** view into the entire software supply chain, simplifying the management of complex microservice-based architectures.
- Integrating SBOM generation and monitoring into CI/CD pipelines enhances security and compliance workflows.

<br>
<br>

With the growing importance of adopting SBOMs for software transparency and security. Ortelius streamlines the integration and management of SPDX and CycloneDX SBOMs, helping organisations in efficiently securing their software supply chain. For more information on optimising SBOM management in complex, microservice-based environments, explore [Ortelius](https://docs.ortelius.io/guides/).

## References
CycloneDX.org (2024) CycloneDX Use Cases. 2024. https://cyclonedx.org/use-cases/ [Accessed: 25 October 2024].

spdx-spec (2010) spdx-spec/examples/SPDXJSONExample-v2.2.spdx.json at development/v2.2.2 · spdx/spdx-spec. 29 January 2010. GitHub. https://github.com/spdx/spdx-spec/blob/development/v2.2.2/examples/SPDXJSONExample-v2.2.spdx.json [Accessed: 25 October 2024].

