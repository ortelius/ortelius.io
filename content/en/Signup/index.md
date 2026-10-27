---
title: Get Started with Ortelius SaaS
description: Get Started with Ortelius SaaS
summary: Take control of software supply chain vulnerabilities with Ortelius SaaS
menu:
  main:
   weight: 100
---

{{< blocks/section color=primary >}}
{{< blocks/feature_dual >}}

## Know What's Vulnerable. Know Exactly Where It's Running.
Ortelius is a free, open-source software supply chain platform that helps developers, DevOps engineers, platform teams, and security professionals detect vulnerabilities in software already deployed to production.

Most software supply chain scanning tools focus on identifying security issues before software is released, which is important. But new Common Vulnerabilities and Exposures (CVEs) are disclosed every day, often affecting open-source dependencies that have been running in production for months or years.

Ortelius closes this visibility gap by connecting Software Bills of Materials (SBOMs), open-source package inventories, and deployment metadata to continuously identify vulnerable software and locate the applications and endpoints where affected components are deployed.

Don't wait for the next critical CVE to discover where your vulnerable software is running.

<div style="font-size:1.8em;text-align:center;margin-top:10px">

[Get Started with Ortelius SaaS](https://app.deployhub.com/)

</div
>
{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

## Reporting on Vulnerabilities Is Easy. Finding Them in Production Is Hard.
Modern applications depend on hundreds or thousands of open-source packages. These dependencies are distributed across containers, microservices, application components, and deployment environments. Traditional vulnerability scanning identifies security issues during development or as part of a CI/CD pipeline. These scans are important, but they provide a point-in-time view of software security.

A dependency considered secure at deployment may become vulnerable weeks or months later.

When a new critical CVE is disclosed, development and security teams must answer:

- Are we using the affected open-source package?
- Which applications contain the vulnerable version?
- Where is that application currently deployed?
- Which endpoints are potentially exposed?
- Who is responsible for remediation?
- How widespread is the vulnerability across our software environment?
- Without a reliable connection between software dependencies and deployment information, answering these questions can require extensive manual investigation.

**Ortelius makes the connection before the next CVE is disclosed.**



{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


{{< blocks/section color= black >}}
{{< blocks/feature_dual >}}

## How Ortelius Works: From SBOM to Deployed Endpoint
Ortelius transforms SBOMs into continuously monitored software security intelligence by collecting package information, mapping software to deployments, and correlating newly disclosed vulnerabilities with software already in use.

<strong>1. Collect: Build Your Open-Source Software Inventory</strong>

Ortelius collects SBOMs generated during the software delivery process and associates them with specific software component and application versions. The platform supports industry-standard SBOM formats, including SPDX and CycloneDX. Already generating SBOMs? Ortelius can consume them. Don't have an SBOM? Ortelius can integrate with the open-source Syft tool to generate one as part of your CI/CD process.

Ortelius allows different development teams to continue using their existing tools while maintaining a common, searchable inventory of open-source packages and dependencies.

<strong>2. Map: Connect Open-Source Packages to Running Software</strong>

An SBOM identifies the packages contained in an application. It does not, by itself, tell you where the software is deployed. Ortelius connects SBOM package information with deployment metadata, including Helm and CI/CD deployment data. This establishes relationships between:

- Open-source packages and versions
- Software components and artifacts
- Applications and services
- Deployment environments
- Kubernetes clusters, namespaces, and other tracked endpoints
- Application ownership



{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

<strong>3. Monitor: Continuously Detect Newly Disclosed CVEs</strong>

Software can become vulnerable without a single line of application code changing. Ortelius continuously correlates the package inventory in collected SBOMs with vulnerability intelligence from OSV.dev. Vulnerability information is refreshed on a ten-minute cycle, enabling teams to identify newly reported CVEs affecting software that has already been released. Instead of relying only on periodic rescanning, Ortelius uses the existing SBOM inventory to identify potentially affected software versions.


<strong>4. Locate: Understand the Vulnerability Blast Radius</strong>

When Ortelius identifies a vulnerable open-source dependency, it uses the relationship between packages, artifacts, applications, and deployments to locate affected software. 
The investigation becomes:

CVE → Vulnerable Package → Software Artifact → Application → Deployment → Endpoint

Teams can determine which applications contain the vulnerable dependency, identify the affected deployments, and understand the potential blast radius. This operational context helps security and development teams prioritize investigation and remediation.

Ortelius maintains these relationships as software versions change, creating a logical digital twin of the deployed software environment. 

**The result: A searchable view of what software contains a dependency and where that software is running.**

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

{{< blocks/section color= primary >}}
{{< blocks/feature_dual >}}
## Key Benefits of Ortelius Software Supply Chain Platform

- Detect Post-Deployment Vulnerabilities
Continuously identify newly disclosed CVEs affecting software that has already been released.

- Locate Vulnerable Software
Connect vulnerable packages to the applications, artifacts, environments, and endpoints where affected versions are deployed.

- Understand Your Vulnerability Blast Radius
Identify the scope of potential exposure so teams can prioritize the applications and deployments that require attention.

- Centralize SBOM Intelligence
Collect and associate SBOMs from multiple development teams and software components to build a searchable software inventory.

- Reduce Vulnerability Investigation Time
Avoid manually searching repositories, pipelines, and environments to determine where a vulnerable dependency was deployed.

- Track Software Without Endpoint Agents
Use CI/CD, Helm, and deployment metadata to maintain software inventory and deployment relationships without requiring persistent agents on every endpoint.

- Monitor Open-Source Project Security
Integrate OpenSSF Scorecard information to provide additional insight into the security practices of open-source projects used across your software environment.

- Maintain Historical Deployment Evidence
Retain versioned software inventory and deployment information to support vulnerability investigations, remediation tracking, and compliance activities.

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

## How Ortelius Compares to Traditional Software Supply Chain Management Tools

Ortelius complements development-time security tools by focusing on the connection between software dependencies and deployed systems.

| Capability                                         | Ortelius | Traditional SCA | SAST                | Container Scanners        |
| -------------------------------------------------- | -------- | --------------- | ------------------- | ------------------------- |
| Detect known vulnerable dependencies               | Yes      | Yes             | Not primary purpose | Yes                       |
| Monitor newly disclosed CVEs after deployment      | Yes      | Tool-dependent  | No                  | Tool-dependent            |
| Connect SBOMs to deployed applications             | Yes      | Tool-dependent  | No                  | Limited or tool-dependent |
| Map vulnerable packages to tracked endpoints       | Yes      | Limited         | No                  | Container-focused         |
| Provide application-level vulnerability visibility | Yes      | Tool-dependent  | No                  | Limited                   |
| Track vulnerability blast radius                   | Yes      | Limited         | No                  | Tool-dependent            |
| Use existing CI/CD deployment metadata             | Yes      | Limited         | No                  | Tool-dependent            |
| Support agentless deployment visibility            | Yes      | Tool-dependent  | N/A                 | Tool-dependent            |
| Open-source project                                | Yes      | Some            | Some                | Some                      |

**Ortelius does not replace your existing vulnerability scanners. It makes their software inventory and vulnerability intelligence more actionable after deployment.**


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


{{< blocks/section color= primary >}}
{{< blocks/feature_dual >}}

## Built for Developers, Platform Engineers, and Security Teams

<strong>Developers</strong>
Understand which open-source dependencies introduce vulnerabilities into released applications and identify the software components that require attention.

<strong>DevOps and Platform Engineers</strong>
Connect CI/CD pipelines, SBOMs, Helm metadata, and deployment information to maintain an accurate view of software across environments.

<strong> Security and DevSecOps Teams </strong>
Identify newly disclosed vulnerabilities affecting deployed applications, understand potential exposure, and work with software owners to prioritize remediation.

<strong>Open-Source Maintainers</strong>
Track dependencies, monitor security advisories, and provide greater transparency into the security posture of projects and applications.

## Free and Open Source. Governed by the Community.

Ortelius is an open-source project from the Linux Foundation ecosystem, incubating at the Continuous Delivery Foundation. The project follows an open governance model where contributors and adopters can participate in technical discussions, propose features, report issues, and help shape the roadmap.

Ortelius is built around the principle that post-deployment software vulnerability management should be accessible to every development and security team, not only organizations with enterprise security budgets. The source code is openly available, and the community welcomes contributions from developers, security engineers, DevOps practitioners, documentation writers, and open-source advocates.

<div style="font-size:1.3em;text-align:left;margin-top:10px">

- [Explore the Ortelius GitHub Organization](https://github.com/ortelius)

</div>
{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}



## Try Ortelius Free — Help Us Make Onboarding Easier
One of our primary goals is making post-deployment vulnerability management easy to adopt. You should not need an enterprise security team, a large implementation project, or a complicated onboarding process to understand which open-source packages are running in your applications. 

Ortelius has a  free SaaS environment, allowing teams to explore its capabilities without managing the platform infrastructure. We are actively looking for DevOps engineers, platform teams, and developers willing to give Ortelius a try and provide feedback on the onboarding experience. 
We want to understand what works, what is confusing, what takes too long, and what we can improve.

[Found a bug? Open an issue]

**Give us an hour of your time to try Ortelius. Your feedback will help make open-source vulnerability management easier for everyone.**

<div style="font-size:1.3em;text-align:left;margin-top:10px">

- [Open an Issue](https://github.com/ortelius/ortelius.io)

- [Join our Discord Channel](https://discord.com/invite/ZsqfMmQ)

</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}




