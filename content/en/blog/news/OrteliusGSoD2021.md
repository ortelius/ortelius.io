---
date: 2021-03-24
title: "Ortelius Season of Docs Proposal"
summary: Ortelius Season of Docs Proposal
author: Owen Bowers Adams and Tracy Ragan
---

The following information is submitted by the Ortelius open-source community to be selected for the [Google Season of Docs](https://developers.google.com/season-of-docs/).

## Update Ortelius Documentation to Improve Adoption and Skills Development

Ortelius is a microservice management platform that versions and tracks microservices, their consuming applications, ownership, blast radius and where they have been deployed with all critical deployment metadata. By centralizing and tracking detailed configuration data, Ortelius provides you a proactive view of how your microservice architecture is changing overtime across all clusters. Ortelius is a new incubating project under the [Continuous Delivery Foundation](https://cd.foundation).

### The Ortelius Documentation Challenge

The existing Ortelius documentation has a substantial amount of content which works well for someone who has a deep technical understanding and simply needs the documentation for reference. The core problem with the documentation is that it is not usable for developing a skill set in Ortelius. The result is new users of Ortelius struggle with on-boarding and adoption of the solution.

The current documentation has a good structure, but much of the content is presented in isolation. In addition, there are gaps/weaknesses around clarity, completeness of information, and is generally ambiguous in terms of for whom the information is written. The result is documentation that is not always suitable for the intended audience. In particular, there is a bit too much assumed knowledge within the documentation which does not facilitate learning or improving the user's skill set. In order to improve the onboarding of Ortelius, this primary documentation issue must be addressed.

 Ortelius Documentation Repository - [https://github.com/ortelius/ortelius-docs](https://github.com/ortelius/ortelius-docs)

### Ortelius Project Scope - Persona Skill Set Development

The scope of the Ortelius Project for GSoD is to address specific areas related to on-boarding of new users in terms of their 'first hour.' We will seek a technical writer who can enhance the documentation to address the persona weakness described above. This will include identifying which personas are consuming the documentation, with a view of aligning documentation content accordingly.

To simplify the adoption of Ortelius, the technical writer will be tasked with documenting a clear beginner path with the deeper technical material being used as references. There is currently a starting point for this effort in the installation/getting started sections, but this information should be more prominent and framed within the larger context of what value Ortelius is providing.

By enhancing the documentation as a skill building reference, we can improve the end user experience from the first hour through full implementation. In addition, end users will be provided basic insights on how Ortelius solves core issues common in microservice management.

### Out of Scope for this Project

This project will NOT include adding new documentation for new features or expanding existing technical documentation around lower level subjects such as APIs, Actions or Plug-ins. These topics are too low level and are not needed for an End User's 'First hour' which is the focus of this project.

### Measuring Success of the Ortelius GSoD Project

1) Ease of onboarding - currently new users must rely on the Ortelius Community to get basic questions answered for their first hour or day of using Ortelius. We can measure the success of the documentation by an increase in adoption with a decrease in 'support' related questions.
2) Survey - We will survey the documentation quality/approachability through the Ortelius Community asking for feedback on the enhancements.

### Specific Technical Writer Statement of Work & Deliverables:

- <strong>Persona Selection</strong> - The Ortelius team has previously defined a set of user 'personas.' The technical writer will work with these personas to identify the precise consumers of the documentation.
- <strong>Core Documentation Updates</strong> - The focus of the documentation will be to improve upon the 'first hour' experience of the persona. This will involve updating the existing documentation to make the language more approachable, and the path through the documentation more clear. The precise sections of the documentation to be addressed will include:
    - [Welcome Section](https://docs.ortelius.io/guides/userguide/introduction/)
    - [Key Concepts](https://docs.ortelius.io/guides/userguide/concepts/)
    - [First Steps](https://docs.ortelius.io/guides/userguide/first-steps/)
- <strong>Two Tiers</strong> -The technical writer must create 'two tiers' of technical documentation with a clear relationship. The high level view and the technical reference view. The high level view would have more of a focus on where things sit in relation to the rest of Ortelius, as opposed to a more narrow explanation of just that concept.
- <strong>Mark Down - </strong> All technical documentation will be delivered in Mark Down language.
- <strong>Reorganization</strong> - If reorganization of the documentation is required, the technical writer will need to perform the reorganization work.

### Working with the Technical Writer

The Ortelius community will identify 3 members from the community to review the updated documentation to provide ongoing feedback if the goal - clarity for new end users - is are being achieved and provide course correction of needed.

### Budget Requirements

Based on the existing content, the following time estimates are assumed:

Budget Item | Amount | Running Total | Justification/Notes 
|---|---|---|---|
| Persona Selection | $300 | $300 | 
| Core Documentation Updates | $6,000 | $6,300 | Ortelius Doc team to provide ongoing feedback. |
| Two Tiers | $2,250 | $8,550 | Ortelius Doc team to provide ongoing feedback |
| Doc. Reorganization | $750| $9,300 | May not be required  - depends on the extensiveness of core updates.

<strong>Total Budget $9,300</strong>

### Additional Information
The Ortelius Team members have varied experience with developing technical content and working with technical writers. Tracy Ragan, project administrator, was the primary contributor of the existing technical documentation. In her work experience, she has hired technical writers to expand on and organize existing documentation for ease of use and readability. As part of the submittal for this project, a technical writer reviewed the existing Ortelius documentation and made specific recommendations for participation in GSoD.
