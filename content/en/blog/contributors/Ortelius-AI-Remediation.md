---
date: 2026-04-01
title: "AI Automation for Secure Dependency Fixes"
linkTitle: "AI Automation for Secure Dependency Fixes"
author: Steve Taylor
tags:
  - SBOM
  - DevSecOps
  - Vulnerability Management
  - Continuous Threat Exposure Management (CTEM) 
  - Software Supply Chain Security
  - Post-Deployment Security
  - Ortelius
  - Dependency Remediation 
categories:
  - AI Remediation
  - MCP
  - Security
  - Software Supply Chain
  - DevSecOps
---



Security teams today face a constant barrage of CVE notifications, so many that the signal gets buried in the noise. Over time, alert fatigue sets in, and remediation remains a manual, time-consuming source of engineering toil rather than a fast path to risk reduction.

Updating a dependency is rarely just a version bump. It requires understanding transitive dependency trees, constraint conflicts, ecosystem semantics, and runtime impact. What security teams actually need is not another scanner, but an intelligent remediation agent that behaves like an experienced security engineer.

This post introduces a production-ready architecture for an AI-driven CVE remediation agent designed to analyze dependency graphs, select remediation strategies, and generate validated Pull Requests automatically, without sending proprietary code to external AI services.

{{< blocks/section color=white >}}

<div class="col-12">
<iframe src="https://www.youtube.com/embed/HcJstyTzJOQ" title="AI Automation for Secure Dependency Fixes Explained" frameborder="0"      
      allowfullscreen 
      style="position: relative; top: 0; left: 0; width: 100%; height: 400px; padding-left: 20%; padding-right: 20%"
    ></iframe>
</div>


{{< /blocks/section >}}


## Why CVE Remediation Is Harder Than Detection
Most existing tools stop at alerting:

“Package X is vulnerable. Upgrade to version Y.”

But real-world remediation involves:

- tracing transitive dependency paths
- evaluating semantic version constraints
- determining whether parents block upgrades
- deciding between clean upgrades vs overrides
- preserving build stability
- validating fixes through CI workflows

The Ortelius AI Auto Remediation architecture solves those problems using a structured three-tier AI remediation agent model.



## Architecture Overview: A Three-Tier Remediation Agent

The system separates reasoning, orchestration, and execution responsibilities:

| Component | Technology |  Responsibility |
|----------|------|-------|
| Sense | Digital Twin | Phage 1 Gathers SBOM and Deployment Metadata (Helm Charts, Kubernetes logs) and synchronizes with OSV.dev |
| Reason | Qwen2.5-Coder-7B LLM and Node.js Orchestrator | This phase follows the ReAct pattern to determine if a fix requires an update or an override. |
| Act | @modelcontextprotocol/sdk| Final phase exposes 5 specific tools to the LLM and executes remediaiton logic programmatically. |

This separation ensures:

- deterministic execution
- schema-safe file changes
- reproducible remediation workflows
- ecosystem portability (Node, Go, etc.)

Instead of allowing an LLM to modify files directly, the model reasons only, while the MCP layer performs execution safely.


<div class="col-left">
<img src="/images/Ortelius-Sense-Resaon-Act.png" alt="AI Auto Remediation" height="600px" width="1000px" />
</div>


## From CVE Alert to Verified Pull Request

The remediation lifecycle mirrors the workflow of a senior security engineer.

<strong>Step 1: Detection </strong>

A vulnerability alert enters the system from a scanner or SBOM pipeline. The agent converts the alert into a structured remediation objective.

<strong> Step 2: Dependency Path Investigation </strong>

Instead of blindly upgrading packages, the agent:

- maps full dependency paths
- identifies transitive parents
- determines whether exposure is real
- evaluates constraint conflicts

This avoids unnecessary breakage while focusing only on actionable risk.

<strong>Step 3: Strategy Selection </strong>

The agent chooses among four remediation strategies:

| Strategy | When Used |
|---------|-----------|
| update_transitive | Upgrade nested dependency directly |
| bump_parent | Upgrade parent package |
| override | Apply temporary constraint override |
| no_action_required | Fix already blocked by constraints |

This mirrors real-world engineering decision-making instead of static rule execution.



## Deterministic Constraint Analysis (Not Guesswork)

One of the most powerful elements of this architecture is the **constraint evaluation engine**. Before selecting a remediation strategy, the system runs a structured comparison pass that:

1. Pads semantic versions deterministically
2. Evaluates lower and upper bounds
3. Checks constraint compatibility
4. Classifies violations
5. Returns a structured JSON decision object

Example:

``` 
4.14.6 → v004014006
```
This guarantees lexicographic ordering across ecosystems and eliminates ambiguity in version reasoning. The orchestrator, not the LLM, decides the strategy based on this output.

This is critical for reliability.


