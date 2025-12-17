---
title: Ortelius Open Source Project
description: Welcome to the Ortelius Open Source Project Site
---


{{< blocks/section color=dark >}}
<div class="col-12">
<div style="max-width:500px">
<h1 class="text-left">Find and Fix Open-Source Vulnerabilities Impacting Live Systems</h1>
</div>
<div id="home-github">
<p class="text-left"><button ><a href="https://github.com/ortelius/ortelius"><span>Join the GitHub Project</span></a></button></p>
</div>
</div>
{{< /blocks/section >}}

{{< blocks/section color=white >}}
<h1 class="text-center">Post-Deployment Open-Source Vulnerabilities is the New Front Line</h1>
<h3 class="text-center">Ortelius Delivers Continuous, Defensive Vulnerability Management for Live Systems</h3>

{{< blocks/feature_dual >}}

<div style="text-align:center;margin-top:100px;">
<img src="/images/Vulnerabilites.svg" alt="Ortelius Vulnerability Evidence Store" height="100%" width="100%" />
</div>

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

<div style="width:100%;margin-top:100px;max-width:700px">

Most security tools are designed for offense, catching vulnerabilities before software ships. But risk does not end at release. New vulnerabilities in open-source packages are disclosed daily, long after applications are deployed and running in production. This post-deployment gap is where most security stacks fall short, and where Ortelius delivers critical defensive coverage.

Ortelius continuously maintains a deployment digital twin that maps your software supply chain to live environments. It monitors what is actually running in production, staging, and test systems, detecting newly disclosed vulnerabilities the moment they become relevant to deployed software, when impact is real and response time matters most. Unlike static SBOM repositories or pre-release scanners, Ortelius provides operational visibility into the true runtime attack surface.

By correlating Software Bill of Materials and CVEs from OSV.dev with deployed OS packages, application components, and endpoint metadata, Ortelius delivers:

- Precise Impact Mapping – Immediately identify which live applications, containers, microservices, or systems are affected by newly disclosed CVEs

- Actionable SBOM Intelligence – See exactly where vulnerable components are running across environments, without scanning or agents

- Accelerated Remediation – Reduce MTTR by prioritizing vulnerabilities that threaten live, mission-critical systems

With Ortelius, teams are no longer blind after deployment. You gain continuous, real-time awareness of your operational attack surface, enabling a clear defensive strategy focused on fixing the vulnerabilities that actually matter.

The Ortelius Community, managed by the [Continuous Delivery Foundation](https://cd.foundation), maintains the latest version, with corporate SaaS hosting support from  DeployHub a [post-deployment vulnerability detection](https://www.deployhub.com) platform designed to expedite remediation patches for the Enterprise.


</div>


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


{{< blocks/section color="primary" >}}

{{< blocks/feature_dual  >}}

<h1 class="text-left">Exposing Threats Where They Matter Most</h1>
<hr>
Modern software is no longer a single application, it is a distributed system composed of hundreds of microservices, containers, open-source libraries, and increasingly, AI agents. Each deployed component expands the attack surface and introduces risk that traditional, pre-release security tools cannot see. Ortelius delivers post-deployment visibility mapping CVEs to where they are running, and what is at risk when a new vulnerability is disclosed. With Ortelius, teams can:

- Visualize the live software attack surface across production, including edge devices

- Continuously track deployed packages and dependencies without scanning or agents installed on end-points

- Detect critical and high-risk CVEs after release, when exposure is real

This shifts security from theoretical risk assessment to real-world defense, focusing remediation efforts on the vulnerabilities that threaten live systems.  

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

<h1 class="text-center">Why Post-Deployment Visibility Matters</h1>
<hr>

Pre-release scans aren’t enough. New vulnerabilities are disclosed **after** deployment—often days or weeks later. Ortelius fills this critical gap by continuously tracking what’s live, what’s vulnerable, and what needs fixing.

- Real-time CVE exposure  
- Live attack surface mapping  
- Risk prioritization per environment  
- Immediate action for remediation  

{{< /blocks/feature_dual >}}

{{< /blocks/section >}}

{{< blocks/section color="white" >}}

{{< blocks/feature_dual >}}

<h1 class="text-center">The Ortelius Edge</h1>
<hr>

**Deployed Software Intelligence**  
Know exactly what version of each component is deployed and where.

 **Real-Time CVE Mapping**  
Connect new CVEs to deployed components across systems.

**Attack Surface Awareness**  
View your threat exposure across all environments in real time.

 **Build-to-Deploy Traceability**  
Map software from code to CI/CD to deployment with full SBOM lineage.

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual  >}}
<h1 class="text-center">Built for DevSecOps and cATO</h1>
<hr>

Ortelius supports your DevSecOps pipeline and security compliance:

- Zero Trust enforcement  
- NIST 800-53 and 800-171 support  
- Continuous Authority to Operate (cATO) readiness  
- SBOM and RMF reporting  
- DoD and civilian security mandates  

{{< /blocks/feature_dual >}}

{{< /blocks/section >}}





{{< blocks/section color=black >}}

<div class="col-12">
<h2 class="text-center">Ortelius Use Cases  </h2>
<p></p>
</div>

{{% blocks/feature icon="fas fa-3x fa-box-open" title="Identify and Neutralize Threats" url="/microservicemapping/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-share-square" title="Strengthen Your OS Supply Chain" url="/catalog/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-sitemap" title="Maintain Persistent Surveillance of Changes" url="/versioning/" %}}
{{% /blocks/feature %}}


