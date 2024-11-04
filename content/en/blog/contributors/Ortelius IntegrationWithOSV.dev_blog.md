---
date: 2024-10-29
title: "How Ortelius Integrates with OSV.dev for Real-Time Vulnerability Detection"
linkTitle: "How Ortelius Integrates with OSV.dev for Real-Time Vulnerability Detection"
author: Jing Chen and Jesse Ku
---


## Introduction
The importance of Software Bill of Materials (SBOMs) in modern software development cannot be ignored. High-profile security incidents, like the SolarWinds attack or Log4J, underscore the critical need for greater transparency within software supply chains. The complexity of today's software systems, often comprising numerous dependencies and third-party components, poses a significant challenge in effectively tracking vulnerabilities. Consequently, regulations such as U.S. Executive Order 14028 have mandated the inclusion of SBOMs in federal software procurement, to systematically manage these complexities. Ortelius integrated with OSV.dev to bolster its vulnerability management capabilities, through package cross-referencing with the OSV.dev database. 

## Understanding Ortelius and OSV.dev
[Ortelius](https://ortelius.io/) is an open-source Continuous Vulnerability Management tool that enhances the software supply chain within decoupled architectures (where components are independent) by monitoring software artifacts and their dependencies throughout the development cycle, from code to cloud. It gathers extensive data from the CI/CD pipeline, including each artefact's security profile, such as SBOMs, vulnerabilities, and compliance details, which facilitates a comprehensive view of an application’s security posture. This dynamic integration is crucial for managing complex microservices and dependencies effectively, ensuring immediate knowledge of new vulnerabilities long after the artifact was created. In addition, Ortelius's ability to share and [federate SBOMs](http://localhost:1313/catalog/) support compliance with standards like U.S. Executive Order 14028.

[OSV.dev](https://osv.dev/) is an open vulnerability database that provides detailed and current data on Common Vulnerabilities and Exposures (CVE) that affect various open-source software libraries. It serves as a critical resource for developers, security researchers, and organizations, aiming to secure their applications from known threats. OSV.dev supports proactive security management by allowing precise identification of vulnerable software versions needing updates or patches, streamlining the vulnerability management process to focus on the most critical security risks.

## How Ortelius Integrates with OSV.dev
Follow the [Ortelius Installation Guide](https://docs.ortelius.io/guides/userguide/installation-and-support/) to ensure Ortelius is properly installed and configured.
1. Components within Ortelius are organized by domain and linked to specific applications that makeup a complete software solution. Ortelius mandates [adding components and applications](https://docs.ortelius.io/guides/userguide/addingtopipeline/) through CI/CD pipelines, utilizing the [Ortelius Command Line Interface (CLI)](https://docs.ortelius.io/guides/userguide/installation-and-support/0-commandlineinterface/) within the CI/CD processes to automate the capture of supply chain data at both the build and deployment stages.
2.	Components such as containers, jar files and executables, organized into Domains and Applications within Ortelius, facilitating systematic tracking and updates. [Ortelius tracks each component's security data](https://docs.ortelius.io/guides/userguide/2-define-components/), including SBOMs and vulnerabilities, providing detailed security profiles. 
3.	[Ortelius’ integrates with OSV.DEV for CVE checks](https://docs.ortelius.io/guides/userguide/integrations/osvdev/).
    - Cross-Referencing Packages: Ortelius uses OSV.dev to actively cross-reference packages listed in SBOMs against known vulnerabilities. By consuming SBOMs generated during CI/CD pipeline processes, Ortelius can precisely match these against the OSV.dev database on a continuous basis.
    - Frequency of Checks and Real-Time Monitoring: Ortelius is configured to perform vulnerability checks every 10 minutes by querying OSV.dev via its public APIs. This frequent scanning ensures that any new vulnerabilities reported are quickly identified and addressed, running concurrently with software builds and deployments to provide real-time security insights.
    - SBOMs generation: Integral to this process, SBOMs must include comprehensive details about each software component's origin, version, and dependencies for accurately identifying potential vulnerabilities. [Ortelius’ integration with SPDX and CycloneDX](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/) facilitates the inclusion of SBOMs in CI/CD pipelines, ensuring continual vulnerability assessments throughout the development and deployment stages.

<div style="text-align: center;">
  <img src="/images/Vulnerabilites.svg" alt="Vulnerabilities">
  <p><em>Sample Real-time Ortelius Vulnerability Reporting</em></p>
</div>

## Benefits of Ortelius Integration with OSV.dev
-Proactive Security Measures: the inclusion of SBOMs in CI/CD pipelines ensure continual vulnerability assessments throughout the development and deployment stages.
- Application-level vulnerability reporting in a decoupled architecture. Ortelius shares Component vulnerabilities with all consuming 'logical' Applications.
- Continuous Compliance: This integration facilitates continuous compliance with stringent security regulations and standards, ensuring any non-compliance is quickly detected and rectified.
- Enhanced DevOps Workflow: By embedding security into the CI/CD pipeline, Ortelius enables seamless security checks that enhance decision-making regarding component use and deployment without disrupting the development processes.

## Conclusion
The integration of Ortelius with OSV.dev represents a forward-thinking approach to software development and security. By adopting Ortelius and OSV.dev, organizations can not only enhance the security and compliance of their software but also maintain the agility required in a competitive business environment. Start by evaluating your current security and compliance measures and consider a pilot project with Ortelius to see firsthand the benefits it can bring to your software supply chain management. Embrace the change towards a more secure and efficient software development lifecycle today. For more information on vulnerability management in complex, microservice-based environments, explore [Ortelius](https://docs.ortelius.io/guides/).

## Learn More About the Authors:

- [Jing Chen](https://www.linkedin.com/in/jingchen-ku/) 
- [Jesse Ku](https://www.linkedin.com/in/jesse-ku-978693319/)