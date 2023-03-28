---
date: 2023-03-28
title: "The SBOM Big Picture"
summary: The SBOM Big Picture
author: Tony Carrato / Ortelius Board Advisor
---

{{< figure src="/images/ingredients.jpg" width="600px" height="400px" >}}

## What are SBOMs and Why are They Important?

Simply put, an SBOM is a [Software Bill of Materials](https://www.deployhub.com/understanding-software-bill-of-materials-sboms/), i.e. a list of what components were used in constructing a particular application or microservice. Those components may be open source libraries and/or proprietary software modules. Essentially all software is built by a combination of writing code and including code already written. The list of nested libraries included is the essence of the SBOM.

That’s important for a few reasons, in particular, to understand security risks due to bad actors attacking an application by inserting malicious code into a library, to quickly respond to a known vulnerability, and to understand the application’s potential technical debt, where technical debt is the cost for updating an application to bring it up to current in all of its components.

## What does an SBOM look like?

At its simplest, an SBOM is just a list of the software components used in any given application stored in a text format. It lives along side the artifact it represents, in a build directory.  

{{< figure src="/images/sbomreport.png" width="500px" height="800px" >}}

However, a simple list living in a text file isn’t really enough to do much with. What’s needed is access to the information it contains for example, the provider information, version, and license/license type. [MITRE Corporation](https://www.mitre.org/sites/default/files/2021-10/pr-19-01876-16-standardizing-sbom-within-the-sw-development-tooling-ecosystem.pdf) also has a useful description of SBOMs and how they fit into the life cycle development process.

## The Need for Cataloging SBOM Data
It is important to note that just having a list of ingredients doesn’t make it easy to ask questions like “where in my suite of applications is library XXX used?” That needs a central catalog and the ability to do reporting on your organizations overall SBOM inventory. Such repositories are becoming more available, and is the focus of the Ortelius open-source project as well as commercial solutions such as DeployHub's [microserivce catalog](https://www.deployhub.com). These catalogs standardize on the SPDX and CycloneDX formats and digest the information to make it easier to provide organizational level SBOM information and provide a consolidated list of their SBOM data at multiple levels, component, application and environment.   

Populating an SBOM catalog for new applications, which are likely to be built as microservices applications, is the provenance of the organization’s DevSecOps pipeline tools. But, of course, most enterprises have hundreds, if not thousands of existing monolithic applications. It’s important to have a strategy and supporting tooling to capture the SBOMs from both decoupled and monolithic development practices. Look for tooling which makes collecting the data easy to automate from your DevOps pipeline. Ortelius has a [Command Line Interface](https://docs.ortelius.io/guides/userguide/integrations/ci-cd_integrations/) that makes the job of automating the SBOM collection easy. 

## Conclusion
So why does it matter to track SBOMs? As mentioned above, having accurate and up to date SBOMs enables an organization to answer questions like “where is this module used, across my enterprise?” Answering this question quickly matters when a given software component has known vulnerabilities. And going beyond that, providing SBOMs as part of the software purchase has been mandated by the US Federal Government in [Executive Order 14028 (Improving the Nation’s Cybersecurity)](https://www.gsa.gov/technology/technology-products-services/it-security/executive-order-14028-improving-the-nations-cybersecurity). For organizations delivering software to the US Government, an SBOM is required as part of the delivery contract. This means that now is the time for software suppliers to be ready to deliver an SBOM with every update of their product, and for software consumers to start building an organizational SBOM catalog to ready critical reporting tools.


## About Tony Carrato

![Mentoring](/images/tonycarrato.png)

Tony is a board advisor and mentor to the Ortelius Governing Board, where his input and direction has become critical to the team.

Tony is a lead solution/security architect, experienced in multiple industries, including energy, telecommunications and financial services in the US, Australia and Europe. He is an effective communicator, involved in initial discussions to define the problems at hand, through scoping and shaping the solution and supporting delivery into production with a Design Thinking-based approach, using an agile methodology. He delivers solution and enterprise architectures, along with security architectures for clients across a broad range of architectural disciplines, with specific industry expertise in telecommunications, energy/utilities, financial services (banking/insurance), manufacturing, retail and petroleum. He is also an "Invited Expert" on IT security by the Security Forum of The Open Group.

While at IBM, he was the Americas IT Architecture Profession Leader and a member of the IBM Academy of Technology.

Learn more about Tony Carrato by visiting his [LinkedIn Profile](https://www.linkedin.com/in/tonycarrato/)