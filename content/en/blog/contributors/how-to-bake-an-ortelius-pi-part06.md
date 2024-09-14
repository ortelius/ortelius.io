---
date: 2024-08-10
title: "How to Bake an Ortelius Pi Part 6 | Cloud Dev At Home With Localstack"
linkTitle: "How to Bake an Ortelius Pi Part 6 | Cloud Dev At Home With Localstack"
author: Sacha Wharton
---

<!-- <div class="col-center">
<img src="/images/orteliuspi-part3.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p> -->

- [Introduction](#introduction)
- [Roadmap](#roadmap)
- [LocalStack](#localstack)
- [Conclusion](#conclusion)

### Introduction

In Part 5 we configured a certificate for our domain using Cloudflare, LetsEncrypt and Traefik. In Part 5 we will deploy [Jenkins](https://www.jenkins.io/) on our Kubernetes cluster and configure integration with [Ortelius](https://ortelius.io/) and [GitHub](https://github.com/). We will then build a demo application and have Ortelius record it.

### Roadmap

`localstack --> observability --> secret store --> zerotier --> everything else`

### LocalStack

Jenkins is an open-source automation server that helps developers build, test, and deploy their software reliably and efficiently. It's widely known for its role in continuous integration (CI) and continuous delivery (CD), allowing teams to automate tasks, improve workflows, and streamline software development pipelines.


### Conclusion

Hopefully you got this far and I did not forget some crucial configuration or step along the way. If I did please ping me so I can make any fixes. This illustrates how you can deploy LocalStack and publish the endpoints through Traefik.

Happy alien hunting.....