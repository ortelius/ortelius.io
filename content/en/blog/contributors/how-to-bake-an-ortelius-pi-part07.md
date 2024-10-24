---
date: 2024-10-22
title: "How to Bake an Ortelius Pi Part 7 | Observability with Netdata"
linkTitle: "How to Bake an Ortelius Pi Part 7 | Observability with Netdata"
author: Sacha Wharton
---

<!-- <div class="col-center">
<img src="/images/orteliuspi-part3.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p> -->

- [Introduction](#introduction)
- [Gimlet GitOps Infrastructure](#gimlet-gitops-infrastructure)
  - [Netdata](#netdata)
  - [Netdata Database Engine](#netdata-database-engine)
  - [Deploy Netdata](#deploy-netdata)
  - [Helm-Repository | Netdata](#helm-repository--netdata)
  - [Helm-Release | Netdata](#helm-release--netdata)
  - [Helm Chart Configuration Highlights](#helm-chart-configuration-highlights)
  - [Fluxcd is doing the following under the hood | Netdata](#fluxcd-is-doing-the-following-under-the-hood--netdata)
  - [Kubernetes check | Netdata](#kubernetes-check--netdata)
  - [How to add additional nodes in Netdata](#how-to-add-additional-nodes-in-netdata)
- [Conclusion](#conclusion)

### Introduction

In [part 6](https://ortelius.io/blog/2024/08/10/how-to-bake-an-ortelius-pi-part-6-cloud-dev-at-home-with-Netdata/) we deployed [Localstack](https://www.localstack.cloud/) and exposed the endpoints through [Traefik](https://traefik.io/). We used the AWS cli and the Localstack wrapper `awslocal` to create and list S3 buckets and used [Granted](https://www.granted.dev/) to configure our profiles.

In part 7 we will deploy [Netdata](https://www.netdata.cloud/) as our Observability solution of choice. Netdata for me is like having your Observability multilayered cake and eating it. Why did I go with Netdata? I will list a few points as follows:

- With Netdata I don't have to learn a whole new language just to get the metrics, graphs and visuals I need to have visibility into my Cloud environment
- I get instant metrics and graphs straight out of the box all in `real-time` (yes real real-time, every second for every metric) at the click of a button
- Rapid time to value
- Alerts and Ai for troubleshooting
- Netdata is super lightweight - Its running on 3 Pi 4B's, 3 Pi 5's and a old Synology NAS as the centralised storage. That speaks lightweight to me
- Netdata has a very generous [free tier](https://www.netdata.cloud/pricing/) which I used for a while before signing up for the `Homelab` option
- None of my data is ever stored at Netdata
- No insane egress, scalability, storage data costs from a cloud provider

### Gimlet GitOps Infrastructure

#### Netdata

- [Learn Netdata](https://learn.netdata.cloud/)
- [Netdata Academy](https://www.netdata.cloud/academy/)
- [Netdata Docs](https://learn.netdata.cloud/docs/deployment-guides)
- [Netdata Integrations](https://www.netdata.cloud/integrations/data-collection/)
- [Netdata Agents](https://learn.netdata.cloud/docs/netdata-agent/)
- [Netdata Daemon Configuration](https://learn.netdata.cloud/docs/netdata-agent/configuration/daemon-configuration#global-section-options)
- [Netdata Organize Systems, Metrics and Alerts](https://learn.netdata.cloud/docs/netdata-agent/configuration/organize-systems-metrics-and-alerts)
- [Netdata ML Models and Anomaly Detection](https://learn.netdata.cloud/docs/machine-learning-and-anomaly-detection/ml-models-and-anomaly-detection)
- [Best Practices for DevOps](https://www.netdata.cloud/academy/devops-playbook-best-practices-for-success/)
- [Infrastructure Monitoring with Netdata Cloud](https://youtu.be/KxmL7qUe6nU)
- [Netdata Database Engine](https://github.com/netdata/netdata/tree/master/src/database/engine#readme)
- [Netdata Helm Chart](https://github.com/netdata/helmchart)
- [Install Netdata on Kubernetes](https://learn.netdata.cloud/docs/netdata-agent/installation/kubernetes)
- [Netdata Helm Chart for Kubernetes Deployments](https://learn.netdata.cloud/docs/netdata-agent/installation/kubernetes-helm-chart-reference)

#### Netdata Database Engine

<div class="col-left">
<img src="https://user-images.githubusercontent.com/2662304/233838474-d4f8f0b9-61dc-4409-a708-97d403cd153a.png" alt="netdata database engine"/>
</div>
<p></p>

#### Deploy Netdata

Right lets get stuck in and deploy Netdata using Gimlet, Fluxcd, Helm and a sprig of GitOps.

- Kubectl quick reference guide [here](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- Helm cheat sheet [here](https://helm.sh/docs/intro/cheatsheet/)

#### Helm-Repository | Netdata

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
  url: https://netdata.github.io/helmchart/
```

#### Helm-Release | Netdata

- Lets create a Helm release for Netdata
- A Helm release is an instance of a Helm chart running in a Kubernetes cluster
- Each release is a deployment of a particular version of a chart with a specific configuration
- Create a file called `netdata.yaml` in the helm-releases directory and paste the following YAML

#### Helm Chart Configuration Highlights

```yaml
ingress:
  enabled: true
  annotations:
    # kubernetes.io/ingress.class: traefik
    kubernetes.io/tls-acme: "true"
  path: /
  pathType: Prefix
  hosts:
    - netdata.pangarabbit.com
  ## whole spec is going to be included into ingress spec.
  ## if you intend to use ingressClassName declaration, remove ingress.class from annotations
  spec:
    ingressClassName: traefik
  # tls:
  #   - secretName: wilcard-pangarabbit-com-tls
  #     hosts:
  #       - netdata.pangarabbit.com
```

```yaml
# parent
database:
  persistence: true
  ## Set '-' as the storageclass to get a volume from the default storage class.
  ## Comment out one of the storage classes as you can only have one
  ## Using the NFS CSI Driver
  storageclass: "nfs-csi-netdata" # Add your storage class here
  ## Using the Hostpath Storage
  storageclass: "pi8s-nfs-netdata" # Add your storage class here
  volumesize: 5Gi
alarms:
  persistence: true
  ## Set '-' as the storageclass to get a volume from the default storage class.
  ## Comment out one of the storage classes as you can only have one
  ## Using the NFS CSI Driver
  storageclass: "nfs-csi-netdata" # Add your storage class here
  ## Using the Hostpath Storage
  storageclass: "pi8s-nfs-netdata" # Add your storage class here
  volumesize: 1Gi
```

```yaml
# k8s state
persistence:
  enabled: true
  ## Set '-' as the storageclass to get a volume from the default storage class.
  ## Comment out one of the storage classes as you can only have one
  ## Using the NFS CSI Driver
  storageclass: "nfs-csi-netdata" # Add your storage class here
  ## Using the Hostpath Storage
  storageclass: "pi8s-nfs-netdata" # Add your storage class here
  volumesize: 1Gi
```

```yaml
# enabling anomaly detection with machine learning for parent and child
configs:
  netdata:
    enabled: true
    path: /etc/netdata/netdata.conf
    data: |
      [ml]
        enabled = yes
```

```yaml
# claiming your room with the netdata agent for parent and child
 claiming:
   enabled: true
   token: "" # Replace with your token
   rooms: "" # Replace with your room id
   url: "https://api.netdata.cloud"
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
      version: 3.7.107
      sourceRef:
        kind: HelmRepository
        name: netdata
      interval: 10m
  values:
    valuesObject:
      replicaCount: 3
      deploymentStrategy:
        type: Recreate

      imagePullSecrets: []

      image:
        repository: netdata/netdata
        tag: "{{ .Chart.AppVersion }}"
        pullPolicy: Always

      sd:
        image:
          repository: netdata/agent-sd
          tag: v0.2.9
          pullPolicy: Always
        child:
          enabled: true
          configmap:
            name: netdata-child-sd-config-map
            key: config.yml
            # if 'from' is {} the ConfigMap is not generated
            from:
              file: sdconfig/child.yml
              value: {}
          resources:
            limits:
              cpu: 50m
              memory: 150Mi
            requests:
              cpu: 50m
              memory: 100Mi

      initContainersImage:
        repository: alpine
        tag: latest
        pullPolicy: Always

      sysctlInitContainer:
        enabled: false
        command: []
        resources: {}

      service:
        type: ClusterIP
        port: 19999
        annotations: {}
        ## Only to be used with type LoadBalancer
        # loadBalancerIP: 10.0.1.69
        # loadBalancerSourceRanges: []
        # externalTrafficPolicy: Local
        ## Only to be used with type LoadBalancer and external traffic policy Local
        # healthCheckNodePort:
        ## Only to be used with type ClusterIP
        # clusterIP: 10.1.2.3

      ingress:
        enabled: true
        annotations:
          # kubernetes.io/ingress.class: traefik
          kubernetes.io/tls-acme: "true"
        path: /
        pathType: Prefix
        hosts:
          - netdata.pangarabbit.com
        ## whole spec is going to be included into ingress spec.
        ## if you intend to use ingressClassName declaration, remove ingress.class from annotations
        spec:
          ingressClassName: traefik
        # tls:
        #   - secretName: wilcard-pangarabbit-com-tls
        #     hosts:
        #       - netdata.pangarabbit.com

      rbac:
        create: true
        pspEnabled: true

      serviceAccount:
        create: true
        name: netdata

      restarter:
        enabled: true
        schedule: "00 06 * * *"
        image:
          repository: bitnami/kubectl
          tag: 1.25
          pullPolicy: Always
        restartPolicy: Never
        resources:
          {}
          # limits:
          #  cpu: 500m
          #  memory: 64Mi
          # requests:
          #  cpu: 250m
        #  memory: 32Mi
        concurrencyPolicy: Forbid
        startingDeadlineSeconds: 60
        successfulJobsHistoryLimit: 3
        failedJobsHistoryLimit: 3

      notifications:
        slack:
          webhook_url: ""
          recipient: ""

      parent:
        enabled: true
        port: 19999
        resources:
          {}
          # limits:
          #  cpu: 4
          #  memory: 4096Mi
          # requests:
          #  cpu: 4
          #  memory: 4096Mi

        livenessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1
        readinessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1

        terminationGracePeriodSeconds: 300

        nodeSelector: {}

        tolerations: []

        affinity: {}

        priorityClassName: ""

        env:
          {}
          ## To disable anonymous statistics:
          # DO_NOT_TRACK: 1

        envFrom:
          #[]
          ## E.g. to read Netdata Cloud claim token from an existing secret "netdata" set this to:
          # - secretRef:
          #     name: netdata
          ## And create it with: kubectl create secret generic netdata --from-literal="NETDATA_CLAIM_TOKEN=<token>"
          ## Also ensure that claim.token is empty
          #- secretRef:
          #    name: smbcreds
        podLabels: {}

        podAnnotations: {}

        dnsPolicy: Default

        database:
          persistence: true
          ## Set '-' as the storageclass to get a volume from the default storage class.
          storageclass: "pi8s-nfs-netdata"
          volumesize: 5Gi

        alarms:
          persistence: true
          ## Set '-' as the storageclass to get a volume from the default storage class.
          storageclass: "pi8s-nfs-netdata"
          volumesize: 1Gi

        configs:
          netdata:
            enabled: true
            path: /etc/netdata/netdata.conf
            data: |
              [global]
                hostname = netdata-parent
              [db]
                mode = dbengine
              [plugins]
                cgroups = no
                tc = no
                enable running new plugins = no
                check for new plugins every = 72000
                python.d = no
                charts.d = no
                go.d = no
                node.d = no
                apps = no
                proc = no
                idlejitter = no
                diskspace = no
          stream:
            enabled: true
            path: /etc/netdata/stream.conf
            data: |
              [11111111-2222-3333-4444-555555555555]
                enabled = yes
                history = 3600
                default memory mode = dbengine
                health enabled by default = auto
                allow from = *
          health:
            enabled: true
            path: /etc/netdata/health_alarm_notify.conf
            data: |
              SEND_EMAIL="NO"
              SEND_SLACK="YES"
              SLACK_WEBHOOK_URL="{{ .Values.notifications.slack.webhook_url }}"
              DEFAULT_RECIPIENT_SLACK="{{ .Values.notifications.slack.recipient }}"
          exporting:
            enabled: false
            path: /etc/netdata/exporting.conf
            data: ""
          example:
            enabled: false
            path: /etc/netdata/health.d/example.conf
            data: |
              alarm: example_alarm1
                on: example.random
              every: 2s
              warn: $random1 > (($status >= $WARNING)  ? (70) : (80))
              crit: $random1 > (($status == $CRITICAL) ? (80) : (90))
              info: random
                to: sysadmin

        claiming:
          enabled: true
          token: "" # Replace with your token
          rooms: "" # Replace with your room id
          url: "https://api.netdata.cloud"

        extraVolumeMounts: []
          #- name: pi8s-netdata-volume
          #  mountPath: "/mnt/pi8s"
          #  readOnly: false
          #  mountPropagation: HostToContainer

        extraVolumes: []
          # - name: pi8s-netdata-volume
          #   persistentVolumeClaim:
          #     claimName: pi8s-netdata-pvc

      child:
        enabled: true
        port: "{{ .Values.parent.port }}"
        updateStrategy:
          {}
          # type: RollingUpdate
          # rollingUpdate:
          #   maxUnavailable: 1

        resources:
          {}
          # limits:
          #  cpu: 4
          #  memory: 4096Mi
          # requests:
          #  cpu: 4
          #  memory: 4096Mi

        livenessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1
        readinessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1

        terminationGracePeriodSeconds: 30

        nodeSelector: {}

        tolerations:
          - operator: Exists
            effect: NoSchedule

        affinity: {}

        priorityClassName: ""

        podLabels: {}

        podAnnotationAppArmor:
          enabled: true

        podAnnotations: {}

        hostNetwork: true

        dnsPolicy: ClusterFirstWithHostNet

        persistence:
          enabled: true
          hostPath: /var/lib/netdata-k8s-child

        podsMetadata:
          useKubelet: false
          kubeletUrl: "https://localhost:10250"

        configs:
          netdata:
            enabled: true
            path: /etc/netdata/netdata.conf
            data: |
              [db]
                mode = ram
              [health]
                enabled = yes
              [ml]
                enabled = yes
                # maximum num samples to train = 21600
                # minimum num samples to train = 900
                # train every = 3h
                # number of models per dimension = 18
                # dbengine anomaly rate every = 30
                # num samples to diff = 1
                # num samples to smooth = 3
                # num samples to lag = 5
                # random sampling ratio = 0.2
                # maximum number of k-means iterations = 1000
                # dimension anomaly score threshold = 0.99
                # host anomaly rate threshold = 1.0
                # anomaly detection grouping method = average
                # anomaly detection grouping duration = 5m
                # hosts to skip from training = !*
                # charts to skip from training = netdata.*
                # dimension anomaly rate suppression window = 15m
                # dimension anomaly rate suppression threshold = 450
                # delete models older than = 7d
          stream:
            enabled: true
            path: /etc/netdata/stream.conf
            data: |
              [stream]
                enabled = {{ ternary "yes" "no" .Values.parent.enabled }}
                destination = netdata:{{ .Values.service.port }}
                api key = 11111111-2222-3333-4444-555555555555
                timeout seconds = 60
                buffer size bytes = 1048576
                reconnect delay seconds = 5
                initial clock resync iterations = 60
          exporting:
            enabled: false
            path: /etc/netdata/exporting.conf
            data: ""
          go.d:
            enabled: true
            path: /etc/netdata/go.d.conf
            data: |
              modules:
                pulsar: no
                prometheus: yes
          kubelet:
            enabled: true
            path: /etc/netdata/go.d/k8s_kubelet.conf
            data: |
              update_every: 1
              autodetection_retry: 0
              jobs:
                - url: http://127.0.0.1:10255/metrics
                - url: https://localhost:10250/metrics
                  tls_skip_verify: yes
          kubeproxy:
            enabled: true
            path: /etc/netdata/go.d/k8s_kubeproxy.conf
            data: |
              update_every: 1
              autodetection_retry: 0
              jobs:
                - url: http://127.0.0.1:10249/metrics

        env:
          {}
          ## To disable anonymous statistics:
          # DO_NOT_TRACK: 1

        envFrom:
          #[]
          ## E.g. to read Netdata Cloud claim token from an existing secret "netdata" set this to:
          # - secretRef:
          #     name: netdata
          ## And create it with: kubectl create secret generic netdata --from-literal="NETDATA_CLAIM_TOKEN=<token>"
          ## Also ensure that claim.token is empty
          #- secretRef:
          #    name: smbcreds

        claiming:
          enabled: true
          token: "" # Replace with your token
          rooms: "" # Replace with your room id
          url: "https://api.netdata.cloud"

        extraVolumeMounts: []
          # - name: pi8s-netdata-volume
          #   mountPath: /mnt/pi8s
          #- name: pi8s-netdata-volume
          #  mountPath: "/mnt/pi8s"
          #  readOnly: false
          #  mountPropagation: HostToContainer

        extraVolumes: []
          # - name: pi8s-netdata-volume
          #   persistentVolumeClaim:
          #     claimName: pi8s-netdata-pvc

      k8sState:
        enabled: true
        port: "{{ .Values.parent.port }}"

        resources:
          {}
          # limits:
          #  cpu: 4
          #  memory: 4096Mi
          # requests:
          #  cpu: 4
          #  memory: 4096Mi

        livenessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1
        readinessProbe:
          initialDelaySeconds: 0
          failureThreshold: 3
          periodSeconds: 30
          successThreshold: 1
          timeoutSeconds: 1

        terminationGracePeriodSeconds: 30

        nodeSelector: {}

        tolerations: []

        affinity: {}

        priorityClassName: ""

        podLabels: {}

        podAnnotationAppArmor:
          enabled: true

        podAnnotations: {}

        dnsPolicy: ClusterFirstWithHostNet

        persistence:
          enabled: true
          ## Set '-' as the storageclass to get a volume from the default storage class.
          storageclass: "pi8s-nfs-netdata"
          volumesize: 1Gi

        configs:
          netdata:
            enabled: true
            path: /etc/netdata/netdata.conf
            data: |
              [global]
                hostname = netdata-k8s-state
              [db]
                mode = ram
              [health]
                enabled = yes
              [ml]
                enabled = yes
                # maximum num samples to train = 21600
                # minimum num samples to train = 900
                # train every = 3h
                # number of models per dimension = 18
                # dbengine anomaly rate every = 30
                # num samples to diff = 1
                # num samples to smooth = 3
                # num samples to lag = 5
                # random sampling ratio = 0.2
                # maximum number of k-means iterations = 1000
                # dimension anomaly score threshold = 0.99
                # host anomaly rate threshold = 1.0
                # anomaly detection grouping method = average
                # anomaly detection grouping duration = 5m
                # hosts to skip from training = !*
                # charts to skip from training = netdata.*
                # dimension anomaly rate suppression window = 15m
                # dimension anomaly rate suppression threshold = 450
                # delete models older than = 7d
              [plugins]
                timex = no
                checks = no
                idlejitter = no
                tc = no
                diskspace = no
                proc = no
                cgroups = no
                enable running new plugins = no
                slabinfo = no
                perf = no
                go.d = yes
                ioping = no
                ebpf = no
                charts.d = no
                apps = no
                python.d = no
                fping = no
          stream:
            enabled: true
            path: /etc/netdata/stream.conf
            data: |
              [stream]
                enabled = {{ ternary "yes" "no" .Values.parent.enabled }}
                destination = netdata:{{ .Values.service.port }}
                api key = 11111111-2222-3333-4444-555555555555
                timeout seconds = 60
                buffer size bytes = 1048576
                reconnect delay seconds = 5
                initial clock resync iterations = 60
          exporting:
            enabled: false
            path: /etc/netdata/exporting.conf
            data: ""
          go.d:
            enabled: true
            path: /etc/netdata/go.d.conf
            data: |
              default_run: no
              modules:
                k8s_state: yes
          go.d-k8s_state:
            enabled: true
            path: /etc/netdata/go.d/k8s_state.conf
            data: |
              jobs:
                - name: k8s_state
                  update_every: 1

        env:
          {}
          ## To disable anonymous statistics:
          # DO_NOT_TRACK: 1

        envFrom:
          #[]
          ## E.g. to read Netdata Cloud claim token from an existing secret "netdata" set this to:
          # - secretRef:
          #     name: netdata
          ## And create it with: kubectl create secret generic netdata --from-literal="NETDATA_CLAIM_TOKEN=<token>"
          ## Also ensure that claim.token is empty
          #- secretRef:
          #    name: smbcreds

        claiming:
          enabled: true
          token: "" # Replace with your token
          rooms: "" # Replace with your room id
          url: "https://api.netdata.cloud"

        extraVolumeMounts: []
          # - name: pi8s-netdata-volume
          #   mountPath: /mnt/pi8s
          #- name: pi8s-netdata-volume
          #  mountPath: "/mnt/pi8s"
          #  readOnly: false
          #  mountPropagation: HostToContainer

        extraVolumes: []
          # - name: pi8s-netdata-volume
          #   persistentVolumeClaim:
          #     claimName: pi8s-netdata-pvc
```

- Lets git it

```shell
git add .
git commit -m "netdata deploy"
git push
```

#### Fluxcd is doing the following under the hood | Netdata

- Helm repo add

```shell
helm repo add netdata https://netdata.github.io/helmchart/ --force-update
```

- Helm install Netdata

```shell
helm install netdata
```

#### Kubernetes check | Netdata

- Kubectl switch to the infrastructure namespace

```shell
kubectl config set-context --current --namespace=infrastructure
```

- Kubectl show me the pods for Netdata
- The netdata-parent is the one I am troubleshooting the NFS permissions for hence the `CrashLoopBackOff`

```shell
kubectl get pods -n infrastructure | grep netdata
```

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/01-netdata-pods.png" alt="netdata pods"/>
</div>
<p></p>

- The eye of Netdata should now be removing the blindfolds and the fog should be clearing on your infrastructure

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/02-netdata-metrics.png" alt="netdata metrics"/>
</div>
<p></p>

- Netdata alerts

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/03-netdata-alerts.png" alt="netdata alerts"/>
</div>
<p></p>

- Netdata monitoring checklist

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/04-netdata-monitoring-checklist.png" alt="netdata monitoring checklist"/>
</div>
<p></p>

- I got a lot of this information from the fine folks at Netdata in this presentation [Maximise Uptime and Minimise Stress](https://youtu.be/xOJwlU_cYAE)

#### How to add additional nodes in Netdata

- In the top left corner of your screen go to `Connect Nodes`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/05-netdata-connect-nodes.png" alt="netdata connect nodes"/>
</div>
<p></p>

- On the right hand side of your screen select `Kubernetes (Helm)`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/06-netdata-existing-cluster.png" alt="netdata existing cluster"/>
</div>
<p></p>

- Copy the provided code to `override.yaml` which will be pre-populated with your token data

```yaml
image:
  tag: stable

restarter:
  enabled: true

parent:
  claiming:
    enabled: true
    token: # Replace with your token
    rooms: # Replace with your room id

child:
  claiming:
    enabled: true
    token: # Replace with your token
    rooms: # Replace with your room id
```

- On the command line use Helm to install Netdata on your Kubernetes cluster
- For a new installation use helm install
- For an existing cluster add the content below to your override.yaml and then run

```shell
helm upgrade -f override.yml netdata netdata/netdata
```

- Your new nodes will start appearing in Netdata console after a little time

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/07-netdata-nodes-123.png" alt="netdata node 123"/>
</div>
<p></p>

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part07/08-netdata-nodes-456.png" alt="netdata nodes 456"/>
</div>
<p></p>

### Conclusion

***FYI make sure you backup your persistent volumes on the NFS server***.

You now have the eye of Netdata like a micro surgeon giving you insight into your Cloud infrastructure without breaking much of a sweat. What you don't have is that fine Leopard vest I am wearing in my profile pic below. I need to remedy that. If I missed any steps or something needs correction please ping me so I can make any fixes. This illustrates how you can deploy Netdata and get all that healthy Observability goodness.

Happy alien hunting.....

<!-- ### Next Steps

[How to Bake an Ortelius Pi | Part 8 | The Upgrades](https://ortelius.io/blog/2024/08/10/how-to-bake-an-ortelius-pi-part-4-Cloudflare-Certificates-and-Traefik/) -->

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
