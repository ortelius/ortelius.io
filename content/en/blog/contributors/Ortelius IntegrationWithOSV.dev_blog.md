# How Ortelius Integrates with OSV.dev for Real-Time Vulnerability Detection

by **Jing Chen**, **Jesse Ku** | 28 October 2024
## Introduction
In the evolving realm of cybersecurity, the importance of Software Bill of Materials (SBOMs) in modern software development cannot be ignored. High-profile security incidents, like the SolarWinds attack, underscore the critical need for greater transparency within software supply chains. The complexity of today's software systems, often comprising numerous dependencies and third-party components, poses a significant challenge in effectively tracking vulnerabilities. Consequently, regulations such as U.S. Executive Order 14028 have mandated the inclusion of SBOMs in federal software procurement, to systematically manage these complexities. Ortelius integrated with OSV.dev to bolster its vulnerability management capabilities, through package cross-referencing with the OSV.dev database. 

## Understanding Ortelius and OSV.dev
[Ortelius](https://ortelius.io/) is an open-source Continuous Security Intelligence tool that enhances security management within decoupled architectures (where components are independent) by monitoring software components and their dependencies throughout the development cycle. It gathers extensive data from the CI/CD pipeline (a series of steps that enhance the software delivery process), including each artefact's security profile, such as SBOMs, vulnerabilities, and compliance details, which facilitates a comprehensive view of an application’s security posture. This integration is crucial for managing complex microservices and dependencies effectively, ensuring immediate responses to vulnerabilities and aiding compliance with standards like U.S. Executive Order 14028.

[OSV.dev](https://osv.dev/) is an open vulnerability database that provides detailed and current data on Common Vulnerabilities and Exposures (CVE) that affect various software components. It serves as a critical resource for developers, security researchers, and organisations, aiming to secure their applications from known threats. OSV.dev supports proactive security management by allowing precise identification of vulnerable software versions needing updates or patches, streamlining the vulnerability management process to focus on the most critical security risks.

## How Ortelius Integrates with OSV.dev
Follow the [Ortelius Installation Guide](https://docs.ortelius.io/guides/userguide/installation-and-support/) to ensure Ortelius is properly installed and configured.
1. Components within Ortelius are organised by domain and linked to specific applications as necessary. Ortelius mandates [adding components and applications](https://docs.ortelius.io/guides/userguide/addingtopipeline/) through CI/CD pipelines, utilising the Ortelius Command Line Interface (CLI) within the CI/CD processes to automate the capture of supply chain data at both the build and deployment stages.
2.	Components such as containers, jar files and executables, organised into Domains and Applications within Ortelius, facilitating systematic tracking and updates. [Ortelius tracks each component's security data](https://docs.ortelius.io/guides/userguide/2-define-components/), including SBOMs and vulnerabilities, providing detailed security profiles. 
3.	[Ortelius’ integrates with OSV.DEV for CVE checks](https://docs.ortelius.io/guides/userguide/integrations/osvdev/).
    - Cross-Referencing Packages: Ortelius uses OSV.dev to actively cross-reference packages listed in SBOMs against known vulnerabilities. By consuming SBOMs generated during CI/CD pipeline processes, Ortelius can precisely match these against the OSV.dev database.
    - Frequency of Checks and Real-Time Monitoring: Ortelius is configured to perform vulnerability checks every 10 minutes by querying OSV.dev via its public APIs. This frequent scanning ensures that any new vulnerabilities reported are quickly identified and addressed, running concurrently with software builds and deployments to provide real-time security insights.
    - SBOMs generation: Integral to this process, SBOMs must include comprehensive details about each software component's origin, version, and dependencies for accurately identifying potential vulnerabilities. [Ortelius’ integration with SPDX and CycloneDX](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/) facilitates the inclusion of SBOMs in CI/CD pipelines, ensuring continual vulnerability assessments throughout the development and deployment stages.

<div style="text-align: center;">
  <img src="Vulnerabilities.png" alt="Vulnerabilities">
  <p><em>Sample Vulnerability List</em></p>
</div>

## Benefits of Ortelius Integration with OSV.dev
- Proactive Security Measures: the inclusion of SBOMs in CI/CD pipelines ensure continual vulnerability assessments throughout the development and deployment stages.
- Continuous Compliance: This integration facilitates continuous compliance with stringent security regulations and standards, ensuring any non-compliance is quickly detected and rectified.
- Enhanced DevOps Workflow: By embedding security into the CI/CD pipeline, Ortelius enables seamless security checks that enhance decision-making regarding component use and deployment without disrupting the development processes.

<br>
The integration of Ortelius with OSV.dev represents a forward-thinking approach to software development and security. By adopting Ortelius and OSV.dev, organisations can not only enhance the security and compliance of their software but also maintain the agility required in a competitive business environment. 

Start by evaluating your current security and compliance measures and consider a pilot project with Ortelius to see firsthand the benefits it can bring to your software supply chain management. Embrace the change towards a more secure and efficient software development lifecycle today.


