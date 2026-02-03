---
title: Continuous Open-Source Security Compliance from Scorecards to Runtime
description: An OpenSSF Scorecard and NIST Compliance Dashboard
summary: Continuous Alignment with NIST 800-218 (SSDF)
type: contributor
---

{{< blocks/section color=black >}}
<h1 class="text-center">Continuous Open-Source Security Compliance from Scorecards to Runtime</h1>
<hr>

{{< blocks/feature_dual  >}}

<div style="text-align:left;margin-top:20px;">

## A Continuous, Post-Deployment Security Compliance Dashboard
</div>

Open-source software now forms the backbone of modern applications, yet most organizations still struggle to answer a deceptively simple question:
Are the open-source packages running in production secure and compliant right now? Traditional approaches fall short. Pre-deployment scans capture a moment in time. One-off SBOMs age quickly. Compliance reports often reflect intent, not operational reality.

Ortelius closes this gap by serving as a continuous security compliance dashboard for open-source software, connecting project-level security signals, versioned SBOMs, live deployments, and post-deployment vulnerability detection into a single operational view.

## Operationalizing OpenSSF Scorecard Data

The [OpenSSF Scorecard](https://scorecard.dev/) offers critical insight into how open-source projects are maintained, evaluating practices such as code review, release signing, CI security controls, and vulnerability disclosure processes. While this data is valuable, it is often consumed as a static signal, useful for evaluation, but disconnected from day-to-day operational risk.

Ortelius operationalizes Scorecard data by correlating repository-level security hygiene with actual usage in production. By linking Scorecard results to the specific open-source packages and versions deployed across environments, Ortelius allows teams to see which low-scoring projects represent real exposure and which do not. This context shifts Scorecard from an abstract assessment into actionable intelligence that directly informs prioritization and remediation decisions.
This allows teams to distinguish between theoretical risk and active exposure, focusing remediation efforts on low-scoring projects that are truly impacting production systems.




{{< /blocks/feature_dual  >}}

{{< blocks/feature_dual  >}}

<div style="text-align:center;margin-top:100px;">
<img src="/images/flocker-scorecard.png" alt="OpenSSF Scorecard" height="100%" width="100%" />
</div>


{{< /blocks/feature_dual  >}}

<div style="text-align:left;margin-top:20px;">

## SBOM Versioning as a Living Compliance Record


Security compliance depends on maintaining an accurate inventory over time, not just at build or release. Ortelius treats SBOMs as living artifacts that evolve alongside deployments. Each change to a deployed system updates the associated SBOM, preserving both the current state and historical versions.
This continuous SBOM versioning provides a durable compliance record. Teams can clearly see which software versions were running at any point in time, how long vulnerable components remained in production, and when remediation occurred. Instead of reconstructing exposure after the fact, Ortelius captures this evidence automatically as systems change.

This enables organizations to answer compliance-critical questions such as:

<div style="margin-left:8px">

- Which vulnerable version was running, and for how long?

- When did exposure begin, and when was it resolved?

- Which systems were impacted during a specific disclosure window?

</div>

Instead of reconstructing history during audits, Ortelius records it continuously.

## Near-Real-Time CVE Detection for Live Systems


Vulnerabilities are disclosed continuously and often affect software that has been running in production for months or years. Ortelius continuously consumes vulnerability intelligence and re-maps it against deployed SBOMs every ten minutes. This ensures that newly disclosed CVEs are quickly correlated to the exact package versions running in live environments.
As a result, teams gain near-real-time visibility into which systems are impacted the moment a vulnerability becomes public. This eliminates the blind spots created by pipeline-only scanning approaches and ensures that production environments are continuously evaluated as the threat landscape evolves.



## Exposing the CVEs That Actually Matter

By combining deployment awareness with SBOM versioning, Ortelius filters noise and highlights real risk:
CVEs mapped directly to running workloads

<div style="margin-left:8px">

- Impact scoped by service, environment, and endpoint

- Prioritization based on actual runtime exposure, not theoretical severity
</div>

This dramatically reduces alert fatigue while improving response speed—transforming vulnerability management from reactive triage into proactive control.

## Continuous Alignment with NIST 800-218 (SSDF)

Modern compliance frameworks emphasize ongoing assurance, not periodic checks. [NIST 800-218 (SSDF)](https://www.cisa.gov/resources-tools/resources/nist-sp-800-218-secure-software-development-framework-v11-recommendations-mitigating-risk-software) explicitly calls for continuous identification, tracking, and remediation of vulnerabilities across the software lifecycle.
Ortelius supports these outcomes by operating where compliance risk is greatest: post-deployment.

Key SSDF alignments include:

<div style="margin-left:8px">

- Continuous vulnerability detection against live systems

- Accurate software inventories maintained through versioned SBOMs

- Traceability from open-source projects to deployed components

- Measurable remediation timelines based on real exposure windows

- Persistent evidence for audits, reporting, and risk reviews

</div>

Ortelius transforms SBOMs and vulnerability data into active security controls, not static compliance artifacts.

## From Compliance Artifacts to Defensible Security

Many organizations can demonstrate that they generate SBOMs or run security scans. Far fewer can prove what was actually running when a vulnerability was disclosed, which systems were exposed, and how quickly the issue was resolved. By unifying OpenSSF Scorecard insights, versioned SBOMs, ten-minute CVE correlation, and post-deployment remediation tracking, Ortelius delivers a defensible, real-time view of open-source security compliance. In an environment where software and threats constantly evolve, this continuous approach ensures that compliance and security remain grounded in operational reality, not static assumptions.
{{< /blocks/section >}}

{{< blocks/section color="primary">}}

## Join the Conversation & Contribute
Ortelius exists because of the open source community: from dependency topology modeling to vulnerability workflows that shape how teams think about post-deployment defense. If you’re interested in runtime vulnerability management, active risk prioritization, or tooling that surfaces real-world attack surface insight, we invite you to:

<div style="margin-left:8px">

- Try [Ortelius on GitHub](https://github.com/ortelius/ortelius) and contribute features
- Open issues or PRs around runtime risk signals you care about
- Join the [community calls](https://ortelius.io/events/) to discuss vulnerabilities, attacker models, and remediation workflows

</div>
Security is a shared challenge, and open collaboration is how we level up the ecosystem together.


{{< /blocks/section >}}




