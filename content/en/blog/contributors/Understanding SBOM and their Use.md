# Understanding SBOM and their Use

by **Jing Chen**, **Jesse Ku** | 22 October 2024
## What is SBOM?
SBOM stands for “Software Bill of Materials”. This is an important tool for software security and managing risks within the software supply chain.  It lists the components used and software dependencies of a software package, including open-source and third-party components, to help developers better understand and manage their software packages  (cisa.gov, 2024; L, 2024). 

With the modernisation of software relying on numerous third-party components, it’s crucial for companies to know exactly what is inside their software. This ensures security and compliance, as well as effective vulnerability management and quick response to threats.

- **SBOMs are essential for identifying and mitigating security risks**. If a vulnerability is found in a widely used library, organisations with an SBOM can quickly determine whether they are affected.
- **Many industries and regulations now require transparency in software development, particularly with open-source components**. An SBOM helps ensure these compliance requirements are met.
- **Software supply chain risks have become more prominent (e.g. SolarWinds attack (2020), log4j vulnerability (2021))**. SBOMs help organisations manage and track all third-party components within their software supply chain.

## How SBOMS are Used?

Here are the uses of SBOMs:

- Companies can use SBOMs for regular security audits. It allows them to monitor what components are in use and ensure none are outdated or vulnerable. 
- In the event of a cyberattack, an SBOM allows for quick identification of vulnerable components. 
- SBOMs provide insight into the licenses of third-party software. This is critical for ensuring companies comply with open-source license terms.
- SBOMs can be integrated into DevSecOps pipelines to continuously monitor components throughout the software lifecycle, ensuring that security is built into every stage of development

<div style="text-align: center;">
  <img src="DevSecOps Workflow.png" alt="DevSecOps Workflow">
  <p><em>DevSecOps Workflow (Gittlen, 2024)</em></p>
</div>

- SBOMs play a critical role in risk management by offering full visibility into software components, enabling proactive identification of security risks and facilitating timely updates or replacement of vulnerable components.

## How SBOMs are Created and Managed?
Maintaining an accurate and up-to-date SBOM, especially in fast-paced development environments, can be challenging. Large software projects may include hundreds of dependencies, making it difficult to manage all the information within an SBOM. SBOMs can be created and managed in the following ways:

- Automated tools: Companies can generate SBOMs using tools like [CycloneDX](https://cyclonedx.org/), [SPDX](https://spdx.dev/), [Syft](https://github.com/anchore/syft) or others that integrate into their CI/CS pipelines.
- Development workflows integration: Developers and security teams can incorporate SBOMs into their regular workflows for continuous monitoring and management.

## Why Ortelius?
The Ortelius project is creating a console that enables users to identify vulnerabilities in software systems and provides enhanced visibility into components such as libraries and microservices, utilised within an organisation. It can consume any SPDX and CycloneDX formatted SBOM to help generate and manage a SBOM in several ways:

- Maps out all microservices with an application, including dependencies and versions.
- Integrates with DevSecOps processes to automate the generation of SBOMs during the build and deployment stages. By integrating into CI/CD pipelines, it ensures that each release has an updated SBOM. See [How Ortelius Collecting SBOM data with SPDX, CycloneDX and Syft](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/) for details.

<div style="text-align: center;">
  <img src="Sample SBOM Working Report.png" alt="Sample SBOM Working Report">
  <p><em>Sample SBOM Working Report</em></p>
</div>

Governments and regulatory bodies are increasingly mandating SBOMs as part of cybersecurity frameworks, especially in critical infrastructure sectors. The U.S. Executive Order 14028 mandates SBOM use to secure the software supply chain (gsa.gov, 2021).  The UK National Cyber Security Centre, the Australian Cyber Security Centre and the Canadian Communication Security Establishment also published recommendations for SBOM implementation (Poireault, 2024).The SBOM adoption across industries is also increasing, Gartner estimated a 20% increase in 2022 and over 60% of organisations will adopt it by 2025 (Poireault, 2024). Developers and organisations should start implementing SBOMs in their software development processes to stay ahead of security and compliance challenges.

## References 
cisa.gov (2024) Software Bill of Materials (SBOM) | CISA. 2024. https://www.cisa.gov/sbom [Accessed: 22 October 2024].

Gittlen, S. (2024). The ultimate guide to SBOMs. [online] GitLab. Available at: https://about.gitlab.com/blog/2022/10/25/the-ultimate-guide-to-sboms/.

gsa.gov (2021) Executive Order 14028: Improving the Nation’s Cybersecurity. 12 May 2021. U.S. General Services Administration. https://www.gsa.gov/technology/it-contract-vehicles-and-purchasing-programs/information-technology-category/it-security/executive-order-14028 [Accessed: 23 October 2024].

L, H. (2024) SBOMs and the importance of inventory. 11 September 2024. https://www.ncsc.gov.uk/blog-post/sboms-and-the-importance-of-inventory [Accessed: 22 October 2024].

Poireault, K. (2024) How Organisations Can Leverage SBOMs to Improve Software Security. 14 March 2024. https://www.infosecurityeurope.com/en-gb/blog/regulation-and-policy/how-sboms-improve-software-security.html [Accessed: 23 October 2024].

