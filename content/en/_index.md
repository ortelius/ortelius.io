---
title: Ortelius Open Source Project
description: Welcome to the Ortelius Open Source Project Site
---


{{< blocks/section color=dark >}}
<div class="col-12">
<div style="max-width:500px">
<h1 class="text-left">Know What's Vulnerable. Know Exactly Where It's Running.</h1>
</div>
<div id="home-github">
<p class="text-left"><button ><a href="https://github.com/ortelius/ortelius"><span>Join the GitHub Project</span></a></button></p>
</div>
</div>
{{< /blocks/section >}}

{{< blocks/section color=black >}}
<h1 class="text-center">SBOM tells you what OS packages you have. Ortelius tells you where they are running. .</h1>

Ortelius connects the software inventory in your SBOMs with Helm and deployment metadata to map open-source packages and versions to the endpoints and where they are running. Ortelius then continuously monitors that inventory for newly disclosed vulnerabilities. Already have an SBOM? We consume it. Don't have one? We will generate it. Ortelius maps software inventory to newly disclosed vulnerabilities within 10 minutes of reporting —so when the next critical CVE appears, you can quickly determine whether you have it, which application contains it, and exactly where it is deployed.

[Get Started Today](https://app.deployhub.com/) 



{{< blocks/feature_dual  >}}

<div style="width:100%;margin-top:100px;max-width:1000px">

<h2>Finding a CVE Is Easy. Finding Where It's Running Is Hard.</h2>
<p></p>

Modern software relies on hundreds or thousands of open-source packages, containers, and microservices. Pre-deployment scans provide only a point-in-time view and often generate significant noise without showing what actually reached production. Post-deployment agent-based scanning can fill that gap, but deploying and maintaining agents across every environment is expensive, resource-intensive, and operationally heavy.


<p></p>
<h4>Don't Rediscover Your Software. Remember What You Deployed.</h4>
<p></p>

Your CI/CD pipeline already knows what was built and where it was deployed. Ortelius connects SBOM package and version data with Helm and deployment metadata to map software to artifacts, environments, and endpoints—so when a new CVE appears, you already know where the affected software is running.


<h4>When a New CVE Drops, Ortelius Answers These Questions</h4>
<p></p>

**Do we use it?** - Ortelius searches the SBOM inventory for the affected package and version.

**Which artifact is impacted?** - Ortelius maps packages and dependencies to artifact versions.

**Where is that exact version running?** - Ortelius uses Helm and deployment metadata to connect the OS package version to its deployed endpoints.

**What actually needs to be fixed?** - - Teams get the package, version, application, deployment, and ownership context needed to act.





</div>

{{< /blocks/feature_dual  >}}

{{< blocks/feature_dual  >}}

<div style="width:100%;margin-top:100px;max-width:1000px">



<h2>From OS Package to Production Endpoint.</h2>
<p></p>
The harder question comes after a CVE is discovered.

**Where is the affected software actually running?**

Once your SBOM and deployment metadata is collected, Ortelius continuously correlates its packages against vulnerability intelligence. When a new CVE is disclosed tomorrow, next month, or next year, Ortelius can identify the software that contains the affected dependency and where it is installed across your production endpoints.
<div class="col-center">
<img src="/images/Frontpage-flow.png" alt="Ortelius SBOM Collection" height="545px" width="360px" />
</div>
<p></p>


{{< /blocks/feature_dual  >}}

</div>

<div style="text-align:center;margin-top:100px;">
<img src="/images/Ortelius-Dashboard1.svg" alt="Ortelius Post-Deployment Vulnerability Detection" height="100%" width="100%" />
</div>

{{< /blocks/section >}}


{{< blocks/section color="black" >}}

{{< blocks/feature_dual  >}}

<h1 class="text-center">Collect</h1>
<hr>

Bring the SBOMs your development teams already produce. Ortelius consumes standard SBOM formats including SPDX and CycloneDX. If an SBOM doesn't exist, Ortelius will use the open-source Syft tool to generate one.

Different teams can continue using different development and security tools while Ortelius provides a common software inventory.

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}

