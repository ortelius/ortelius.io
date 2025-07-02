---
title: Ortelius Open Source Project
description: Welcome to the Ortelius Open Source Project Site
---


{{< blocks/section color=dark >}}
<div class="col-12">
<div style="max-width:500px">
<h1 class="text-left">Track Post-Deployment Vulnerabilities Across Your Live Environments</h1>
</div>
<div id="home-github">
<p class="text-left"><button ><a href="https://github.com/ortelius/ortelius"><span>Join the GitHub Project</span></a></button></p>
</div>
</div>
{{< /blocks/section >}}

{{< blocks/section color=white >}}
<h1 class="text-center">Expose Your Real-Time Attack Surface</h1>
<h3 class="text-center">Patch OSS Vulnerabilities Before Hackers Attack</h3>

{{< blocks/feature_dual >}}

<div style="text-align:center;margin-top:100px;">
<img src="/images/Vulnerabilites.svg" alt="Ortelius Vulnerability Evidence Store" height="100%" width="100%" />
</div>

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

<div style="width:100%;margin-top:100px;max-width:700px">

Traditional security tools focus on catching vulnerabilities before software is deployed, **but threats don’t stop there**. New vulnerabilities in open-source packages are disclosed daily, long after software has been released into production. That’s where Ortelius steps in.

Ortelius continuously maps your software supply chain and actively monitors live environments to detect vulnerabilities that emerge post-deployment, when the risk is highest and time is critical. Unlike static SBOM solutions or pre-release scanners, Ortelius gives you a dynamic view of what’s actually running in production, staging, and test environments.

It connects the dots between CVEs reported by OSV.dev, deployed OS packages, and affected systems, providing:

- Precise Impact Mapping – Instantly identify which applications, containers, or microservices are exposed to new CVEs

- Actionable Intelligence – Understand exactly where vulnerable components are running across all environments

- Faster Remediation Cycles – Reduce MTTR by focusing efforts on live, high-risk threats 

With Ortelius, you're no longer blind to what happens after deployment. You gain real-time, operational awareness of your software attack surface, so your teams can act fast and stay ahead of emerging threats.

