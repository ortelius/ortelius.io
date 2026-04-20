---
date: 2026-03-29
title: "2026 Ortelius Non-functional Requirements"
linkTitle: "2026 Ortelius Non-functional Requirements"
author: Steve Taylor
---

<div class="col-center">
<img src="/images/ortelius-nonfuntionalblog.jpg" alt="Ortelius Non-functional requirements" height="483px" width="724px" />
</div>
<p></p>


<h2 class="text-left">What are Non-functional Requirements</h2>
<hr>

Non-functional requirements specify criteria that define the operation of a system rather than its specific behaviors. They describe attributes such as performance, security, scalability, reliability, and usability. Unlike functional requirements, which dictate what the system should do, non-functional requirements define how the system should perform its functions. This blog covers non-functional requirements for the Ortelius Security and DevOps Evidence Store.

<h2 class="text-left">Breaking Down the Ortelius Architecture</h2>
<hr>

First, let us start with the Ortelius Architecture. For a complete description, review the [Ortelius 2026 Architecture Guide.](https://github.com/ortelius/pdvd-backend/blob/main/docs/architecture.md)

### API Layer, Graph Database, and Event-Driven Ingestion

The web front-end is where end users interact to persist and consume vulnerability and deployment data stored in the back-end. Users can create, retrieve, and update data through the UI or CLI. All API traffic is served by a Go/Fiber v3 API layer exposing both REST (`/api/v1/*`) and GraphQL (`/api/v1/graphql`) endpoints, protected by JWT-based auth middleware that validates tokens and fetches role and org membership from the database on every request.

The API layer connects to ArangoDB, a multi-model graph and document database that sits at the centre of the system. ArangoDB stores releases, SBOMs, CVEs, endpoints, and sync records, and uses a hub-and-spoke graph design to connect vulnerability data with deployed software components efficiently.

The Ortelius CLI is where end users hook into their CI/CD pipeline to upload releases and SBOMs. The CLI uses the same REST API endpoints as the front end for persisting data, and supports passing credentials directly so no prior login session is required.

CVE data is ingested automatically from OSV.dev every 15 minutes. Optionally, releases can be ingested asynchronously via Kafka (`release-events` topic), allowing CI/CD pipelines to publish events rather than calling the REST API directly. Both paths run the same ingestion pipeline — there is no divergence between them.

Multi-tenant access control is managed through a GitOps RBAC model (Peribolos-style), where org and user definitions are stored in a `rbac.yaml` file in a Git repository and applied at startup, via webhook, or via direct API upload.

<h2 class="text-left">Ortelius Non-functional Requirements</h2>
<hr>

Understanding the basic architecture allows for a definition of the non-functional criteria that define the operation of Ortelius rather than its specific behavior.

### Performance and Scalability

All API endpoints maintain a response time of less than 3 seconds under normal load conditions, covering release uploads with SBOM processing, vulnerability queries for releases with up to 500 components, severity-based filtering across large datasets, and release-to-endpoint impact analysis with graph traversal.

CVE ingestion adds negligible overhead — less than 1ms per CVE for CVSS score calculation — and the pipeline can process over 50,000 CVE records per hour. The API handles concurrent requests from 100+ clients without degradation. A persistent index on `database_specific.severity_rating` enables fast severity-based filtering without runtime CVSS parsing.

The system is designed to scale to over one million releases, 500,000 unique SBOMs, and 100,000 CVE records while maintaining responsive query performance. The hub-and-spoke graph design reduces edge counts by 99.89% compared to direct CVE-to-SBOM connections, keeping storage and query costs linear as data grows.

### Reliability and Availability

The API service targets 99.9% uptime through robust error handling and recovery mechanisms. Database connections use exponential backoff retry logic to handle transient failures, and panic recovery middleware prevents individual request failures from crashing the service. The CVE ingestion job retries failed downloads up to three times before logging for manual intervention. CVSS parsing errors are logged but never block ingestion — CVEs with unparseable vectors are assigned a default LOW severity rating to ensure comprehensive coverage.

Zero-downtime rolling updates are supported by design. The Kubernetes deployment configuration uses `maxUnavailable: 0` to progressively replace instances of the previous version with the new version, maintaining service availability throughout and enabling automatic rollback if health checks fail.

### Security

Security is embedded throughout the system architecture. Key design decisions include:

1. **JWT design**: The token payload contains only the username. Role and org memberships are always fetched from the database on every request, so access changes take effect immediately without requiring token re-issue.

2. **Org-scoped queries**: All multi-tenant queries include `FILTER` clauses scoped to the requesting user's org memberships. Cross-org data leakage is not possible via the API.

3. **Parameterized AQL**: All database queries use bind variables — no string interpolation — preventing injection attacks.

4. **Transport security**: All external communications use TLS 1.2 or higher. Credentials are managed through environment variables and are never exposed in logs or error messages.

5. **Input validation**: All user inputs are sanitized before processing. SBOM content undergoes structural validation to prevent malicious data injection. ZipSlip protection prevents directory traversal attacks during archive extraction.

6. **Password security**: All passwords are hashed using bcrypt at DefaultCost (factor 10). Auth tokens are stored in `HttpOnly; SameSite=Lax` cookies — XSS cannot read the auth token.

7. **Vulnerability coverage of Ortelius itself**: The system tracks its own component vulnerabilities through SBOM ingestion, and CVE data is refreshed every 15 minutes from OSV.dev.

### Maintainability and Observability

The system follows clean architecture principles with clear separation between API handlers, business logic, and data access layers. All significant operations are logged with structured logging to enable debugging and audit trails. Error messages provide sufficient context for diagnosis without exposing sensitive information. Database schema changes are managed through explicit collection and index initialization rather than auto-migration, ensuring predictable upgrades and zero-downtime deployments.

### Compliance and Data Integrity

All vulnerability data is sourced from the authoritative OSV.dev database and refreshed every 15 minutes. CVSS scores are calculated using the official specification via the `github.com/pandatix/go-cvss` library, supporting v3.0, v3.1, and v4.0 vector strings. CVEs without parseable severity data are assigned LOW rather than being discarded, ensuring no vulnerability is silently dropped. Data deduplication at both the release level (composite key: name + version + contentsha) and SBOM level (SHA256 content hash) prevents redundant storage while maintaining a complete audit trail.

The implementation complies with industry standards including the CycloneDX SBOM specification, Package URL (PURL) specification, OSV vulnerability data format, and CVSS v3.0/v3.1/v4.0 specifications.

<h2 class="text-left">Conclusion</h2>
<hr>

In summary, defining the Ortelius non-functional requirements is essential for ensuring the quality, performance, and compliance of the Ortelius system, aligning stakeholder expectations, mitigating risks, and optimizing resource allocation throughout the development process.


{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Author</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Steve Taylor](https://www.linkedin.com/in/steve-taylor-oms/)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/steveandalien2.png" alt="Steve Taylor"  />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}