<h1 class="text-center">Map</h1>
<hr>

This is where Ortelius goes beyond basic SBOM management. An SBOM tells you what is inside the software. Deployment evidence tells you where that software went.

Ortelius combines SBOM data with Helm charts and deployment metadata to maintain the relationships between packages, component versions, applications, deployments, environments, and endpoints.

 

{{< /blocks/feature_dual >}}

{{< /blocks/section >}}



{{< blocks/section color=black >}}

{{< blocks/feature_dual >}}

<h1 class="text-center">Monitor</h1>
<hr>

Software doesn't stop becoming vulnerable after it ships. A package may have no known vulnerabilities when an application is released and have a critical CVE disclosed days, months, or even years later. The application didn't change. The threat did.

Ortelius continuously evaluates the packages in its software inventory against newly disclosed vulnerability information. Your SBOM becomes more than a compliance artifact. It becomes the foundation for continuous post-deployment vulnerability monitoring.

{{< /blocks/feature_dual >}}

{{< blocks/feature_dual  >}}
<h1 class="text-center">Quickly Pinpoint</h1>
<hr>

When a new vulnerability appears, knowing the package name is only the beginning.

Ortelius uses its software relationships to trace the affected package through the application and deployment chain.

Instead of:

CVE → Start Investigation

Ortelius gives you:

CVE → Affected Package + Version → Artifact → Deployment → Endpoint

That means security and development teams can quickly understand the real exposure and prioritize the systems that actually require attention. 

{{< /blocks/feature_dual >}}

{{< /blocks/section >}}





{{< blocks/section color=black >}}

<div class="col-12">
<h2 class="text-center">Ortelius Use Cases  </h2>
<p></p>
</div>

{{% blocks/feature icon="fa-solid fa-triangle-exclamation" title="Defend Live Systems - Post-Deployment" url="/post-deployment-vulnerability-threat/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fa-solid fa-check-double" title="Gain Live System Visability using a Digital Twin" url="/digital-twin/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fa-solid fa-shield" title="Track Compliance and OpenSSF Scores" url="/security-compliance/" %}}
{{% /blocks/feature %}}

{{< /blocks/section >}}

{{< blocks/section color=black >}}

<div class="col-12">
<h2 class="text-center">Why Ortelius, and Why Now? </h2>
<hr>
<p class="text-center">Post-deployment open-Source vulnerabilitie are the new security gap and attack surface. Learn how Ortelius fixes the gap and helps team detect and remediate fast. </p>
</div>

<div class="col-12">
<iframe src="https://www.youtube.com/embed/n_aNHMYKXKw" title="Ortelis Explained" frameborder="0"      
      allowfullscreen 
      style="position: relative; top: 0; left: 0; width: 100%; height: 600px; padding-left: 20%; padding-right: 20%"
    ></iframe>
</div>

{{< /blocks/section >}}


{{< blocks/section color=black >}}

{{< blocks/feature_dual_left_sm >}}

<div style="margin-top:2px;">
<img src="/images/Pathfinder-bronze.png" alt="Pathfinder" height="50%" width="50%" style="margin-left:300px"/>
</div>

{{< /blocks/feature_dual_left_sm >}} 



{{< blocks/feature_dual >}}

<div style="margin-top:10px;margin-left:50px">

<h1 class="text-center">On-board an Open Source Project and Earn a Pathfinder Badge </h1>
<hr>


Help strengthen open-source software security by becoming an Ortelius Pathfinder. Onboard your favorite open-source or private project into Ortelius, connect its software supply chain and deployment data, and help demonstrate a better way to find and fix vulnerabilities in software already running in production. Earn Bronze, Silver, and Gold Pathfinder badges as you expand the Ortelius ecosystem and help show others the path toward stronger software supply chain security.

