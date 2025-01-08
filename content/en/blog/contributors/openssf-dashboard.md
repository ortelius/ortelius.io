---
date: 2024-12-21
title: "The Ortelius OpenSSF Dashboard"
linkTitle: "The Ortelius OpenSSF Dashboard"
author: Steve Taylor
---


## Introduction
The [OpenSSF Scorecard](https://openssf.org/) is an essential security metrics tool incubating at the Linux Foundation's OpenSSF. OpenSSF Scorecard is designed to expose an open-source project or package adherence to security best practices. It assigns scores to expose a project's commitment to delivering secure open-source software to enterprises worldwide. With code-level vulnerabilities increasing each year, OpenSSF Scorecard provides open-source consumers the visibility needed to make informed decisions about the dependencies they consume.

In its latest release, Ortelius introduced an OpenSSF Dashboard that centralizes OpenSSF Scorecard metrics at the "logical application" level. Logical applications often rely on hundreds of microservices and APIs, referred to as Components, which themselves depend on numerous open-source packages. Ortelius simplifies this complexity by aggregating dependency data at both the Component and Application levels. This gives end-users a clear, comprehensive view of Scorecard results across all dependencies within their logical applications.

## Understanding Ortelius and OpenSSF Scorecard
[Ortelius](https://ortelius.io/) gathers the OpenSSF Scorecard 'checks' fore each package version dependency found in a [Software Bill of Materials](https://ortelius.io/blog/2024/10/28/how-ortelius-integrates-and-consumes-spdx-and-cyclonedx-sboms-for-enhanced-software-visibility/) report. Ortelius exposes each OpenSSF Scorecard check listing a score of 0-10, with 10 being the highest level of compliance. These scores are used to understand specific areas of security strength or weakness providing a clear picture of the projects adherence to security standards. Ortelius makes it easy to see the complete security posture of a logical application, giving consumers the insights needed to make informed decisions about accepting security risks within a codebase.

OpenSSF Scorecard data is derived from the Git Repository associated to the Component Version.


## How Ortelius Integrates with OSV.dev
Ortelius integrates with Software Bill of Material (SBOM) and OpenSSF Scorecard via the CI/CD pipeline. If an SBOM is generated at the Component Level, Ortelius will automatically search the defined Repository for OpenSSF Scorecard results. For each logical Application that consumes the Component, Ortelius will aggregate the data and display a comprehensive view of the package level OpenSSF Scores. 

<div style="text-align: center;">
  <img src="/images/fullscreen-sbom-applevel-withvuln-hr.png" alt="OpenSSF Dashboard">
  <p><em>Sample Real-time Ortelius OpenSSF Scorecard Reporting</em></p>
</div>

## Benefits of Ortelius Integration with OpenSSF Scorecard
- Increased Sharing: Sharing Scorecard results demonstrates a commitment to security, encouraging users and contributors to trust and engage with the project.
- Community Accountability: Reporting gaps or low scores can motivate contributors to step in and help improve security measures.
- Collaboration: Allows maintainers of different projects to learn from each other’s successes and challenges.
- Transparency: Open-source consumers can easily determine the risk of an open-source dependency allowing them to make informed decisions. 

## Conclusion
The integration of Ortelius with OpenSSF Scorecard represents a forward-thinking approach to software development and security. By adopting Ortelius, enterprise IT teams have a single source to determine the safety of the open-source packages they use, and demand better. 

Get started by evaluating your current security and compliance measures and consider a pilot project with Ortelius to see firsthand the benefits it can bring to your software supply chain management. Embrace the change towards a more secure and efficient software development lifecycle today. For more information on vulnerability management in complex, microservice-based environments, explore [Ortelius](https://docs.ortelius.io/guides/).


{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Authors</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Steve Taylor](https://www.linkedin.com/in/steve-taylor-oms/) 


{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/steveandalien2.png" alt="Meet the Speakers"  />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}