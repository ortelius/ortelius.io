---
date: 2025-05-08
title: "Enhance Jenkins with Post-Deployment CVE Exposure "
linkTitle: "Enhance Jenkins with Post-Deployment CVE Exposure"
author: Tracy Ragan 
---


<div class="col-center">
<img src="/images/jenkins-Ortelius.png" alt="Jenkins and Ortelius" height="600px" width="350px"  />
</div>
<p></p>

# Ortelius for Post-Deployment Security to Jenkins

As software supply chains grow more complex and vulnerabilities emerge faster than ever, Jenkins users face a critical challenge:  
"How do you keep your deployed applications secure after the build is complete?"

Jenkins excels at automating builds, tests, and deployments. But what happens after software reaches production? Most CI/CD tools, including Jenkins, lose visibility once applications go live. This blind spot leaves teams vulnerable to newly disclosed CVEs, exploitable weaknesses that can appear days or weeks after deployment.

That’s where **Ortelius** comes in.

## Post-Deployment Vulnerability Detection: The Missing Link

Ortelius extends Jenkins by adding continuous vulnerability monitoring for deployed applications. Unlike traditional SCA tools that scan source code or container images during the build, Ortelius focuses on what matters most: what's actually running in production and is the most vulnerable to attack. 

Ortelius versions each deployed artifact’s SBOM alongside its deployment metadata, continuously scanning against live CVE feeds like  [OSV.dev](https://osv.dev). When a new CVE is published, Ortelius immediately flags any impacted endpoints—so your team can act fast, without waiting for the next build cycle.


## Built to Easily Scale

Ortelius is built for today’s modern environments, from Kubernetes and HPC to edge and air-gapped systems.  
It’s fully agentless, meaning you don’t need to install anything across production systems—reducing operational overhead and improving security posture.


## Automated Mapping and Remediation Roadmaps

Ortelius doesn’t just detect vulnerabilities—it tells you exactly where they’re running.

By mapping vulnerabilities back to the specific deployment locations and artifact versions, Ortelius gives your DevOps and security teams an actionable roadmap for remediation. 

Future releases will go even further, enabling auto-suggested patch upgrades and generating pull requests to fix issues at the source—triggered directly from Ortelius.

##  Seamless Jenkins Integration

Ortelius integrates effortlessly with Jenkins. It captures build metadata, generates SBOMs, and syncs deployment details without disrupting your existing CI/CD process. You gain continuous security observability for your live environments, right from within your Jenkins pipeline.

## Why It Matters

- **Shift Right Without Losing Control**  
  Extend your DevSecOps practices beyond build-time checks.

- **Fix Fast or Risk Attack**  
  Detect and respond to runtime CVEs within minutes.

- **Achieve Zero-Trust Runtime Security**  
  Know exactly what’s running—and where it’s vulnerable.


## Final Thoughts

As attackers move faster and software supply chains grow more fragile, Jenkins users can’t afford to stop at build-time security.

Ortelius closes the post-deployment visibility gap, empowering your team to track, detect, and respond to new vulnerabilities even after your pipeline is done. Build fast and stay secure with Jenkins and Ortelius.

## Get Started

[CI/CD Command Line](https://docs.ortelius.io/guides/userguide/integrations/ci-cd_integrations/)

Ortelius integrates with Jenkins via the Ortelius CI/CD CLI. This CLI will give you the option of including a SBOM scan using Syft, followed by evidence gathering for your deployment step. It is simple to implement and gives you the SBOM reporting needed for security compliance, as well as the continuous vulnerability scanning. 

[Video Tutorial](https://www.youtube.com/watch?v=RHPOj0BKwUI&list=PLjQ1l9KZoIQ3ozeuCya01sbOk2JANi-ij&index=2)

In this tutorial, you will learn to add the Ortelius CLI to your existing Jenkins CI/CD pipeline to begin gathering Software Bill of Materials reports, using Syft, and gathering deployment metadata.This integration enables real-time visibility into live environments, continuously tracking how newly disclosed vulnerabilities impact your deployed software.

### About the Author:

<img src="/images/Tracy-website.png" alt="Tracy Ragan"  height="400px" width="250px"  />
<p></p>

[Tracy Ragan](https://www.linkedin.com/in/tracy-ragan-oms/)
is a recognized expert in software supply chain security and DevSecOps, specializing in managing complex, decoupled architectures. She is the CEO of DeployHub, a scalable continuous vulnerability management platform that empowers software to 'self-heal' by automatically applying remediations for newly identified vulnerabilities. Tracy serves on the Governing Board of the Open Source Security Foundation (OpenSSF) as a General Member Representative and member of the Technology Oversight Committee at the Continuous Delivery Foundation (CDF). Earlier in her career, she was a founding Board Member of the Eclipse Foundation, where she worked alongside IBM to advance the integrated development environment (IDE) ecosystem.