<div style="font-size:1.8em;">

[Learn More](https://ortelius.io/blog/2026/08/12/become-an-ortelius-pathfinder-put-your-favorite-open-source-project-on-the-map/) 
</div>
</div>


{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

<!-- 
{{< blocks/section color=black >}}

{{< blocks/feature_dual  >}}



<div style="margin-top:10px;margin-left:200px">


<h1 class="text-center">Explore the Ortelius Ecosystem</h1>

<div style="text-wrap:nowrap">

{{% blocks/table_center %}}

|   |   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|---|
| |<p style="font-size:1.5em">[Syft](https://docs.ortelius.io/guides/userguide/integrations/spdx-syft-cyclonedx/)  | <p style="font-size:1.5em">[OpenSSF Scorecard](https://docs.ortelius.io/guides/userguide/integrations/openssf-scorecard/)  </p>  |  <p style="font-size:1.5em">[SonarQube](https://docs.ortelius.io/guides/userguide/integrations/sonarqube/)</p>  |  <p style="font-size:1.5em">[VeraCode](https://docs.ortelius.io/guides/userguide/integrations/veracode/)</p>   | <p style="font-size:1.5em">[CI/CD](https://docs.ortelius.io/guides/userguide/integrations/ci-cd_integrations/)</p>  | <p style="font-size:1.5em">[OSV.dev](https://docs.ortelius.io/guides/userguide/integrations/osvdev/)</p>  |  <p style="font-size:1.5em">[Helm](https://docs.ortelius.io/guides/userguide/integrations/helmmetrics/)</p> |  


{{% /blocks/table_center %}}

</div>


<div style="font-size:1.8em;text-align:center;margin-top:10px">

[View All](https://docs.ortelius.io/guides/userguide/integrations/) 
</div>
</div>



{{< /blocks/feature_dual  >}}

{{< blocks/feature_dual_left_sm >}}

<div style="margin-top:2px;margin-right:50px">
<img src="/images/explore-ecosystem.jpg" alt="Ortelius Ecosystem" height="40%" width="40%" style="margin-left:300px"/>
</div>


{{< /blocks/feature_dual_left_sm >}}

{{< /blocks/section >}}

-->

{{< blocks/section color=black >}}

{{< blocks/feature_dual_left_sm >}} 

<div style="margin-top:2px">
<div style="margin-top:2px;margin-left:50px">
<img src="/images/Otelius-transparent1-300x290.png" alt="Ortelius" height="50%" width="50%" style="margin-left:150px"/>
</div>
</div>


{{< /blocks/feature_dual_left_sm >}} 


{{< blocks/feature_dual >}} 

<div style="margin-top:10px;margin-left:150px">
<h1 class="text-center">Sign-up and Get Started Managing Post Deployment CVEs</h1>
<hr>


From discovering where open-source packages are being used, to federating OpenSSF Scorecard and [Post-Deployment Vulnerability
Detection Platform](https://www.deployhub.com/) data, Ortelius serves as a central hub for managing, evaluating, and responding to vulnerabilities, and understanding the risk associated to consuming open-source packages from code to cloud. 

Get started with Ortelius using the free SaaS version. Take a quick tutorial and see it in action. 

<div style="font-size:1.8em;">

[Start Today](https://docs.ortelius.io/guides/userguide/orteliustutorial/) 
</div>

</div>

{{< /blocks/feature_dual >}} 


{{< /blocks/section >}}



{{< blocks/section color=black >}}
<div class="col-12">

<div style="margin-top:10px">
<h2 class="text-center">Pull Request Encouraged - Become a Committer</h2>
</div>
<hr>

</div>
{{% blocks/feature icon="fa-brands fa-github" title="Contribute" url="/contributor/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fa-solid fa-bug" title="Open an Issue" url="https://github.com/ortelius/ortelius/issues" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fa-regular fa-handshake" title="Attend Out Community Meetings and Events" url="/events/" %}}
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





