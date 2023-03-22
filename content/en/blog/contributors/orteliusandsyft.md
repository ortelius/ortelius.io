---
date: 2023-03-22
title: "Using Syft with Ortelius"
linkTitle: "Using Syft with Ortelius"
author: Tracy Ragan
---

## Ortelius and the Consumption of SBOMs

Core to the effort of hardening your software development process is the use of SBOMs. Software Bill of Materials reports are a critical tool in understanding all of the parts of your software supply chain. Without an SBOM you have little understanding of the dependencies your software is consuming. An SBOM gives you a list of your dependencies, what license they use, provenance (where it came from), and version information. With this information you can derive CVEs with a more comprehensive understanding of the artifact. 

An SBOM should be created for every 'build' of your component, that being a monolithic application or decoupled microservice. With the direct link between your artifact and SBOM, you have a much clearer picture of your supply chain, and the CVEs associated to specific releases. 

For this reason, Ortelius relies on the consumption of SBOMs. Ortelius can consume any SPDX and CycloneDX formatted SBOM. If you are not currently generating SBOMs as part of your pipeline process, you need to. But there is little use in generating them if they are not put to work. 

Ortelius consumes SBOMs to make them relevant and the basis for viewing your entire organizations security profile. In Ortelius, SBOM data can be aggregated to 'logical' applications in a microservice implementation. SBOMs can also be aggregated up to environment levels allowing you to perform package searches across siloed teams. 

Syft is a popular SBOM generation tool that uses the CycloneDX format. Ortelius can use Syft to add SBOM generation collecting lower dependency data. Following is how to add Syft to your pipeline workflow to include the collection of Syft SBOM data. 

## Adding Syft to your Pipeline Automation

[Syft SBOM tool](https://github.com/anchore/syft) will generate Software Bill of Materials Reports for popular coding languages and package managers, including Docker images. 

The following code example scans a Docker Image to generate the SBOM.  See [Syft Options](https://github.com/anchore/syft#supported-sources) to scan other objects and coding languages.

```bash
# install Syft
curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b $PWD

# create the SBOM
./syft packages $DOCKERREPO:$IMAGE_TAG --scope all-layers -o cyclonedx-json > cyclonedx.json

# display the SBOM
cat cyclonedx.json
```

## Passing the Name of the SBOM Report

>Note: To complete the process you will need to install the Ortelius CLI where your CI/CD server is running. Refer to the [Ortelius GitHub CLI Documentation](https://github.com/Ortelius/cli/blob/main/doc/dh.md) for installation instructions. 

Execute the following calls to the Ortelius CLI as part of your workflow. It should be called after the build and SBOM generation:

With CycloneDX SBOM

```bash
dh updatecomp --rsp component.toml --deppkg "cyclonedx@name of your SBOM file"

Example:
dh updatecomp --rsp component.toml --deppkg "cyclonedx@cyclonedx.json"
```


## Results

Each time your DevOps Pipeline processes a component, a new release version is assigned, and a new SBOM is created. Ortelius stores the SBOM information with the new Component version and displays it in the Ortelius Dashboard. CVE information is gathered based on this version. 

<img src="/images/compnentsbom.png" style="width:1300px;height:500px;">
<br>
<br>

Each time a new Component version is created, Ortelius automatically creates a new release number for every logical application that consumes the Component. It also creates a new SBOM for the logical Application version. Ortelius continuously updates all impacted applications with new SBOM data, and therefore new CVE data. 

<img src="/images/appsbom.png" style="width:1300px;height:500px;">
<br>
<br>

As Ortelius collects this information, it can provide you deep search capabilities on any transitive dependencies used across your organization. Need to know where Log4J is running? Just search for it in Ortelius, and find out who is using it, what version and where it is running. No more guess work. 

<img src="/images/log4jsearch.png" style="width:1300px;height:500px;">
<br>

## Conclusion

While most of us may be aware of the benefits of generating SBOMs, it may seem like a useless task when we do nothing with the data. Ortelius consumes the SBOM data and makes it actionable. By integrating Syft with Ortelius, you immediately begin putting the SBOM data to use, and making SBOMs the basis for viewing and acting upon your resulting security profile. 

## About Tracy Ragan

{{< figure src="/images/tracyraganzoom.jpg" width="300px" height="350px" >}}

Tracy is an open-source enthusiast and the Community Director for the Ortelius Open-Source Project. Tracy is the CEO of DeployHub, Inc. She has over 25 years of experience in managing the software life cycle from build through release. She is expert in software supply chain issues. She has served on the Governing Boards of the Eclipse Foundation, Continuous Delivery Foundation and the OpenSSF. Learn more about Tracy from her [LinkedIn Profile](https://www.linkedin.com/in/tracy-ragan-oms/).