{{< /blocks/section >}}


{{< blocks/section color=white >}}

{{< blocks/feature_dual_left_sm >}}

<div style="margin-top:10px;">
<img src="/images/JenkinsandOrtelius.png" alt="Jenkins and Ortelius" height="80%" width="80%" style="margin-left:110px"/>
</div>

{{< /blocks/feature_dual_left_sm >}} 

{{< blocks/feature_dual >}}

<div style="margin-top:10px;margin-left:50px">

## Extend Jenkins for Continuous Post Deployment Security

Ortelius extends Jenkins by adding continuous vulnerability monitoring for deployed applications. Unlike traditional SCA tools that scan source code or container images during the build, Ortelius focuses on what matters most: what’s actually running in production and is the most vulnerable to attack.
<div style="font-size:1.8em;">

[Learn More](https://ortelius.io/blog/2025/05/08/enhance-jenkins-with-post-deployment-cve-exposure/) 
</div>
</div>


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


{{< blocks/section color=black >}}
<div class="col-12">
<h1 class="text-center">Ortelius Ecosystem</h1>
</div>


<div class="col-sm"></div>

<div class="col-sm" style="text-wrap:nowrap">

{{% blocks/table_center %}}

|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
| |<p style="font-size:1.5em">[Syft](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/)  | <p style="font-size:1.5em">[OpenSSF Scorecard](https://docs.ortelius.io/guides/userguide/integrations/openssf-scorecard/)  </p>  |  <p style="font-size:1.5em">[SonarQube](https://docs.ortelius.io/guides/userguide/integrations/sonarqube/)</p>  |  <p style="font-size:1.5em">[VeraCode](https://docs.ortelius.io/guides/userguide/integrations/veracode/)</p>   | <p style="font-size:1.5em">[Jenkins and Other CI/CD](https://docs.ortelius.io/guides/userguide/integrations/ci-cd_integrations/)</p>  | <p style="font-size:1.5em">[OSV.dev](https://docs.ortelius.io/guides/userguide/integrations/osvdev/)</p>  |  <p style="font-size:1.5em">[Helm](https://docs.ortelius.io/guides/userguide/integrations/helmmetrics/)</p> |  


{{% /blocks/table_center %}}

<div style="margin-top:40px;margin-left:5px">

<div style="font-size:1.8em;text-align:center;margin-top:10px">

[View All](https://docs.ortelius.io/guides/userguide/integrations/) 
</div>
</div>

</div>
<div class="col-sm"></div>
{{< /blocks/section >}}


{{< blocks/section color=white >}}

{{< blocks/feature_dual_left_sm >}} 

<div style="margin-top:10px">
<img src="/images/Otelius-transparent1-300x290.png" alt="Ortelius" height="80%" width="80%" style="margin-left:110px"/>
</div>

{{< /blocks/feature_dual_left_sm >}} 

{{< blocks/feature_dual >}}

<div style="margin-top:10px;margin-left:100px">

## Sign-up and Get Started Managing Post Deployment CVEs

From discovering where open-source packages are being used, to federating OpenSSF Scorecard and [Application Security Posture Management](https://www.deployhub.com/application-security-posture-management/) data, Ortelius serves as a central hub for managing, evaluating, and responding to vulnerabilities, and understanding the risk associated to consuming open-source packages from code to cloud. 

Get started with Ortelius using the free SaaS version. Take a quick tutorial and see it in action. 

<div style="font-size:1.8em;">

[Start Today](https://docs.ortelius.io/guides/userguide/orteliustutorial/) 
</div>

</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}



{{< blocks/section color=black >}}
<div class="col-12">


<h2 class="text-center">Get Involved</h2>
<p></p>
</div>
{{% blocks/feature icon="fab fa-3x fa-github-square" title="Contribute" url="/contributor/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-ticket-alt" title="Open an Issue" url="https://github.com/ortelius/ortelius/issues" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-users" title="Attend Out Community Meetings and Events" url="/events/" %}}
{{% /blocks/feature %}}

{{< /blocks/section >}}


{{< blocks/section color=black >}}
<h1 class="text-center">Our Inspiration </h1>
<hr>

{{< blocks/feature_dual >}}



## Abraham Ortelius

<div class="wrapdiv">
<img class="wrapdiv_image" src="images/abrahamortelius.jpg" alt="Abraham Ortelius" style="width:121px; height:170px" />
<p class="wrapdiv_text">Abraham Ortelius made his name by collecting data from scientists, geographers, and cartographers of his time and transforming it into what the world now knows as a world Atlas. His Atlas, titled Theatrum Orbis Terrarum (Theatre of the World), was published on May 20, 1570. His Atlas disrupted the way the world was seen, with the first concepts imagining continental drift. Also of interest are the sea monsters shown in the water – mythical creatures that were a subject of fascination in Ortelius’ generation.</p>
</div>
{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}


## A Thought Leader in Sharing
Ortelius also in some ways created on open source community of his day. To accomplish his goal, he was the first cartographers to give credit to his fellow scientists by adding their names to the Atlas. Ortelius was known to have corresponded with other professionals throughout Europe and pulled together their knowledge to create his publication and a truly global view of the world.

Thank you Abraham Ortelius for showing us the way.
{{< /blocks/feature_dual >}}
{{< /blocks/section >}}





