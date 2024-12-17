---
date: 2024-12-17
title: "How do you Track and Report Security Compliance?"
summary: How do you Track and Report Security Compliance?
author: Tony Carrato, Christopher Carlson, John Linford
---

<div class="col-center">
<img src="/images/trackingandreportingsecurity-concept.jpg" alt="track and report security compliance" height="483px" width="724px" />
</div>
<p></p>
<p></p>

## Introduction

Ensuring a robust IT security compliance strategy is more critical than ever. For organizations, the ability to track and report security compliance effectively is not just a regulatory necessity but also a vital component of maintaining trust, safeguarding assets, and reducing risks.

This blog explores the essential steps and considerations for managing security compliance from addressing open-source risks to documenting and verifying security test plans. We will provide insights to help you begin the process of establishing a compliance tracking and reporting system that is comprehensive, practical, and adaptable to your organization’s needs. You will find important industry reports that can help guide you through the process, and you will be introduced to [Ortelius](https://ortelius.io), an open-source vulnerability management system for getting the process started. 

## Step 1 Understand Your Requirements

In order to properly track and report on security compliance, the first step is to understand what your organization’s security requirements are. If these are incomplete or perhaps not as well stated as they might be, then the requirements may need to be defined or re-defined. In doing so, it’s important to both have a clear target set of requirements and an understanding of why they are targets.

These might come from:

- Organization-identified security requirements
- Legal requirements
- Regulatory requirements
- Financial reporting requirements
- Enterprise IT-based requirements
    - From Enterprise Architecture
    - From IT Operations Management

## Step 2 Communicate the Requirements

Next, the responsible security person needs to ensure both developers and IT operations know what these security requirements are and understand what they mean. This means
that you need to communicate security-related best practices and expectations. These communications must be put in terms that are meaningful to their targets, i.e. developers
and IT operations. Requirements are only meaningful if they can be measured and tested against.

Fortunately, there are a number of very helpful examples of good security requirements.

Some can be found at:

- [US Industrial Security Requirements for Safeguarding Classified Information](https://www.cia.gov/readingroom/docs/CIA-RDP89B01356R000200350006-4.pdf)
- [Microsoft secure development lifecycle](https://www.microsoft.com/en-us/securityengineering/sdl?oneroute=true)
- [US National Institute of Standards and Technology (NIST) Secure Software Development
Framework (SSDF)](https://csrc.nist.gov/pubs/sp/800/218/final)
-  [The US Critical Infrastructure Security Agency (CISA) Secure by Design Pledge](https://www.cisa.gov/resources-tools/resources/cisa-secure-design-pledge)

There are, of course, many other examples of security requirements available. Some of these will be industry-based. Some will come from regulators, either financial or otherwise. Some may come from your insurance company, if you have either cybersecurity or business risk insurance. (Yes, you do need to check with your insurance company.) 

In a modern development organization, it’s important to ensure that these requirements take into account DevSecOps development processes and tools.
As mentioned above, there are very likely to be compliance requirements, which are requirements imposed on your organization from outside. 

These can include:

- Industry requirements, such as those relating to government sales and delivery
contracts; Industrial Security Requirements for Safeguarding Classified Information
-  Financial reporting requirements
- Insurance requirements
- Business partner requirements, such as those pertaining to third-party risk management. Remember, some business partners will be able to impose their requirements upon the organization. In modern software development, it is nearly impossible to avoid the use of open-source libraries and other components. It is very likely that it will be necessary to know the provenance of consumed code.

Questions that are likely to need answers are:
- Have the open-source components undergone any form of security review?
- Which version(s) have been reviewed, by whom?
- Which versions are approved for use in the organization?
- Are there licensing implications in using any given open-source components? You will need to map organization security requirements to regulatory compliance and have a determined method for verification that those requirements are being met. Which of the requirements demonstrate compliance and how is that demonstrated? Key to this are your security test plans.
    - Are they documented? If so, who reviews them and are they kept up to date?
- How are security testing results tracked?

## Step 3 Define a Reporting Action

Finally, it is critical to know:
- To whom do security issues need to be reported?
- Is there a regular cadence for reporting?
- Is there a defined time after an incident happens when a report must be made?
- What information needs to be reported?
    - This is likely to be different for external reporting and internal reporting.


## How Open-Source Can Help

Getting started may be easier than you think. Powerful open-source tooling can be used to begin gathering critical security compliance insights. One such tool is Ortelius, an open-source vulnerability management platform incubating at the [Continuous Delivery Foundation](https://cd.foundation). Ortelius simplifies tracking and reporting of security compliance by gathering the results of DevSecOps tools such as [OSV.dev](https://osv.dev), [Syft](https://anchore.com/opensource/), [CycloneDX](https://cyclonedx.org/), and [OpenSSF Scorecard](https://scorecard.dev/). Many organizations lack clearly defined security standards for transient dependencies introduced through the open-source software supply chain. Tools like OpenSSF Scorecard, developed under the Linux Foundation’s [OpenSSF](https://openssf.org) initiative, provide actionable requirements for securing these packages. 

Moreover, Ortelius aggregates this data into ‘logical’ applications, making it ideal for supporting modern, decoupled architectures that rely on hundreds of independently deployed services, creating fragmented security data. This approach provides a holistic view of the software solution delivered to end users, ensuring comprehensive security coverage.

While Ortelius may not address every challenge related to security compliance, it serves as a robust starting point for managing open-source packages—the core of many vulnerabilities affecting software assets today. With seamless integration into CI/CD pipelines, Ortelius scales effortlessly without requiring potentially risky container scanning agents. Simply plug it into your CI/CD workflow and start tracking and reporting on the security profiles of your software supply chain with confidence.

You can start with the [Ortelius open-source SaaS version hosted by DeployHub for continuous vulnerability management](https://docs.ortelius.io/guides/userguide/orteliustutorial/).

<div class="col-left">
<img src="/images/ortelius-stacked-color.png" alt="Ortelius" height="150px" width="150px" />
</div>

<p></p>

## Conclusion

In conclusion, tracking and reporting on security compliance is a multifaceted process that requires a clear understanding of organizational requirements, effective communication of those requirements, and the implementation of robust testing and verification mechanisms. Itis not enough to define security needs; organizations must align them with regulatory, legal, and industry standards while accounting for modern development practices like DevSecOps.

The integration of open-source components introduces additional complexities, such as verifying their security and licensing implications, further underscoring the need for rigorous documentation and regular reviews. Ensuring that security compliance processes are transparent and well-communicated across teams—from developers to IT operations—is critical for maintaining accountability.

Lastly, a structured approach to reporting, both internally and externally, ensures that security issues are addressed promptly and effectively. By establishing clear protocols for testing, tracking, and reporting, organizations can navigate the evolving landscape of security compliance with confidence and resilience. The Ortelius open-source vulnerability management solution can help you get started by gathering critical insights you already have coming from the DevSecOps pipeline. 



{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Authors</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:

- [Tony Carrato](https://www.linkedin.com/in/tonycarrato/)
- [John Linford](https://www.linkedin.com/in/johndouglaslinford/)
- [Christopher Carlson](https://www.linkedin.com/in/christopher-carlson-7aba343/)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/trackingandreportingsecurity.png" alt="Meet the Speakers"  />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}
