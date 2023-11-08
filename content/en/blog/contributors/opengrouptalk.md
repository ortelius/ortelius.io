---
date: 2023-11-08
title: "Exposing and Controlling Open-Source Within Your Supply Chain"
summary: Exposing and Controlling Open-Source Within Your Supply Chain
author: Tony Carrato and Tracy Ragan
---

<div>
<img src="/images/boywithmagnifying.jpg" alt="exposing supply chain" height="220px" width="474x" />
</div>


## Introduction

Open-source software has witnessed a remarkable evolution over the past few decades. The concept of freely sharing code and collaborating on software development has given rise to a vast ecosystem of open-source projects and communities. This openness has led to innovation, accessibility, and affordability, making it an attractive option for businesses seeking cost-effective solutions.

However, with great opportunity comes great responsibility. The extensive reliance on open-source software within supply chains introduces potential cybersecurity risks and challenges that organizations must address to ensure the integrity of the software delivered to end users. 

## Software Security is Complex

Software developers consume open-source libraries and packages in their normal development process. In many cases, developers are not aware of the package dependencies they consume. A single package dependency tree can include hundreds of objects, making it difficult for a developer to be accountable for every consumed object.  

According to [GitHub’s 2023 Octoverse Report](https://octoverse.github.com/), 97% of applications depend on open-source packages. Applications can include firmware, display utilities, security logging, AI systems, infrastructure components, and tools for operational tasks. 

The complexity of software has led to an astonishing increase in malicious supply chain attacks. According to [Sonatype’s 2023 State of the Software Supply Chain](https://www.sonatype.com/state-of-the-software-supply-chain/introduction), supply chain attacks have increased by 742% in the last two years. Cybersecurity is considered a ‘business risk’ by 88% of Boards; according to Gartner, McKinsey and Company reports 65-80% of organizations are seeking more visibility into the logs of application security tooling.  

Even more astonishing, JFrog reports that 45% of enterprises will experience a supply chain attack by 2025 and that it takes an average of 227 days to containment. 

The increase in open-source cyber attacks has led the Biden Administration to pass Executive Order 14028 (Improving the Nation’s Cybersecurity). The order requires all vendors providing software to the US Government to provide a Software Bill of Materials (SBOMS) report with each new release delivered. The goal is to expose the software supply chain of all software on which the US Government relies. 

## SBOMs are a Good Start

SBOMs are an essential tool for understanding an application’s dependencies, including open-source packages that the software depends on. SBOMs are critical for:

- Incident Response - SBOMs play a vital role in incident response by clearly identifying the affected software packages when a vulnerability is found. 

- Vulnerability Management - SBOMs enable organizations to quickly pinpoint which applications are affected by a vulnerability, reducing the patch time and mitigation response. 

- Supply Chain Security - By knowing the origin and history of each component, organizations can make informed decisions about which software components to include and which to avoid, reducing the risk of supply chain attacks. 

- Compliance and Auditing - SBOMs provide a comprehensive record of software components, making it easier to demonstrate compliance with security standards and regulations. 

- Trust and Assurance - By sharing SBOMs, customers and partners can review the software components used and asses their risks, fostering trust and assurance in the organization's cybersecurity practices. 

There are non-profit organizations working on standardizing SBOM metadata:

SPDX is a standard coming out of the Linux Foundation
- [CycloneDX is a project under OWASP](https://owasp.org/www-project-cyclonedx/)
- [Software Identification is part of ISO/IEX](https://www.iso.org/standard/65666.html)


## SBOM Challenges

SBOMs can provide important visibility into the composition of software applications. However, there are some critical challenges with SBOM adoption and consumption. 

### SBOM Adoption
The generation of SBOMs must be automated. Every time a new version of a software application is released, a new SBOM is created. In an agile environment, releases are done frequently, often several times a day. Generating manual SBOMs is not sustainable. The generation step must be added to the DevOps Pipeline. A static workflow file defines DevOps pipelines. Every pipeline must be updated to include the SBOM generation step. According to the most recent Jenkins Growth report, there are over 70 million workflows executed monthly. Updating these workflows to include SBOM generation is a monumental task. 

### SBOM Consumption
Developers push back on adding SBOM adoption to the pipelines if the SBOM data is not consumed. The [Information Technology Industry Trade Council](https://www.itic.org/documents/public-sector/ITILettertoOMBreM-22-18.pdf) objected to the Biden Administration’s order on SBOMs, stating,
“Given the current level of (im-)maturity, we believe that SBOMs are not suitable contract requirements yet. The SBOM conversation needs more time to move towards a place where standardized SBOMs are scalable for all software categories and can be consumed by agencies.” 

## Solutions to the SBOM Challenges - Federating Evidence

Consuming and reporting on the security insights of open-source is critical to encourage open-source teams to adopt security tooling. Consolidating this data with private enterprise open-source usage can produce immediate, actionable results, providing Government and Private sectors with the insights needed to respond to security incidents quickly.  For example, in the Log4J incident, organizations did not have immediate risk insights. They could not easily see how they were impacted, who used the library, and where it was deployed. For many organizations, they learned of the Log4J vulnerability through random social posts. Others lacked the information until it became the topic of international news.
A federated evidence store would have provided organizations with a central alert system with open-source insights to understand their exposure immediately. A federated evidence store would consume the SBOMs and SCA tooling data, providing organizational-level security risk profiles, even in complex decoupled architectures such as microservices and cloud-native. 

## Introducing Ortelius
Ortelius is an open-source project incubating at the Linux Foundation. It is a federated evidence store of [Supply Chain Data](https://ortelius.io/catalog/), including SBOMs, Software Composition Analysis, dependencies, and versions, with deployed locations. Ortelius is a continuous watch and rapid response system that allows teams to address vulnerabilities in hours, not months. Ortelius provides security profiles at the:
- Component Level
- Application Level
- Domain Level
- Environment Level
- Organization Level

Aggregated security profiles give CISO teams a comprehensive view of the organization's risks and vulnerabilities vs. seeing them one software component at a time. Ortleius also provides the data to build ML threat models, zero trust policies, and to generate standardized CI/CD pipelines with critical security tooling. 

<div>
<img src="/images/OrteliusArchitectureEvidenceStore.png" alt="evidence store" height="470px" width="996px" />
</div>

Ortelius has an active and growing community with 275 members, 800 LinkedIn Followers, and 70 GitHub Contributors, averaging 200 Pull Requests per year, equaling over 30,000 person-hours of contributed code. Learn more about Ortelius and the Ortelius project at Ortelius.io.

## More Learning
To learn more about supply chain security, visit the [OpenSSF](https://openssf.org/) and the [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework). The OpenSSF is committed to advancing open-source security through community collaboration. The OpenSSF is home to Sigstore, the OpenSSF Security Score Card, and SLSA.  

The NIST Cybersecurity Framework helps organizations better understand and improve their management of cybersecurity risks. NIST is also home to the National Vulnerability Database. 

## Conclusion

Open-source software is a valuable resource that can significantly enhance your supply chain. However, it comes with responsibilities that require a strategic and well-planned approach. By consuming open-source security insights within your supply chain, you can harness the data to create actionable results to minimize the risks of consuming open-source. Building a robust, federated evidence store for managing open-source components is not only a best practice but an essential element of responsible and secure software development. The Ortelius open-source community is committed to delivering an evidence store that will serve producers and consumers of open-source software across cloud-native and traditional architectures. 

## About the Authors


<div class="row">

<div class="col-2">
    <img src="/images/tonycarrato2.png" alt="Tony Carrato" height="300px" width="300px" /> 
</div>
<div class="col-10" style="text-align:left">

<strong>Tony Carrato</strong> 
- Independent Consultant
- Long-time participant at The Open Group
- Member of the Steering Committee of the Security Forum
- Active in ZTA work and the forthcoming Security Reference Architecture
- One of the primary authors of the Security Architecture Principles
- Ortelius Open-Source Board Advisor

</div>
</div>

<div class="row" style="margin-top:40px">

<div class="col-2">
    <img src="/images/Tracy-website.png" alt="Tracy Ragan" height="326px" width="314x" />
</div>
<div class="col-10">

<strong>Tracy Ragan</strong> 
- 25+ Years of experience in Software Configuration Management
- OpenSSF Governing Board Member 
- Continuous Delivery Foundation (CDF) Governing Board Member
- CDF Technical Oversight Committee
- Eclipse Foundation Governing Board
- CEO and Co-Founder DeployHub
- Ortelius Open-Source Community Organizer
- Co-Founder OpenMake Software

</div>
</div>



