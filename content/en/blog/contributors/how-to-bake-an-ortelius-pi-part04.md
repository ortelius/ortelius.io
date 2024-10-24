---
date: 2024-08-10
title: "How to Bake an Ortelius Pi Part 4 | Cloudflare Certificates and Traefik"
linkTitle: "How to Bake an Ortelius Pi Part 4 | Cloudflare Certificates and Traefik"
author: Sacha Wharton
---

<!-- <div class="col-center">
<img src="/images/orteliuspi-part3.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p> -->

- [Introduction](#introduction)
- [Cloudflare | Connectivity Cloud](#cloudflare--connectivity-cloud)
  - [Buying a domain name](#buying-a-domain-name)
  - [SSL/TLS](#ssltls)
- [Gimlet GitOps Infrastructure](#gimlet-gitops-infrastructure)
  - [Traefik](#traefik)
  - [Helm-Release | Traefik](#helm-release--traefik)
  - [Manifest Folder | Traefik](#manifest-folder--traefik)
  - [Ortelius HTTPS](#ortelius-https)
  - [Argocd HTTPS](#argocd-https)
- [Conclusion](#conclusion)
- [Next Steps](#next-steps)

### Introduction

In [part 3](https://ortelius.io/blog/2024/08/08/how-to-bake-an-ortelius-pi-part-3-the-gitops-configuration/), of this series we used the [GitOps Methodology](https://opengitops.dev/) to deploy the [Cert Manager](https://cert-manager.io/), [NFS CSI Driver](https://github.com/kubernetes-csi/csi-driver-nfs) for Kubernetes to connect to the Synology NAS for centralised dynamic volume storage, [Metallb Load Balancer](https://metallb.universe.tf/), [Traefik Proxy](https://traefik.io/) as the entrypoint for our Microservices and [Ortelius](https://ortelius.io/) the ultimate evidence store using [Gimlet](https://gimlet.io/) as the UI to our GitOps controller [Fluxcd](https://fluxcd.io/).

In part 4 we will setup [Cloudflare](https://www.cloudflare.com/en-gb/), [LetsEncrypt](https://letsencrypt.org/) and [Traefik](https://traefik.io) to secure incoming requests with certificates.

### Cloudflare | Connectivity Cloud

You might know Cloudflare as a CDN but its so much more than that. Cloudflare is packed with amazing features and security offerings which are just to many to cover in this blog.

- [Cloudflare](https://www.cloudflare.com)
- [Documentation](https://developers.cloudflare.com/)
- [Learning Centre](https://www.cloudflare.com/en-gb/learning/)
- [Free Plan](https://www.cloudflare.com/plans/free/)

Cloudflare have kindly provided a free plan which we will use, so the first thing you need to do is set up an account for yourself or if you have an account login.

#### Buying a domain name

- Now we need a DNS domain so if you don't have one you will need to buy one which you can do through Cloudflare.
- Click on `Websites`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/01-cf-websites-button.png" alt="cf websites button"/>
</div>
<p></p>

- Click on `Add a site`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/02-cf-add-site-button.png" alt="cf add site button"/>
</div>
<p></p>

- Click on `register a new domain`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/03-cf-register-new-domain.png" alt="cf register new domain"/>
</div>
<p></p>

- Click in the `Search for a domain name` box and find a domain

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/04-cf-search-domain.png" alt="cf search domain"/>
</div>
<p></p>

- Cloudflare will tell you if your domain is available. Unfortunately my cats name `mottles.com` was not available. She will not be impressed
- Pick your domain and brandish your credit card

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/05-cf-mottles-domain.png" alt="cf mottles domain"/>
</div>
<p></p>

- At the end of the process when you get back to `Websites` you should see your new domain registered
- Here you can see my domain `pangarabbit.com`
- Click on our new domain and head over to `DNS`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/06-cf-new-domain.png" alt="cf new domain"/>
</div>
<p></p>

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/07-cf-dns-button.png" alt="cf dns domain"/>
</div>
<p></p>

- You should have 2 DNS A records like below | `* is for wildcard` and the domain apex `pangarabbit.com`
- The domain apex record should be there but you might have to add the wildcard if memory serves me correctly

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/08-cf-a-records.png" alt="cf a records"/>
</div>
<p></p>

#### SSL/TLS

- Lets head over to `SSL/TLS` now

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/09-cf-ssl-tls-button.png" alt="cf ssl tls button"/>
</div>
<p></p>

- You will be faced with the following screen and you want to have `Full (strict)` enabled

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/10-cf-ssl-tls.png" alt="cf ssl tls"/>
</div>
<p></p>

- Below are some caveats to take note of which are taken from that little `Help` button

Why isn’t my site working over HTTPS?

Certificate provisioning typically takes around 15 minutes for paid plans and up to 24 hours for Free plans. Contact support if you do not have a certificate after that time. If the certificate is already “active” under the Edge Certificates tab, but you still cannot access your site over HTTPS, refer to the [troubleshooting documentation](https://developers.cloudflare.com/ssl/troubleshooting/).
What encryption mode should I use?

Cloudflare strongly recommends using Full or Full (strict) modes to prevent malicious connections to your origin. For details on each available mode, refer to the [encryption modes documentation](https://developers.cloudflare.com/ssl/origin-configuration/ssl-modes/).

- I turned this on

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/11-cf-ssl-tls-recommender.png" alt="cf ssl tls recommender"/>
</div>
<p></p>

- Clicking on `Edge Certificates` you will see that the kind folks at Cloudflare have provided you with a certificate for free also known as `Universal SSL`

<strong>Attention:</strong> Let's Encrypt's chain of trust will be changing on September 2024. Universal SSL certificates will be automatically switched to a more compatible certificate authority. Review our [documentation](https://developers.cloudflare.com/ssl/reference/migration-guides/lets-encrypt-chain/#lets-encrypt-chain-update) for details and to understand the impacts on other certificate types.

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/12-cf-edge-certificates-button.png" alt="cf edge certificates button"/>
</div>
<p></p>

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/13-cf-edge-certificates.png" alt="cf edge certificates"/>
</div>
<p></p>

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/14-cf-edge-certificates-note.png" alt="cf edge certificates note"/>
</div>
<p></p>

- Enable `Always Use HTTPS`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/15-cf-edge-certificates-https.png" alt="cf edge certificates https"/>
</div>
<p></p>

- I set `Minimum TLS Version` to `TLS 1.3` for the best security

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/19-cf-edge-certificates-tls-version.png" alt="cf edge certificates tls version"/>
</div>
<p></p>

- I enabled `Opportunistic Encryption`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/16-cf-edge-certificates-encryption.png" alt="cf edge certificates encryption"/>
</div>
<p></p>

- I turned on `TLS 1.3` for the best security

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/17-cf-edge-certificates-tls-1-3.png" alt="cf edge certificates tls 1.3 encryption"/>
</div>
<p></p>

- I turned on `Automatic HTTPS Rewrites`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/18-cf-edge-certificates-https-rewrites.png" alt="cf edge certificates https rewrites"/>
</div>
<p></p>

Great we should have a functional certificate which will be auto renewed and we can use Traefik as the single point of entry for secure connections.

### Gimlet GitOps Infrastructure

#### Traefik

- [Traefik Helm Chart Examples](https://github.com/traefik/traefik-helm-chart/blob/master/EXAMPLES.md)
- [Traefik and LetsEncrypt](https://doc.traefik.io/traefik/https/acme/)

#### Helm-Release | Traefik

- Lets go back to our Traefik Helm Release and make some amendments
- Edit `traefik.yaml` in the `helm-releases` directory `gitops-<your name>-infra` which was created by Gimlet and Fluxcd with the following changes

#### Manifest Folder | Traefik

- The folks at Traefik put this nice piece of logic in the Helm Chart that allows you to create a config file which is dynamically monitored by Traefik
- I am using this to manage the Lets Encrypt certicate renewal in conjunction with Cloudflare
- Its time to `ENABLE` the certificate logic in `/manifests/traefik-dynamic-config.yaml` and `git push` and allow Flux to handle the deployment

```yaml
      file:
        # -- Create a file provider
        enabled: true
        # -- Allows Traefik to automatically watch for file changes
        watch: true
        # -- File content (YAML format, go template supported) (see https://doc.traefik.io/traefik/providers/file/)
        # content:
        providers:
          file:
            directory: /manifests/traefik-dynamic-config.yaml
```

- The logic in the `traefik-dynamic-config.yaml` would have created a `secret` with your Cloudflare API token and a `Issuer` for your certificate using `Certificate Manager`

- Run the following to see your created certificate

```shell
kubectl get certificates -owide -n infrastructure
```

- Mine is called `wildcard-pangarabbit-com` but we are are interested in the `SECRET`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/20-k8s-certificate.png" alt="k8s certificate"/>
</div>
<p></p>

- Below I am showing the `ingressRoute` for the dashboard and you can see I only have `websecure` enabled now
- I have added the `tls` configuration which matches `SECRET` as in the above image

```yaml
    ingressRoute:
      dashboard:
        # -- Create an IngressRoute for the dashboard
        enabled: true
        # -- Additional ingressRoute annotations (e.g. for kubernetes.io/ingress.class)
        annotations: {}
        # -- Additional ingressRoute labels (e.g. for filtering IngressRoute by custom labels)
        labels: {}
        # -- The router match rule used for the dashboard ingressRoute
        matchRule: Host(`traefik.pangarabbit.com`) #PathPrefix(`/dashboard`) || PathPrefix(`/api`)
        # -- Specify the allowed entrypoints to use for the dashboard ingress route, (e.g. traefik, web, websecure).
        # By default, it's using traefik entrypoint, which is not exposed.
        # /!\ Do not expose your dashboard without any protection over the internet /!\
        entryPoints: ["websecure"]
        # -- Additional ingressRoute middlewares (e.g. for authentication)
        middlewares: []
        # -- TLS options (e.g. secret containing certificate)
        tls:
          default:
            defaultCertificate:
              secretName: wildcard-pangarabbit-com-tls
      healthcheck:
        # -- Create an IngressRoute for the healthcheck probe
        enabled: false
        # -- Additional ingressRoute annotations (e.g. for kubernetes.io/ingress.class)
        annotations: {}
        # -- Additional ingressRoute labels (e.g. for filtering IngressRoute by custom labels)
        labels: {}
        # -- The router match rule used for the healthcheck ingressRoute
        matchRule: PathPrefix(`/ping`)
        # -- Specify the allowed entrypoints to use for the healthcheck ingress route, (e.g. traefik, web, websecure).
        # By default, it's using traefik entrypoint, which is not exposed.
        entryPoints: ["traefik"]
        # -- Additional ingressRoute middlewares (e.g. for authentication)
        middlewares: []
        # -- TLS options (e.g. secret containing certificate)
        tls: {}
```

- To enable the certificate for all the workloads behind Traefik you need to change the following in your `Helm Release` and make your certifcate the default

```yaml
    # -- TLS Store are created as [TLSStore CRDs](https://doc.traefik.io/traefik/https/tls/#default-certificate). This is useful if you want to set a default certificate. See EXAMPLE.md for details.
    tlsStore:
      default:
        defaultCertificate:
          secretName: wildcard-pangarabbit-com-tls
```

- In the following image we can see that our services have green shields to indicate that they are configured with `TLS`
- To access the Traefik dashboard the URL is `traefik.pangarabbit.com` (Access your dashboard at your domain name)

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part04/21-traefik-services-tls.png" alt="traefik services tls"/>
</div>
<p></p>

All we have done now is secure the Traefik dashboard but how would we do it for other workloads. Lets look at a few examples.

#### Ortelius HTTPS

- For Ortelius we had to use the `k3d` type to make it Traefik aware
- Now when requests arrive at Traefiks front door Traefik is aware of Ortelius and can send requests to `ms-nginx` microservice and gain access to the Ortelius backend

```yaml
    ms-nginx:
      ingress:
        type: k3d # --set ms-nginx.ingress.type=k3d`
                  # This setting is for enabling the Traefik Class so that Traefik is made aware of Ortelius
                  # K3d https://k3d.io/v5.6.0/ is a lightweight Kubernetes deployment which uses Traefik as the default
        dnsname: ortelius.pangarabbit.com # --set ms-nginx.ingress.dnsname=<your domain name goes here>
                                          # The URL that will go in your browser to access the Ortelius frontend
```

#### Argocd HTTPS

- For Argocd I had to edit the `ingressClassName` to make it Traefik aware and also enable `TLS`

```yaml
      # Argo CD server ingress configuration
      ingress:
        # -- Enable an ingress resource for the Argo CD server
        enabled: true
        # -- Specific implementation for ingress controller. One of `generic`, `aws` or `gke`
        ## Additional configuration might be required in related configuration sections
        controller: generic
        # -- Additional ingress labels
        labels: {}
        # -- Additional ingress annotations
        ## Ref: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
        annotations:
          {}
          # nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
          # nginx.ingress.kubernetes.io/ssl-passthrough: "true"

        # -- Defines which ingress controller will implement the resource
        ingressClassName: "traefik"

        # -- Argo CD server hostname
        # @default -- `""` (defaults to global.domain)
        hostname: "argocd.pangarabbit.com"

        # -- The path to Argo CD server
        path: /

        # -- Ingress path type. One of `Exact`, `Prefix` or `ImplementationSpecific`
        pathType: Prefix

        # -- Enable TLS configuration for the hostname defined at `server.ingress.hostname`
        ## TLS certificate will be retrieved from a TLS secret `argocd-server-tls`
        ## You can create this secret via `certificate` or `certificateSecret` option
        tls: true
```

**FYI make sure you backup your persistent volumes on the NFS server**

### Conclusion

In Part 4 we configured a certificate for our domain using Cloudflare, LetsEncrypt and Traefik. From my experience the crucial configuration change for any workloads to access the frontend securely was to enable the `ingress`, `TLS` and to change the `ingressClassName` to `traefik` in the Helm Release values.

Happy alien hunting.......

### Next Steps

[How to Bake an Ortelius Pi | Part 5 | Ortelius Marries Jenkins](https://ortelius.io/blog/2024/10/22/how-to-bake-an-ortelius-pi-part-5-ortelius-marries-jenkins/)

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
