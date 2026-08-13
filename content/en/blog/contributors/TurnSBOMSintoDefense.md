---
date: 2026-08-12
title: "From SBOM Collection to Continuous Vulnerability Management with Ortelius"
linkTitle: "From SBOM Collection to Continuous Vulnerability Management with Ortelius"
author: Tracy Ragan
tags:
  - SBOM
  - Syft
  - DevSecOps
  - AIOps
  - Vulnerability Management
  - Continuous Threat Exposure Management (CTEM) 
  - Software Supply Chain Security
  - Open-Source Security
  - Post-Deployment Security
  - Ortelius
  - Dependency Remediation 
categories:
  - AI Security
  - Open Source Security
  - Cyber Security
  - Security
  - Software Supply Chain Security
  - DevSecOps
---


<div class="col-center">
<img src="/images/Ortelius-for-SBOM-Defense.png" alt="Ortelius for SBOM Defense" height="360px" width="545px" />
</div>
<p></p>


Modern software organizations are producing more software, more containers, and more releases than security teams can reasonably track by hand. Applications are assembled from hundreds or thousands of open-source packages and distributed across different CI/CD pipelines, registries, Kubernetes environments, cloud platforms, and development teams. The challenge is no longer simply creating an SBOM. The challenge is collecting SBOMs consistently, keeping them associated with the correct software versions running in production, and then using that information to determine when newly discovered vulnerabilities affect software that has already been released.

## The Challenge: SBOMs Are Often Missing, Scattered, or Quickly Out of Date

Large development organizations rarely have one standardized software delivery process.

Different teams may use Jenkins, GitHub Actions, GitLab, Tekton, ArgoCD, homegrown pipelines, multiple container registries, and different deployment environments. Some teams may already generate SBOMs. Others may not generate them at all.

That creates several fundamental problems.

### SBOM Generation Is Inconsistent

Some development teams create SPDX or CycloneDX SBOMs as part of their build process. Others do not. Security teams therefore cannot assume that an SBOM exists for every application, container, or software component they need to manage. Without consistent SBOM generation, organizations develop significant gaps in their understanding of what open-source software they are actually using.

### Development Teams Use Different Toolchains

Central security teams face the reality that development teams frequently choose their own tools. Any scalable SBOM solution therefore needs to work across different CI/CD systems rather than requiring an organization to replace its existing software factory. The objective should be simple:

**Make SBOM collection part of the development workflow without making developers become SBOM experts.**

### Software Volume Makes Manual Security Processes Impossible

As container and microservice adoption grows, the number of software components that must be tracked grows dramatically. A single application may contain dozens of services, with each service containing hundreds of packages and transitive dependencies. Multiply that across hundreds or thousands of applications and releases, and security teams are quickly dealing with millions of software relationships. Traditional processes were not designed to maintain this continuously changing inventory. Ortelius was originally built to map, track, and manage these millions of software relationships across applications, components, and deployments. Today, Ortelius applies that same technology to SBOM data, turning software inventory into a foundation for continuous vulnerability detection and software defense. 


### Vulnerabilities Do Not Stop Appearing After Release

This is the biggest problem with treating SBOM generation as the end goal. An SBOM represents the composition of a particular software version at a point in time. 
But the vulnerability status of those components changes continuously. A package that had no known vulnerability when the software was built on Monday may have a critical CVE disclosed on Thursday. The application did not change.

**The threat did.**

Organizations therefore need more than an SBOM repository. They need a way to continuously evaluate their SBOM inventory against newly disclosed vulnerabilities.

---

## The Ortelius Approach: Collect the SBOM First

Ortelius is designed to make SBOM collection part of the normal CI/CD process. If an organization already generates SPDX or CycloneDX SBOMs, Ortelius can consume those SBOMs and associate them with the appropriate component and application versions, and deployment endpoints.This allows teams to continue using the SBOM tools they already have.

The Ortelius can watch existing CI/CD workflows so that SBOM information and other software supply-chain metadata are captured automatically during build and deployment processes. Instead of creating another isolated security workflow, SBOM collection becomes part of the software delivery process itself.

---

## No SBOM? Ortelius Can Use Syft to Create One

Of course, not every development team already generates SBOMs. Ortelius addresses that problem by integrating with the open-source **Syft** SBOM generation tool.

When an SBOM does not already exist, Syft can be incorporated into the CI/CD workflow to inspect the software artifact and generate the SBOM. Ortelius can then collect that SBOM and associate it with the software component being produced.

The workflow becomes:

Build software → Generate or collect SBOM → Store SBOM in Ortelius → Record deployment → Continuously monitor vulnerabilities

This provides organizations with a practical way to standardize SBOM collection without forcing every development team to independently design its own SBOM process. Teams that already generate SBOMs keep doing so. Teams that do not can use Syft.

Ortelius provides the common collection and management layer.

---

## Turn Thousands of SBOMs Into a Searchable Software Inventory

Collecting SBOMs centrally creates another important capability: software inventory. Ortelius associates SBOM information with individual component versions and the applications that consume those components, along with operational endpoints. As software moves through the delivery lifecycle, Ortelius maintains the relationships between components, applications, versions, and deployments.

That means the organization can begin answering questions that become extremely difficult in large software environments.

For example:

- Are we using Log4j?

- Which applications contain it?

- Which version are they running?

- Which teams own those applications?

Where has that software been deployed?

