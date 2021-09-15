---
title: Ortelius Open Source Project
description: Welcome to the Ortelius Open Source Project Site
---

{{< blocks/section color=dark >}}
<div class="col-12">
<h1 class="text-center">An Open Source Microservice Management Platform</h1>
<div id="home-github">
<p><button><a href="https://github.com/ortelius/ortelius"><span>Join the GitHub Project</span></a></button></p>
</div>
</div>
{{< /blocks/section >}}

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">What is Ortelius?</h1>
<hr>
</div>

Ortelius is a microservice management platform that versions and tracks microservices, their consuming applications, ownership, blast radius and where they have been deployed with all critical deployment metadata.  By centralizing and tracking detailed configuration data, Ortelius provides you a proactive view of how your microservice architecture is changing overtime. The latest version of Ortelius is maintained by the Ortelius Community managed by the [Continuous Delivery Foundation](http://cd.foundation/) (Linux Foundation).  It was originally created by [DeployHub](https://www.deployhub.com/) and [OpenMake Software](https://www.openmakesoftware.com). Our mission is to simplify the adoption of modern architecture through a world-class microservice management platform driven by a supportive and diverse global open source community.
<p></p>
{{< /blocks/section >}}

{{< blocks/section color=white >}}
<div class="col-12">
<h1 class="text-center">What Ortelius Does</h1>
<hr>
<p></p>
</div>
{{% blocks/feature icon="fas fa-3x fa-sitemap" title="Microservice Mapping" url="/microservicemapping/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-share-square" title="Microservice Catalog and Publishing" url="/catalog/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-box-open" title="Microservice Versioning" url="/versioning/" %}}
{{% /blocks/feature %}}
{{< /blocks/section >}}

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Get Involved</h1>
<hr>
<p></p>
</div>
{{% blocks/feature icon="fab fa-3x fa-github-square" title="Contribute" url="/contributor/" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-ticket-alt" title="Open an Issue" url="https://github.com/ortelius/ortelius/issues" %}}
{{% /blocks/feature %}}
{{% blocks/feature icon="fas fa-3x fa-users" title="Attend Out Community Meetings and Events" url="/events/" %}}
{{% /blocks/feature %}}
{{< /blocks/section >}}
{{< blocks/section color=white >}}

<div class="col-12">
<h1 class="text-center">Signup for the Ortelius Development Environment</h1>
<hr>
<p></p>
</div>

{{< blocks/feature_dual >}}
Ortelius has a development instance running on Azure Kubernetes.  We use this instance for testing out the latest version and pull requests.  Please signup to help us test the changes being made by our contributors.  

A private domain with sample test data will be created when you complete the signup.  This allows you to test independently, so don't worry about breaking anything.

Please submit any issues you find in the [ortelius/ortelius](https://github.com/ortelius/ortelius/issues) repo.

<p align="center">
<svg height="280px" width="280px" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pen-field" class="svg-inline--fa fa-pen-field fa-w-20" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><path fill="currentColor" d="M192 320c0 17.67 14.33 32 32 32s32-14.33 32-32S241.7 288 224 288S192 302.3 192 320zM96 320c0 17.67 14.33 32 32 32s32-14.33 32-32S145.7 288 128 288S96 302.3 96 320zM639.1 69.79c0-11.26-4.295-22.52-12.89-31.11L601.3 12.89c-8.592-8.592-19.85-12.89-31.11-12.89S547.7 4.295 539.1 12.89L311.7 240.3c-3.072 3.072-5.164 6.984-6.016 11.24l-17.46 87.32c-.1486 .7434-.2188 1.471-.2188 2.191c0 6.012 4.924 10.94 10.94 10.94c.7197 0 1.449-.0707 2.192-.2194l87.33-17.46c4.258-.8516 8.168-2.945 11.24-6.016l227.4-227.4C635.7 92.31 639.1 81.05 639.1 69.79zM511.1 326.6C511.1 326.6 511.1 326.6 511.1 326.6L511.1 448H63.1V192h228.1l63.1-64H63.1C28.66 128 0 156.7 0 192v256c0 35.35 28.66 64 63.1 64h447.1c35.34 0 63.1-28.65 63.1-63.1L576 219.9l-64 63.99L511.1 326.6z"></path></svg>
</p>

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}
<div align="center">

<iframe width="600px" height="550px" src="http://localhost:8181/dmadminweb/signup.html" frameBorder="0" scrolling="no"></iframe>
</div>
{{< /blocks/feature_dual >}}
{{< /blocks/section >}}
{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Ortelius Features</h1>
<hr>
<p></p>
</div>
{{< blocks/feature_dual >}}
{{% blocks/table_center %}}
 | 
--- | ----------- 
Microservice ownership. | <i class="fas fa-3x fa-check-square"></i>
Logical application versions. | <i class="fas fa-3x fa-check-square"></i>
Microservice blast radius. | <i class="fas fa-3x fa-check-square"></i>
Difference reports over time, microservice and logical application. | <i class="fas fa-3x fa-check-square"></i>
Microservice inventory usage across all clusters. | <i class="fas fa-3x fa-check-square"></i>
Microservice key value pairs management. | <i class="fas fa-3x fa-check-square"></i>
{{% /blocks/table_center %}}
{{< /blocks/feature_dual >}}

{{< blocks/feature_dual >}}
{{% blocks/table_center %}}

 | 
--- | ----------- 
Helm and Ansible Support. | <i class="fas fa-3x fa-check-square"></i>
Reusable actions and templated deployment logic. | <i class="fas fa-3x fa-check-square"></i>
Supports hybrid environments. | <i class="fas fa-3x fa-check-square"></i>
Blue/Green and Canary deployment models. | <i class="fas fa-3x fa-check-square"></i>
Rollback and roll forward recovery. | <i class="fas fa-3x fa-check-square"></i>
Integrates with CI/CD.  | <i class="fas fa-3x fa-check-square"></i>

{{% /blocks/table_center %}}
{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

{{< blocks/section color=white >}}
{{< blocks/feature_dual >}}
## Abraham Ortelius – Our Inspiration

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