---
date: 2023-03-07
title: "SBOMs and usage in the Software Delivery Life Cycle"
summary: SBOMs and usage in the Software Delivery Life Cycle
author: Ankur Kumar
---

{{< figure src="/images/sbomandsdlc.png" width="500px" height="300px" >}}


# Introduction

The software supply chain is a model for producing quality products with an integrated lifecycle of upstream and downstream dependencies. An SBOM is a key component of the software supply chain. SBOM adoption has increased exponentially considering legal, compliance, and security considerations. This article briefly introduces SBOM and describes its usage in the Software Delivery Life Cycle (SDLC).



## SBOM Definition

An SBOM is a formal record containing the details and supply chain relationships of various components used in building software. Software developers and vendors often create products by assembling existing open source and commercial software components. The SBOM enumerates these components in a product (as defined by [NIST SP 800-161r1](https://doi.org/10.6028/NIST.SP.800-161r1)).

## SBOM Formats

SBOMs can be generated in a variety of [SBOM formats](https://www.deployhub.com/understanding-software-bill-of-materials-sboms/) (for both human and machine-readable formats). Primarily supported formats are:

- [CycloneDX](https://cyclonedx.org/): a full-stack SBOM standard by the [OWASP](https://owasp.org/) community covering SBOM, SaaSBOM, HBOM, OBMOM, VDR, and VEX. [Click here](https://cyclonedx.org/specification/overview/) to learn more about the CycloneDX specification.
- [SPDX](https://spdx.dev/): an open standard for SBOM (ISO/IEC 5962:2021) supported by The Linux Foundation.
- [SWID](https://www.iso.org/standard/65666.html): a standard by the ISO/IEC for tagging software to optimize its identification and management.
- [Syft](https://github.com/anchore/syft): a CLI tool by [Anchore](https://anchore.com/) (written in Go) for generating SBOM from container images.

## Information in SBOM

While SBOM generates comprehensive information, these are the minimum viable information required:

- Supplier Name
- Component Name
- Unique Identifier for the component
- Version
- Component Hash
- Relationship
- Author/Creator
- License Information

## SBOM Usage

While there are many different areas of SBOM usage, below are the three most common usage of SBOMs:

### #1 - Insights for open source licensing and compliance

- With the increasing usage of open source and third-party software in building solutions across industries, an SBOM helps to comply with licensing obligations transparently with your customers and other partners.
- An SBOM provides broader visibility to understand complex projects for better quality management. An organization can also use it for understanding the need for the required experience and expertise for the respective product.

> Gartner expects the adoption of software bills of material (SBOM) by enterprise organizations to go from less than 5% now to 60% by 2025.

### #2 - Detect, prioritize, and mitigate security vulnerabilities

- An SBOM helps to identify potentially vulnerable components and automate the detection process throughout the software supply chain process.
- An SBOM can help stakeholders determine the relevance of disclosed vulnerabilities and take action accordingly.
- An automated approach (illustrated below) can help alert about potential security risks based on the version information available in the SBOM.

> "Protecting Yourself Will Lead To Protecting The Industry" - Forrester.
>
### #3 - Reduce operational risk and mitigate proactively

- With SBOM data bundled with every product version release, it ensures any operational risk is mitigated.
- At times, software components reach their end-of-life (EOL) and are not supported by the supplier. An SBOM enables proactively reducing operational risk by highlighting such components and helping mitigate them.
- An SBOM demonstrates your organization's mindset towards higher quality and operational visibility.


## Conclusion

At every supply chain level, the shift from herd vulnerability to herd immunity highlights the cumulative, public health-like benefits of the added transparency and resiliency unlocked by SBOMs (NIST). Large and small enterprises will benefit from the insights that SBOMs provide. Critical to the process is the consumption and catalog of SBOM data along with the versions of components managed across the SDLC. An illustration of the end-to-end SBOM data analysis flow is shown below:
![End-ot-end SBOM Flow](images/supply-chain-sbom-sdlc.png)

## References

- [CycloneDX Object Model and Specification Overview](https://cyclonedx.org/specification/overview/)
- [The National Telecommunications and Information Administration (NTIA) Document on SBOM Roles and Benefits](https://www.ntia.gov/files/ntia/publications/ntia_sbom_use_cases_roles_benefits-nov2019.pdf)
- [The Minimum Elements For a Software Bill of Materials (SBOM)](https://www.ntia.doc.gov/files/ntia/publications/sbom_minimum_elements_report.pdf)
- [SBOM Life Cycle by NIST](https://www.nist.gov/itl/executive-order-14028-improving-nations-cybersecurity/software-security-supply-chains-software-1)
- [Forrester: Why SBOMs Are Critical Now](https://www.forrester.com/blogs/log4j-open-source-maintenance-and-why-sboms-are-critical-now/)

## Useful Tools

- [Online SBOM Generation for Demo](https://democert.org/sbom/)
- [Paketo Build Pack for SBOM Generation](https://paketo.io/docs/howto/sbom/)
- [CycloneDX Tool Center for SBOM Ecosystem](https://cyclonedx.org/tool-center/)
- [SPDX Online Tool for SBOM Validate, Compare](https://tools.spdx.org/app/)
- [CVE Online Search Utility](https://cve.mitre.org/cve/search_cve_list.html)

## Acronyms Used

| Acronym | Description |
|---------|-------------|
| CVE     | Common Vulnerabilities and Exposures |
| HBOM    | Hardware bills of materials: every physical piece or component used to build a product. |
| NIST    | NIST is the National Institute of Standards and Technology at the U.S. Department of Commerce. |
| OWASP   | The Open Web Application Security Project |
| SBOM    | Software Bill of Materials |
| SCA     | Software Composition Analysis |
| VDR     | Vulnerability Disclosure Report (VDR) is an attestation by a software vendor showing that the vendor has checked each component of a software product SBOM for vulnerabilities and reports on the details of any vulnerabilities reported by a NIST NVD search. |
| VEX     | Vulnerability-Exploitability eXchange: an attestation, a form of a security advisory that indicates whether a product or products are affected by a known vulnerability or vulnerabilities. |

## About Ankur Kumar

{{< figure src="/images/ankurkumar.jpg" width="300px" height="300px" >}}

Ankur is a Senior engineering leader with more than 20 years of IT industry experience. He is a leader in multi-year digital transformation programs at all stages of the software delivery lifecycle, including strategy, planning, architecture & design, implementation, and site reliability. He is a results-driven core technologist with experience in Cloud, Microservices, Event-driven, and Web-scale distributed architectures.

Ankur works with the Ortelius community on outreach events and has presented at the Ortelius bi-annual Visionaries Summit. Learn more about Ankur from his [LinkedIn Profile](https://www.linkedin.com/in/ankurkumarz/).