## MCP: Separating Thinking from Doing

The architecture uses the Model Context Protocol (MCP) as a capability layer between the LLM and the filesystem.

This creates a strict boundary:

- The LLM can reason
- The MCP tool executes

Example workflow:

```
LLM selects strategy
↓
Calls generate_renovate_config
↓
MCP validates parameters
↓
Writes configuration file
↓
Runs Renovate modules locally

```

The model never writes package manifests directly. This eliminates hallucinated config errors and guarantees schema validity.


## Renovate as the Execution Engine

Instead of generating patch suggestions manually, the system embeds Renovate modules directly into the remediation loop. The agent produces a real Pull Request containing:

- manifest updates
- lockfile recalculation
- dependency corrections
- version overrides if required

This keeps remediation aligned with existing CI/CD workflows:

- Engineers review the PR before merge.

- Human-in-the-loop safety is preserved.


## Tooling Provided by the MCP Server

The remediation agent exposes five structured execution tools:

| Tool                     | Function                                      |
| ------------------------ | --------------------------------------------- |
| get_dependency_paths     | Finds vulnerable package entry paths          |
| check_parent_fix         | Tests whether upgrading parent resolves issue |
| apply_override           | Applies constraint override if needed         |
| generate_renovate_config | Builds remediation configuration              |
| run_local_renovate       | Executes patch generation                     |


Each tool represents a deterministic remediation step. Together they form a repeatable vulnerability-to-PR pipeline.


## Why This Architecture Works Better Than Traditional Fix Bots

Typical dependency bots:

- bump versions blindly
- ignore runtime exposure
- cannot resolve constraint conflicts
- generate noisy PRs
- create upgrade fatigue

The Ortelius AI agent instead:

✔ traces dependency graphs

✔ evaluates semantic compatibility

✔ selects remediation strategy intelligently

✔ executes fixes safely

✔ produces reviewable PRs

It behaves like a security engineer inside your pipeline. 

## The Strategic Advantage: AI + Structured Execution

This architecture demonstrates something important about the future of software supply chain security:

- The next generation of remediation tooling will not be scanners.

- They will be reasoning agents with controlled execution boundaries.

By combining:

- LLM reasoning
- deterministic constraint analysis
- MCP capability isolation
- Renovate automation

Teams can move from alert-driven security to resolution-driven security. 

## Where This Fits in the Future of Automated Remediation Platforms

This design pattern aligns directly with emerging approaches in [post-deployment vulnerability defense](https://www.deployhub.com), especially platforms that focus on identifying which vulnerable components are actually running in production environments and prioritizing remediation accordingly.

When runtime visibility is combined with intelligent remediation agents like this one, organizations gain:

- attack surface awareness
- constraint-aware patch automation
- SBOM-driven remediation prioritization
- reduced MTTR for critical CVEs

That is the foundation of continuous vulnerability defense.

Not just detection, <i>but closure.</i>


## Supporting Air-Gapped and Highly Regulated Environments - On-Prem with Loacl AI Agent

While most users will interact with Ortelius via the SaaS environment, some will require an on-premise installation of Ortelius, with a local AI-agent. Security-sensitive environments, including defense, regulated enterprise, and HPC infrastructure, cannot send source code to cloud AI APIs. An on-premise installation with local AI agents will satisfy the needs of these highly secured environments.

The local AI Agent system runs entirely locally using:

- Qwen2.5-Coder-7B
- llama.cpp
- GGUF model format
- MCP tool interfaces

Result:

**No proprietary code leaves the machine.**

This makes the architecture viable for:

- air-gapped systems
- classified environments
- enterprise software factories
- space and defense pipelines
- regulated CI/CD infrastructure




## Conclusion and Get Involved: Help Build the Future of AI-Driven Remediation

Automated CVE remediation is entering a new phase, moving beyond detection toward intelligent, constraint-aware resolution that operates safely inside real development workflows. This architecture represents an important step toward that future, but it is only the beginning.

We invite contributors who are interested in dependency intelligence, SBOM-driven security, Model Context Protocol (MCP) tooling, local LLM orchestration, and automated vulnerability remediation to [join the Ortelius community](https://ortelius.io/contributor/) and help shape this work. There are opportunities to contribute across the stack, from dependency-path analysis and remediation strategy logic to MCP tool integrations and workflow automation inside modern software factories.

Watch for upcoming Ortelius releases that will begin delivering these AI-assisted remediation capabilities as part of its broader mission to provide continuous, post-deployment vulnerability visibility and response. Together, we can move the industry from alert fatigue to automated resolution, and make continuous vulnerability defense a practical reality.



{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Author</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Steve Taylor](https://www.linkedin.com/in/steve-taylor-oms/) 


{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/steveandalien2.png" alt="Meet the Speakers" height="400px" width="300px" />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}


