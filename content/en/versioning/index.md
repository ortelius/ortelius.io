---
title: Microservice Versioning
description: Ortelius versioning features.
summary: Microservice Versioning
type: contributor
---

{{< blocks/section color=primary >}}
<div class="col-12">
<h1 class="text-center">Versioning and Tracking Microservices</h1>
<hr>

## Microservice Versioning and the Application Package

As we move into a microservice architecture, it is important to see a new use of versioning. In our monolithic days, it was important to version source code so we understood what version of the code was compiled/linked into our builds. Microservices are the new code. A deployment of a microservice is our new 'compile/link' step. For this reason, microservice versioning is critical.

In a microservice architecture linking is done dynamically at the dev, test and prod runtime environments. But as the saying goes, "the more things change, the more things stay the same." While your application is a collection of loosely coupled microservices, it is still an application that needs to be managed as a package with versions that you are delivering to your customers.

#### Microservice Impact on Applications

Each time a microservice is updated, it impacts a consuming 'logical' application. This means that both the microservice and all of the consuming applications have a new release number. In our monolithic world, we would use the build number to version the release candidate. Ortelius uses versioning to add back this level of 'logical' application versioning any time a change creates an impact.

As microservices become more of the norm, developers will begin to share and reuse microservices across company silos. This sharing will create more microservice dependencies between teams. While this adds to the complexity of a microservice architecture, it also creates a more stable environment by reducing redundant code, and minimizing microservice sprawl. 

The use of versioning at the microservice and application package level addresses the complexity and keeps everyone informed of service usage across many teams. 

<div class="col-center">
<img src="/images/applicationpackaging.jpg" alt="application package" />
<p>A logical application package</p>
</div>

#### Automated Versioning

Ortelius integrates into your CD Pipeline to automate the versioning of your services. Ortelius is called at the point in time a new container has been registered. Ortelius grabs the new container data, such as the tag, and creates a new version of the service. This in turn creates new versions of all consuming 'logical' applications. No manual work required. 

#### Microservice Software Supply Chain

As your 'logical' application changes, Ortelius tracks the applications Software Bill of Material (SBOM). This shows the precise version of each microservice the application is consuming. This level of data is critical when you have a vulnerability in a particular service, but do not have the knowledge of where it is used. 

Additionally, when an end user reports an issue, Ortelius can provide a difference report that shows what was updated, even when the application team was not aware of the change.  

<div class="col-center">
<img src="/images/dependencymap.jpg" alt="Bill of Material" />
<p>Application Dependency Map</p>
</div>

<div class="col-center">
<img src="/images/LastDeploymentDifference.jpg" alt="Difference Map" />
<p>Application Difference Report based on Cluster</p>
</div>

<div class="col-center">
<img src="/images/impact.jpg" alt="Impact Analysis" />
<p>Microservice Application Impact Analysis</p>
</div>

## Conclusion

In a cloud native world, where microservices are consumed by different application teams, the need for versioning and tracking becomes critical. Seeing where microservices are being used is essential in understanding your overall microservice supply chain. 

{{< /blocks/section >}}