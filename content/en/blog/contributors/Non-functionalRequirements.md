---
date: 2024-02-28
title: "What are non-functional requirements and why do they matter?"
summary: What are non-functional requirements and why do they matter?
author: Kate Scarcella, Jing Chen and Tony Carrato
---

<div class="col-center">
<img src="/images/nonfunctionalblogbanner.png" alt="Non-functional requirements" height="483px" width="724px" />
</div>
<p></p>


In the modern DevSecOps world, we are often building the system (plane) as it is flying; at least that is the saying. The point of this adage is that we often build as we go and without any documentation, including making sure that we’ve thought through and are keeping track of our requirements. The IT industry is hardly new and there is a hope that we will be better at documenting, that includes diagrams to help us not only technically but also with purpose. We’re going to discuss this, with a focus on the Ortelius open source project.

<h2 class="text-left">Why Ortelius and what is the objective?</h2>
<hr>

The name for Ortelius came from a man who is known for creating the first Atlas, Abraham Ortelius. The name of the Atlas, Theatrum Orbis Terrarum (Theatre of the World), was published on May 20, 1570. His Atlas disrupted the way the world was seen. The Ortelius project is creating a console which will help users to see the vulnerabilities within software systems, and provide greater visibility into which components, usually libraries and microservices, are being used to an organization. Different business users will be provided different views, much like an Atlas that will give you an overall view, however, if you spin the globe around, you can be given a deeper dive to where you may want to go. 

A system’s architecture models the system’s elements, including what the system does, i.e. the functional requirements, and the qualities of service the system must provide (more on this next).
The system functions are typically where developers concentrate their efforts. For Ortelius, that includes being able to capture system build information from automated development pipeline
actions and providing different sorts of reporting and query capabilities.

<h2 class="text-left">Non-functional Requirements</h2>
<hr>

Non-functional requirements are all about the qualities of service for the system. These include:
- Usability
- Scalability
- Maintainability
- Performance and Availability.

Depending upon the system being designed, there can be several other non-functional requirements too. These are often not thought about very much by most developers, but they have a substantial impact on how users perceive a given system and how organizations think about bringing such a system into use. For example, is a system designed for use during the normal workday, in a single time zone, by a small number of users, maybe only one? Or is it meant to be used across a larger organization, in multiple locations across multiple time zones, with high availability to all those users? Accommodating expectations at both ends of that spectrum can result in very different design approaches. For Ortelius, that’s illustrated in these two diagrams:

<div class="col-center">
<img src="/images/nonfunctional1.png" alt="Ortelius Single User Instance"  />
</div>
<div style="text-align:center;width:100%;margin-top:10px">
<strong>Figure 1 A single user instance of Ortelius</strong>
</div>
<p></p>
<div class="col-center">
<img src="/images/nonfunctional2.png" alt="Ortelius muliple User Instance"  />
</div>
<div style="text-align:center;width:100%;margin-top:10px">
<strong>Figure 2 - A cloud-based Ortelius instance for multiple users</strong>
</div>
<p></p>


<h2 class="text-left">Requirements that Need to be Addressed</h2>
<hr>

In order to properly design a system, such as Ortelius, to support this range of deployment options, several requirements need to be addressed. _Note: This blog post doesn’t try to include the actual designs to meet these requirements._ This blog is about discussing what those requirements might be, so that developers and architects can consider them. 

- Availability: Just what is the expectation for uptime for Ortelius? In a large, multi-user and possibly multi-time zone case, what allowances need to be made to make sure that Ortelius can stay up as much as needed?
- Performance: How many queries per minute, from how many users, does Ortelius need to support, especially in a large installation? 
-  Scalability: How many records, for instances of use of a library or microservice, does Ortelius need to keep track of? And for how long? How should the Ortelius database be maintained, including how will it be trimmed of entries no longer relevant?
- Security: Will Ortelius fit into an external Identity &amp; Access Management (IAM) system and use the provided roles, from the IAM system, to manage access?
-  Reliability: What is the expected annual downtime required for maintenance? Additionally, how would Ortelius be restored after a major failure?


<h2 class="text-left">Conclusion</h2>
<hr>

This blog post is a starting point for a broader discussion. While functional requirements define a system's actions, non-functional requirements – like usability, scalability, maintainability,
performance, availability, security, and reliability – are what make those actions efficient, secure, and enjoyable for users across various environments. By incorporating these considerations into the design process early, we can save time, prevent costly rework, and ensure our products meet the demanding needs of the modern DevSecOps world. 

{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Authors</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Kate Scarcella](https://www.linkedin.com/in/katescarcellaconnected/)
- [Jing Chen](https://www.linkedin.com/in/jingchen-ku/) 
- [Tony Carrato](https://www.linkedin.com/in/tonycarrato/)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/tonyteam.png" alt="Meet the Speakers"  />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}




