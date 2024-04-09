---
date: 2024-02-29
title: "2024 Ortelius Non-functional Requirements"
linkTitle: "2024 Ortelius Non-functional Requirements"
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

First, let us start with the Ortelius Architecture. For a complete description, review the [Ortelius 2023 Architecture design.](https://ortelius.io/blog/2023/03/21/the-2023-ortelius-architecture/)

### Web Front-end, DB Back-end, CLI, and Blockchain
The Web front-end is where the end user will interact to persist and consume the data stored in the back-end databases. The user can create, retrieve, and update the data using the front end. However, deleting data is impossible since the blockchain ledger keeps all transactions. Therefore, the end user will use an Archived Tag to delete data, which hides the old data.

The front end will send data to the NGINX reverse proxy using HTTPS with a JSON payload. The NGINX reverse proxy will route the transaction to the appropriate back-end microservice based on the end-point URL.   The microservice then normalizes the JSON to prevent redundant data from being stored in the database. Next, the microservice calls the database abstraction handler Python function to persist the data in Arango, NFT Storage, and XRPL. Finally, a Push-Through Cache is used to handle the slowness of NFT Storage and provide fast responses back to the end user. 

The Ortelius CLI is where end users will hook in Ortelius into the CI/CD pipeline. The Ortelius CLI is used to persist data from the pipeline into the Ortelius database. The CLI uses the same steps as the front end for persisting data.

The front end will send the request over HTTPS with appropriate parameters to the NGINX reverse proxy for retrieving data. The NGINX reverse proxy will route the transaction to the appropriate back-end microservice based on the end-point URL. Next, the microservice calls the database abstraction handler Python function to find the data in the Arango Cache. If the data is not found, the database abstraction handler will pull it from NFT Storage and XRPL, return it, and add it to the cache.

The database abstraction handler Python function encapsulates the database interaction enabling the replacement of XRPL and NFT Storage for an OCI-based registry.  The Arango database for searching and caching remains in place.

<h2 class="text-left">Ortelius Non-functional Requirements</h2>
<hr>

Understanding the basic architecture allows for a  definition of the non-functional criteria that define the operation of Ortelius rather than its specific behavior.

### Availability

Ortelius must be capable of functioning in two distinct deployment scenarios: locally on a developer's machine and self-hosted on internal infrastructure or a designated cloud provider. In both runtime environments, individuals are responsible for maintaining the desired level of availability. Ortelius is obligated to provide features facilitating scalability through the use of Kubernetes, Load Balancers, and Database clustering to meet specified uptime objectives. For instance, for a developer requiring minimal availability, Ortelius must support local deployment using Kubernetes within a Kind Cluster, incorporating a volume mount for database persistence. Conversely, for a production installation with a high availability mandate, Ortelius must support deployment on AWS Kubernetes, utilizing an AWS Load Balancer and a managed database to optimize performance and ensure uninterrupted service.

### Performance

Ortelius UI delivers responses within the expected timeframe of less than 5 seconds, meeting user expectations for typical website response times. While the Ortelius CLI may extend beyond 5 seconds due to the upload of substantial data from the CI/CD pipeline, it is structured to run concurrently with other pipeline steps, minimizing the overall completion time to less than 5 minutes. Even though Ortelius transactions are infrequent, involving substantial data, prioritize returning small result sets to users and promptly display a message if the transaction exceeds a 1-second response time.

### Scalability

Ortelius must ensure seamless scalability to accommodate a growing user base and increasing data volume, with the ability to dynamically scale the UI and database independently. The UI should scale horizontally using Kubernetes and Cloud Infrastructure, while the database should be scalable through the addition of database cluster resources. The system must efficiently handle unlimited disk storage, persisted indefinitely using NFT storage. Additionally, ArangoDB caching mechanisms should be optimized for high-performance, ensuring that frequently accessed data is efficiently cached, and data absent in the cache is seamlessly retrieved from NFT Storage without compromising system responsiveness.

### Reliability

Zero-downtime rolling updates: The system must support rolling updates without any service downtime. During updates, the cached data can be deleted and repopulated based on access from the NFT Storage. In the event of NFT Storage becoming inaccessible or delayed, a user-friendly error message should be displayed to inform users about the issue.

### Security

1. Unrestricted Data Browsing:
Ortelius ensures that all stored data is accessible without any restrictions through the Ortelius UI. Users can seamlessly browse all data, and accessibility is contingent on reaching the Ortelius UI using a web browser. Notably, Ortelius can be deployed on internal networks, allowing users within the network to have comprehensive access to all data. However, external users, who are unable to reach Ortelius UI due to network constraints, will not have access to the data. This approach provides flexibility, allowing tailored access based on the network environment in which Ortelius is deployed.

2. CLI Access Control:
The CLI (Command Line Interface) for Ortelius should restrict inserts and updates, allowing these operations only through the CLI. Additionally, the CLI should enforce the requirement of a valid TOKEN for any insert or update operation.

3. Token Generation and Account Creation:
Users must be required to create an account to generate a TOKEN for accessing the CLI of Ortelius. The account creation process should adhere to secure practices, including strong password policies and validation of user details.

4. Package Security:
Ortelius itself should be composed of packages that are free from vulnerabilities. The development process should include thorough security reviews to ensure that each package within Ortelius is secure and free from known vulnerabilities.

5. Vulnerability Reporting:
Ortelius should provide a list of vulnerabilities for each release, and this list should be accessible through Ortelius itself. The vulnerability list should be comprehensive, detailing any potential risks associated with each release.

6. Timely Vulnerability Fixes:
Ortelius should have a policy in place to fix any identified vulnerabilities within two days of discovery. If a vulnerability is not fixable within the designated two-day period, a prominent message should be displayed within Ortelius, notifying users about the exposure and potential risks.

7. User Notification:
Users should be promptly notified about the need to update Ortelius in case of any security patches or fixes. Notifications should be clear and include information on the nature of the vulnerabilities and the importance of updating to the latest version.

8. Security Documentation:
Comprehensive security documentation should be provided, including guidelines for secure deployment, configuration, and usage of Ortelius. Users should have access to up-to-date security documentation that reflects the latest security measures and best practices.

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