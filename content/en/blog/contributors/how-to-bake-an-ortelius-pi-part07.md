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
- [Gimlet GitOps Infrastructure](#gimlet-gitops-infrastructure)
  - [Localstack](#localstack)
  - [Deploy Localstack](#deploy-localstack)
  - [Helm-Repository | Loc](#helm-repository--loc)
  - [Helm-Release | Netdata](#helm-release--netdata)
  - [FYI | These are Helm Chart configuration snippets that you can modify to suit your environment](#fyi--these-are-helm-chart-configuration-snippets-that-you-can-modify-to-suit-your-environment)
  - [Fluxcd is doing the following under the hood | Localstack](#fluxcd-is-doing-the-following-under-the-hood--localstack)
  - [Kubernetes check | Localstack](#kubernetes-check--localstack)
- [Conclusion](#conclusion)

### Introduction

In Part 6 we deployed [LocalStack](https://www.localstack.cloud/) and exposed the endpoints through [Traefik](https://traefik.io/). We used the AWS cli and the Localstack wrapper `awslocal` to create and list S3 buckets and used [Granted](https://www.granted.dev/) to configure our profiles.

### Gimlet GitOps Infrastructure


#### Localstack

In today's cloud-centric world, developing and testing applications that rely on cloud services often presents unique challenges. Developers typically need access to various cloud environments like AWS to test their code. However, setting up and managing these cloud environments can be cumbersome, costly, and time-consuming, especially for frequent testing or when multiple cloud services are involved.

Enter LocalStack, a powerful tool that provides a fully functional local cloud environment. LocalStack emulates the core AWS services, such as S3, Lambda, DynamoDB, and many others, enabling developers to run and test their cloud applications directly on their local machines without needing an active AWS account or network access.

#### Deploy Netdata

Right lets get stuck in and deploy Localtack using Gimlet, Fluxcd, Helm and a sprig of GitOps.

- Kubectl quick reference guide [here](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- Helm cheat sheet [here](https://helm.sh/docs/intro/cheatsheet/)

#### Helm-Repository | Loc

- Lets add the Netdata Helm repository
- A Helm repository is a collection of Helm charts that are made available for download and installation
- Helm repositories serve as centralised locations where Helm charts can be stored, shared, and managed
- Create a file called `netdata.yaml` in the helm-repositories directory and paste the following YAML

```yaml
---
apiVersion: source.toolkit.fluxcd.io/v1beta1
kind: HelmRepository
metadata:
  name: netdata
  namespace: infrastructure
spec:
  interval: 60m
  url: https://localstack.github.io/helm-charts
```

#### Helm-Release | Netdata

- Lets create a Helm release for LocalStack
- A Helm release is an instance of a Helm chart running in a Kubernetes cluster
- Each release is a deployment of a particular version of a chart with a specific configuration
- Create a file called `netdata.yaml` in the helm-releases directory and paste the following YAML

#### FYI | These are Helm Chart configuration snippets that you can modify to suit your environment

```yaml

```

```yaml

```

```yaml

```

```yaml

```

```yaml

```

```yaml

```

```yaml
---
apiVersion: helm.toolkit.fluxcd.io/v2beta2
kind: HelmRelease
metadata:
  name: netdata
  namespace: infrastructure
spec:
  interval: 60m
  releaseName: netdata
  chart:
    spec:
      chart: netdata
      version: 0.6.16 # Simply change the version to upgrade
      sourceRef:
        kind: HelmRepository
        name: netdata
      interval: 10m
  values:

```

- Lets git it

```shell
git add .
git commit -m "localstack deploy"
git push
```

#### Fluxcd is doing the following under the hood | Localstack

- Helm repo add

```shell
helm repo add localstack-charts https://localstack.github.io/helm-charts --force-update
```

- Helm install localstack

```shell
helm install localstack localstack-charts/localstack
```

#### Kubernetes check | Localstack

- Kubectl switch to the infrastructure namespace

```shell
kubectl config set-context --current --namespace=infrastructure
```

- Kubectl show me the pods for Localstack

```shell
kubectl get pods -n infrastructure | grep localstack
```

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part06/01-localstack-pods.png" alt="localstack pods"/>
</div>
<p></p>

- Now that we have deployed Localstack we will move to expose the Localstack endpoints with Traefik

### Conclusion

You now have a local working cloud to develop against, test applications and learn safely. If I missed any steps or something needs correction please ping me so I can make any fixes. This illustrates how you can deploy LocalStack and publish the endpoint through Traefik.

Happy alien hunting.....

<!-- ### Next Steps

[How to Bake an Ortelius Pi | Part 4 | Cloudflare, Certificates and Traefik](https://ortelius.io/blog/2024/08/10/how-to-bake-an-ortelius-pi-part-4-Cloudflare-Certificates-and-Traefik/) -->

{{< blocks/section color=white >}}

<h2 class="text-left">Meet the Author</h2>
<hr>

{{< blocks/feature_dual >}}

Learn More About:
- [Sacha Wharton](https://linktr.ee/sachawharton)

{{< /blocks/feature_dual >}}
{{< blocks/feature_dual >}}

<div style="position:relative;left:-60%">
<img src="/images/sacha.jpg" alt="Sachawharton" height="400px" width="400px" />
</div>

{{< /blocks/feature_dual >}}
{{< /blocks/section >}}
