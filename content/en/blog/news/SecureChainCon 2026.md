---
date: 2026-04-06
title: "SecureChainCon 2026"
summary: SecureChainCon 2026
author: Tracy Ragan
tags:
  - SBOM
  - DevSecOps
  - Post-Deployment Vulnerability Management
  - Software Supply Chain Security
  - Post-Deployment Security
  - Ortelius
  - CTEM
categories:
  - News
---


<div class="col-center">
<h2 class="text-left">SecureChainCon 2026, June 25, 9AM MT - Noon MT</h2>
<img src="/images/SecureChainCon2026.png" alt="SecureChainCon 2026" height="500px" width="700px" />


<div style="font-size:1.8em;text-align:center;margin-top:20px">

**100% Online Event and Free to All**

[Register Today](https://us02web.zoom.us/meeting/register/dMo-7hpmSYygkhsbzp_VgQ#/registration)
<br>

</div>

{{< blocks/section color=white >}}


<h3 class="text-left">Run Free, Run Safe: Defend Post-Deployment in the Age of AI</h3>

Software supply chain security is entering a new phase. Attackers are no longer limited to exploiting weaknesses discovered during development. They are targeting what’s already running in production, often within days of a vulnerability being disclosed. As AI accelerates both vulnerability discovery and weaponization, organizations must evolve from build-time scanning to continuous post-deployment defense. 
SecureChainCon, hosted by the Ortelius open-source community, brings together practitioners, security leaders, platform engineers, and open-source contributors working to close the gap between vulnerability detection and real-world exposure. The conference focuses on making SBOMs operational, improving deployment visibility, and using automation and AI-assisted remediation workflows to reduce risk across live environments.
This is not another conference about scanning earlier in the pipeline; it’s about Continuous Threat Exposure Management (CTEM) and Remediation for what’s already deployed. SecureChainCon is designed for teams ready to move beyond pre-deployment scanning and toward continuous defense of the software that is already in production—where today’s attacks actually happen.


<h3>Keynote Speaker - John Linford, The Open Group</h3>

<br>

<div style="text-align:left;width:100%;margin-top:30px">
<p></p>
<img src="/images/JohnLinford.jpg" alt="John Linford" height="250px" width="250px"/>
</div>


**You Can’t Manage What You Can’t See: The Role for Open Standards in the Age of AI**

With the ever-increasing adoption of AI, designing and developing products securely has been still more critical, but actively managing your deployed products has become imperative. So how do you manage those vulnerabilities post-deployment?

Join this conversation with John Linford, The Open Group Security Portfolio Director, to learn more about tools, techniques, and (open) standards that can help you and your company gain visibility into your vulnerabilities and actively manage and mitigate them. [John Linford](https://www.linkedin.com/in/johndouglaslinford/) is the [The Open Group](https://www.opengroup.org/) Security Portfolio Forum Director, responsible for facilitating the creation and delivery of standards and certification programs from the Security Forum, Open Trusted Technology Forum (OTTF), and Assured Dependability Work Group. These groups comprise the cybersecurity and supply chain security SMEs in The Open Group. The Open Group is a global consortium that enables the achievement of business objectives through technology standards. As Forum Director, John supports the leaders and participants of his Forums and Work Group in utilizing the resources of The Open Group to facilitate collaboration and follow The Open Group consensus-based Standards process to publish their deliverables.

<br>


<h3>Guest Speakers</h3>

<div style="text-align:left;width:100%;margin-top:30px">
<p></p>
<img src="/images/SecureChainCon2026-GuestSpeakers-All.png" alt="2026 Guest Speakers" height="500px" width="500px"/>
</div>

<br>
<p>  </p>

<strong> Agenda: </strong>

9:00-9:30 - Beer and Donuts
Awards, roadmap and community annoucements. Meet the team - a lively discussion of contributors and friends. 

9:30-10:00 - Live Keynote - John Linford
A keynote presentation and interview with John Linford of the Open Group

10:00-10:30 - Live Ortelius Demos - with the Architecture Team
See the newest features of the Ortelius Post-Deployment CVE Detection Platform

10:30-12:00 - Guest Speakers

<strong>10:30- 10:45 - Siddharth Jain - Sense, Reason, Act Safely</strong>

AI agents in enterprise systems create a post-deployment control problem: once they are running, teams need continuous visibility into what the agent saw, how it reasoned, what it changed, and which human or policy gates approved the action.  This talk shares architecture patterns from building production AI workflows for finance and enterprise operations at OpenAI. The examples include permissioned access to source documents and structured data, cited and inspectable outputs, MCP integrations and UIs, Apps SDK surfaces, Temporal-style workflow orchestration, evals, audit trails, and human-in-the-loop review. Siddharth will map those patterns to a practical sense-reason-act model for deployed AI systems: sense with telemetry, source grounding, and runtime context; reason with constrained model calls, structured outputs, evals, and policy checks; and act through deterministic workflows, approval gates, remediation queues, and rollback paths. Attendees will leave with concrete design patterns for making AI-assisted remediation and enterprise automation reviewable, governed, and safer after deployment.

<br>

<strong>10:45-11:00 - Przemyslaw Roguski, Red Hat - Contextual SBOMs</strong>

Software Bills of Materials (SBOMs) are fundamental to modern software transparency, providing a component inventory vital for vulnerability management programs. However, in complex, modern build environments, especially those involving multistage builds, traditional analyzed SBOMs fail to provide the necessary detail, often grouping content from various build stages and layers into a single component. This session delves into the critical need for and implementation of Contextual SBOMs. A Contextual SBOM is an advanced form of the SBOM that captures origin of the content sourced from base image or build stages of the multistage builds. By precisely identifying content that is COPY-ied from builders in multistage builds , the Contextual SBOM enables a significant "shift-left" in security. This intelligence is essential for precise vulnerability management, allowing security teams to differentiate between transient build tools and actual product dependencies, thereby ensuring a verifiable, trusted software supply chain and proactively managing vulnerabilities during the build phase. This talk is ideal for security professionals, compliance officers, compliance auditors, developers and anyone involved in the supply chain aspects of software.


<strong>11:00-11:15 - Janane Suresh, Oracle - Deployment-Aware SBOMs</strong>

Standardizing on Software Bills of Materials (SBOMs) was a massive step forward for transparency, but for most organizations, the SBOM remains a "birth certificate"—a static document that tells you what was born in the factory, but not where it lives or what it’s doing now. In an era where AI-accelerated attacks weaponize vulnerabilities in hours, relying on stale build-time data is a recipe for a 100-day remediation cycle. Using the lessons of Log4j as a catalyst, this session explores the shift from static inventory to "Deployment-Aware" SBOMs. We will walk through the architecture of a continuous evidence pipeline that maps your SBOM metadata directly to live production environments—clusters, namespaces, and pods. By bridging the gap between build-time identity and runtime behavior, we solve the two biggest hurdles in modern vulnerability management: Identification and Prioritization.


<strong> 11:15-11:30 - Fahed Dorgaa - Post-Deployment CVE Triage with LLMs</strong>

A Trivy or Grype scan against a running service returns hundreds of CVEs. Most are unreachable in the deployed runtime, already covered by an existing control, or irrelevant to the service's exposure and data. CVSS rates the CVE; it cannot rate your production context. This talk walks through vens (https://github.com/venslabs/vens), an open-source tool built to close that gap. vens takes the scanner report plus a YAML description of the deployed system (exposure, data sensitivity, compliance scope, existing controls) and uses an LLM as the "Reason" step in a Sense → Reason → Act loop. The output is a CycloneDX VEX document with an OWASP Risk Rating (0–81) per vulnerability, consumable by vulnerability management platforms (e.g., Dependency-Track, Trivy, etc.). 

<strong>11:30-11:45- Vanessa Toves, Druva - AI Cyber Resilience for Microsoft Cloud Data</strong>

Azure services, Entra ID and Microsoft 365 form the backbone of many AI initiatives and business operations, seamlessly integrating to drive efficiency and innovation. However, this interconnected power also expands the attack surface, increasing the potential risk of data loss and security breaches. This compounded with an organization’s pursuit of AI initiatives, the threat vectors increased overnight. Data resilience across these platforms is no longer optional—it’s essential to ensuring business continuity and swift recovery from cyber incidents. In this session, we’ll uncover the key vulnerabilities and provide actionable strategies to strengthen your data security posture against evolving threats.


<strong>11:45 Closing with Tracy Ragan</strong>


<br>

{{< /blocks/section >}}

{{< blocks/section color=primary >}}

{{< blocks/feature_dual >}}

<h2 class="text-left">Why You Should Attend</h2>
<hr>

- Learn how AI is changing the vulnerability landscape
- Understand how attackers are leveraging automation to weaponize CVEs faster—and what defenders must do differently to respond in production environments.
- Make SBOMs actionable instead of archival
- Discover how deployment-aware SBOM correlation enables teams to identify exactly where vulnerable components are running and prioritize remediation based on real exposure.
- Adopt post-deployment vulnerability defense strategies
- Explore emerging approaches like deployment digital twins that provide continuous visibility across applications, containers, services, and infrastructure.
- Reduce alert fatigue and focus on what matters
- See how endpoint-aware risk intelligence helps teams move from “scan everything” to fixing the vulnerabilities that actually impact running systems.
- Understand how AI enables safer, faster remediation
- Learn how AI-assisted dependency updates and workflow automation are helping organizations shrink remediation timelines from months to days.
- Connect with the open-source community building the next generation of supply chain security
- Collaborate with engineers and security practitioners advancing practical solutions for runtime visibility, SBOM operations, and deployment intelligence.


{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<h2 class="text-left">Who Should Attend</h2>
<hr>


- Platform Engineers
- DevOps Engineers
- Full Stack Engineers
- Application Developers
- Security Engineers and CISO Teams
- Project Management

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}

{{< blocks/section color=white >}}

<h2 class="text-left">Key Takeaways</h2>
<hr>


{{< blocks/feature_dual >}}

<strong>Shift Left Security</strong>: Understand the importance of integrating security practices early in the software development lifecycle (SDLC) to identify and remediate vulnerabilities at the source code level.

<strong>Automation is Key:</strong> Learn the role of automation in DevSecOps, from automated security assurance and vulnerability scanning to automated compliance checks and policy enforcement, to improve efficiency and consistency.

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<strong>Culture of Collaboration </strong>: Recognize the need to foster collaboration and shared responsibility among development, operations, and security teams to effectively implement DevSecOps practices.

<strong>Threat Intelligence and Risk Management</strong>: Explore the importance of leveraging threat intelligence and risk management frameworks to prioritize security efforts, allocate resources effectively, and mitigate emerging threats.

<strong>Compliance and Governance:</strong> Address the challenges of maintaining compliance with regulatory requirements, such as aggregated SBOMs, and industry standards in DevSecOps environments.
{{< /blocks/feature_dual >}}
{{< /blocks/section >}}