Instead of searching through source repositories or asking hundreds of development teams to investigate, the SBOM becomes part of a searchable organizational software inventory. Ortelius specifically uses its collected dependency information to provide search across transitive dependencies and identify which applications consume particular components.

---

## But Ortelius Does Not Stop at SBOM Collection

This is where the SBOM becomes operational security data.Once Ortelius has collected the package inventory contained in an SBOM, it can continuously compare those packages against vulnerability information.

Ortelius integrates with the OSV.dev vulnerability database to cross-reference packages contained within collected SBOMs and identify known vulnerabilities affecting those software components. This changes the role of the SBOM. Instead of being a compliance artifact generated once and stored somewhere, the SBOM becomes the foundation for **continuous vulnerability monitoring**.

### The SBOM Stays the Same. The Vulnerability Picture Does Not.

Consider a software release containing 300 open-source packages.

At deployment:

* Package A has no known vulnerabilities.
* Package B has a medium-severity vulnerability.
* Package C has no known vulnerabilities.

Two weeks later, researchers disclose a critical vulnerability affecting Package C. Nothing about the deployed application changed. But its security posture changed immediately. Because Ortelius already knows that Package C exists within the application's SBOM, it can correlate the newly disclosed vulnerability back to the affected software. That is why SBOM collection and vulnerability management should be treated as a continuous process rather than two separate security activities.

---

## Continuous Scanning Without Continuously Rebuilding the Application

Traditional vulnerability scanning frequently focuses on the point when software is built, creating a point-in-time snapshot that can generate significant noise and false positives without showing what is actually running in production. Once software is deployed, organizations often turn to agent-based scanners to recreate that inventory and continually search for new vulnerabilities. But deploying and maintaining agents across every server, container, endpoint, and environment can be expensive, resource-intensive, and operationally heavy. This leaves organizations caught between noisy pre-deployment scans and costly post-deployment infrastructure—without a simple way to continuously use the software inventory they already created during the build process.

Ortelius solves this problem using a unique approach - A [Digital Twin](https://ortelius.io/digital-twin/). Once the software inventory has been captured, Ortelius can continue evaluating that inventory as new vulnerability intelligence becomes available. Ortelius continuously synchrnoizes against OSV.dev to correlate packages contained in collected SBOMs, allowing organizations to continuously monitor for new vulnerabilities after the original artifact was created.

You do not need to regenerate or rescan the application every time a new CVE is published just to determine whether its dependencies may be affected. The SBOM provides the inventory. Ortelius keeps checking that inventory.

**SBOM once. Monitor continuously.**

---

## From “What Is Vulnerable?” to “Where Is It?”

Finding a vulnerability is only part of the security problem.The next question is usually much more operational:

**Where is the vulnerable software running?**

Ortelius captures deployment metadata in addition to SBOM information. That allows component and dependency information to be associated with applications and their deployment history. This begins connecting three pieces of information that security teams frequently have stored in different systems:

**What software do we have?**

The SBOM tells us.

- What vulnerabilities affect it?

Continuous vulnerability correlation tells us.

- Where is the affected software being used?

Deployment metadata provides the operational context.

That transforms the SBOM from a static inventory document into part of a living software supply-chain record.

---

## One SBOM Collection Process Across Different Development Teams

Like the challenge described by NVIDIA, enterprise development organizations rarely have a single software factory.

They may have multiple CI/CD systems, registries, application architectures, and deployment platforms. NVIDIA's product security organization specifically needed a solution capable of integrating across numerous pipelines and registries without forcing every development team onto the same tooling.

Ortelius follows the same principle.

Rather than replacing the software factory, the Ortelius CLI can be incorporated into existing CI/CD workflows to collect software supply-chain evidence during the build and deployment process.

That provides a common SBOM and vulnerability-management layer across otherwise independent development environments.

---

## The Result: SBOMs Become Actionable Security Intelligence

Many organizations are currently focused on answering the question:

**“Are we generating SBOMs?”**

That is an important first step. But it is not the security outcome.

A better question is:

**“What are we doing with the SBOM after we generate it?”**

With Ortelius, organizations can create a workflow in which:

1. Existing [SPDX](https://spdx.dev/) and [CycloneDX](https://cyclonedx.org/) SBOMs are automatically collected.
2. [Syft](https://github.com/anchore/syft) can generate an SBOM when one does not already exist.
3. SBOMs are associated with specific software component and application versions.
4. Components and dependencies become centrally searchable.
5. Deployment information adds operational context.
6. Packages are continuously correlated against vulnerability intelligence.
7. Newly disclosed vulnerabilities can be connected back to affected software.

The result is not simply an SBOM repository. It is a continuously updated picture of the organization's open-source software risk.

---

## The Bigger Shift: From Generating SBOMs to Operating Them

The industry has spent several years encouraging organizations to generate Software Bills of Materials. The next challenge is considerably more important:

**Operating those SBOMs throughout the life of the software.**

Software may remain deployed for months or years. During that time, dozens of new vulnerabilities can be discovered in components that were considered safe when the software was originally released. That means SBOM management cannot stop when the CI/CD pipeline finishes.

Ortelius collects the software inventory during the development process, using Syft when an SBOM needs to be generated, and then puts that inventory to work continuously.

**Collect the SBOM.
Know what's inside.
Know where it went.
Keep watching for what becomes vulnerable.**

That's how Ortelius turns SBOMs from compliance documents into continuous software supply-chain security.