The Ortelius Community, managed by the [Continuous Delivery Foundation](https://cd.foundation), maintains the latest version, with corporate support from  DeployHub a [Continuous Vulnerability Management](https://www.deployhub.com) platform designed to expedite remediation patches for the Enterprise. 


</div>


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


{{< blocks/section color="primary" >}}

{{< blocks/feature_dual  >}}

<h1 class="text-left">Expose Your Real Time Attack Surface</h1>
<hr>
Modern software is assembled from hundreds of components (i.e microservices, containers, libraries, AI Agents) each with potential security risks. Ortelius reveals where each component is running and what’s at risk when a new vulnerability hits.

-  Visualize your live software footprint  
-  Track every package across all environments  
-  Detect high-risk CVEs after release  
-  Know instantly which assets are vulnerable  

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


{{< blocks/section color="white" >}}

<h1 class="text-center">SecureChainCon, Now Available On-Demand</h1>

<hr>

{{< blocks/feature_dual >}}

<div style="text-align:center;margin-top:100px;">
<img src="/images/2025securechainconkeynotes.png" alt="SecureChainCon" height="100%" width="100%" />
</div>

<div style="font-size:1.5em;text-align:center;margin-top:10px">

[View Now](https://www.youtube.com/playlist?list=PLjQ1l9KZoIQ1EO0f55v9Us6FsqtJuTKSS)

[More Info](https://ortelius.io/blog/2025/04/03/securechaincon-2025/) 

</div>

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}


<div style="text-align:center;width:100%;margin-top:10px">
<h2 class="text-center">Level Up Your Security Skills </h2>
</div>

<div style="margin-top:10px;margin-left:1px">

Welcome to SecureChainCon, the premier online micro-conference for DevOps and Security professionals, proudly hosted by the Ortelius open-source community!
View our half-day of engaging sessions and invaluable learning designed to keep you ahead in the fast-paced world of software security, AI, and DevOps automation. Our lineup of expert speakers from top organizations will share their insights, best practices, and real-world case studies on seamlessly integrating security into DevOps workflows.

KeyNote: 

- [John Willis, Botchagalupe](https://www.linkedin.com/in/johnwillisatlanta/) "AI-Powered Code Parsing and Semantic Analysis for DevOps Pipelines"

As software development ecosystems grow increasingly complex, the need for intelligent DevOps automation in script analysis and dependency management becomes critical. Join Jon Willis as he explores cutting-edge tools and techniques that leverage AI-driven code parsing and semantic analysis to enhance DevOps workflows. He will discuss the application of Large Language Models (LLMs) such as GPT-4, CodeBERT, and OpenAI Codex in parsing infrastructure and automation scripts, including Jenkinsfile, Dockerfile, Makefile, GitHub Actions, and Terraform. These models facilitate the identification of dependency installations (e.g., apt-get install, pip install, npm install) and pinpoint update points within scripts.



{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

{{< blocks/section color="white" >}}

<h1 class="text-center">Job Seeker's Toolkit</h1>
<hr>
{{< blocks/feature_dual >}}


<div style="text-align:center;margin-top:100px;">
<img src="/images/jobseekers-toolkit.png" alt="JobSeekers Webinar" height="100%" width="100%" />
</div>

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="text-align:center;width:100%;margin-top:10px">
<h2 class="text-center">Webinars and Resources </h2>
</div>

<div style="margin-top:10px;margin-left:1px">

As you work through the process of finding a new role, there are an increasing number of resources available to you. The Ortelius team has curated these resources into useful categories. Most are free or offer initial free access, with some offering paid services.

Get [Resources and Links](https://ortelius.io/blog/2025/05/10/job-seekers-tookit/) on Job Hunting.

</div>

<div style="text-align:left;width:100%;margin-top:10px">
<strong>Job Seekers Webinar Episodes:</strong>

[Episode 1 - View Now](https://youtu.be/vx2pp8p2SJ4)   Building Your LinkedIn Personal Brand to Get Noticed, Presented by [Darrin Straff, CareerStation](https://www.linkedin.com/in/darrinstraff/)

[Episode 2 - View Now](https://www.youtube.com/watch?v=o6nr2jzn3p4)   Secrets Unveiled: How Employers Find (and Hire) Top Talent, Presented by [Erin Lovern](https://www.linkedin.com/in/erinlovern/) and [Buffie Gresh](https://www.linkedin.com/in/buffig/)
</div>


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

{{< blocks/section color= "white" >}}


<div style="text-align:center;width:100%;margin-top:10px">
<h1 class="text-center">Attend CDCon June 23-25,2025 </h2>
<hr>
</div>

{{< blocks/feature_dual >}}



<div style="text-align:center;margin-top:100px;">
<img src="/images/cdcon2025.png" alt="open source summit" height="100%" width="100%" />
</div>

<div style="font-size:1.8em;text-align:center;margin-top:10px">

[Register Today](https://events.linuxfoundation.org/open-source-summit-north-america/register/)
</div>

{{< /blocks/feature_dual >}}


{{< blocks/feature_dual >}}




<div style="text-align:center;width:100%;margin-top:10px">
<h2 class="text-center">Join Open Source Developers in Denver</h2>
</div>


Attend CDCon, held at Open Source Summit 2025 in the mile high city of Denver Colorado. 

Why You Should Attend:

Open Source Summit is the premier event for open source developers, technologists, and community leaders to collaborate, share information, solve problems, and gain knowledge, furthering open source innovation and ensuring a sustainable open source ecosystem. It is the gathering place for open-source code and community contributors.

Open Source Summit is a conference umbrella, composed of a collection of events covering the most important technologies, topics, and issues affecting open source today including CDCon where DevOps is explored and improved. 



{{< /blocks/feature_dual >}}

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





