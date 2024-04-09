## How to bake an Ortelius Pi Part 2 | The Preparation

### Introduction

In [Part 1](https://ortelius.io/blog/2024/03/27/how-to-bake-an-ortelius-pi-part-1-the-hardware/), of this series we installed Ubuntu Server 22.04.4 LTS on our Raspberry Pis. In Part 2 we will prepare our three Pis for DHCP, DNS, NFS (Network File System) storage with a [Synology NAS](https://www.synology.com/) and install [MicroK8s](https://microk8s.io/).

### IP Addresses and DHCP

We need to give the Pis a home address so that they are contactable and this is where either a [static IP addresse](https://www.pcmag.com/how-to/how-to-set-up-a-static-ip-address) or [DHCP](https://www.youtube.com/watch?v=ldtUSSZJCGg) comes in. Your home internet router generally comes with DHCP pre-configured. I use the [tp-link | AX5400 Wi-Fi 6 Router](https://www.tp-link.com/us/home-networking/wifi-router/archer-ax73/) and so I will use my router as the example here.

- Login to your home router with your browser and look for your DHCP configuration
- Mine is `Network` --> `DHCP Server`

![dhcp network](images/how-to-bake-an-ortelius-pi/part02/18-dhcp-network.png)

![dhcp server](images/how-to-bake-an-ortelius-pi/part02/19-dhcp-server.png)

- Here you will see the IP pool range that your router is handing out to your device on your home network
- I don't want the entire range to be handed out as I need at least two static IP's to be availble for the Metallb load balancer which will run in Kubernetes and one for the Synology NAS.

![dhcp range](images/how-to-bake-an-ortelius-pi/part02/20-dhcp-range.png)

- My Pi's have the following IPs which I have reserved with their mac addresses
- You can get the mac addresses from the DHCP list of IPs handed out to your Pis
- Reserving an IP means you tell DHCP to always give these devices the same IP and never to any other device so in a sense making sure they stay static

![dhcp reservations](images/how-to-bake-an-ortelius-pi/part02/21-dhcp-reservations.png)

---------------------------------------------------------------------------------------------------------------
### DNS

#### [Local.gd](https://local.gd)

If you don't have something like NextDNS or similar you can use `local.gd` which works very well and is very easy to setup.

The easiest way to serve localhost. DNS that always resolves to 127.0.0.1. Use mysite.local.gd when developing locally and it will resolve to 127.0.0.1. Any subdomain like *.local.gd will work. Its the easiest way to serve localhost as its DNS that always resolves to 127.0.0.1.

Use mysite.local.gd when developing locally and it'll resolve to 127.0.0.1. Any subdomain like *.local.gd will work.
We use Netlify DNS so we're pretty sure you're always within 10ms of a DNS server, wherever you are. It's super quick!

Use any subdomain you like, and sub-sub-domains work too!

```
$ dig startup.local.gd
startup.local.gd.                  86400	IN	A	127.0.0.1

$ dig www.startup.local.gd
www.startup.local.gd.              86400	IN	A	127.0.0.1

$ dig my.project.company.local.gd
my.project.company.local.gd.       86400	IN	A	127.0.0.1

$ dig alderaan.local.gd
alderaan.local.gd.                 86400	IN	A	127.0.0.10.0.1
```

- Edit localhosts on Linux and Mac here with sudo rights `sudo vi /etc/hosts`
- Edit Windows localhosts file here as administrator `windows\System32\drivers\etc\hosts`

-------------------------------------------------------------------------------------------------------------

#### NextDNS

For DNS I use [NextDNS](https://nextdns.io/) but this is not just DNS its complete protection for all your devices no matter where you go in the world for all your devices including your Pi MicroK8s nodes. It will use `127.0.0.1:53` to resolve your local IPs but to do that we need to do some configuration by logging into the NextDNS portal and installing the cli.

#### Disclaimer

NextDNS is free to a certain amount of DNS queries once you reach that limit resolution stops. Its inexpensive and totally worth it.

-------------------------------------------------------------------------------------------------------------

- Think of a domain name for your environment - mine is pangarabbit.com
- Go to the NextDNS Wiki [here](https://github.com/nextdns/nextdns/wiki)
- Install the cli on each Pi and on your NAS so that you can SSH into your NAS and install NextDNS
- Here is a doc on how to configure [SSH](https://kb.synology.com/en-id/DSM/tutorial/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet) for a Synology NAS


```
sh -c 'sh -c "$(curl -sL https://nextdns.io/install)"'
```

- Run `sudo nextdns config` to view your config
- Run `sudo nextdns config edit` to edit for each Pi and NAS and configure like this

```
debug false
cache-size 10MB
max-ttl 5s
mdns all
cache-max-age 0s
use-hosts true
auto-activate true
listen localhost:53
profile <your profile id goes here>
log-queries false
report-client-info true
discovery-dns
hardened-privacy false
timeout 5s
setup-router false
control /var/run/nextdns.sock
detect-captive-portals false
bogus-priv true
max-inflight-requests 256
```

- Run `sudo nextdns restart` to restart the service
- Run `sudo nextdns status` to check the service status
- Then in your NextDNS portal go to `Settings`

![nextdns settings](images/how-to-bake-an-ortelius-pi/part02/15-dns-settings.png)

- Then scroll down to `Rewrites`

![nextdns rewrites](images/how-to-bake-an-ortelius-pi/part02/16-dns-rewrites.png)

- And add your private network DNS records like in this example for the Pis and your NAS

![nextdns records](images/how-to-bake-an-ortelius-pi/part02/17-dns-records.png)

![nextdns record nas](images/how-to-bake-an-ortelius-pi/part02/22-dns-record-nas.png)

- NextDNS will instantly auto refresh all your NextDNS agents with any configuration changes
- Great DNS is done!

---------------------------------------------------------------------------------------------------------------

### NFS Prep
- [Synology](https://www.synology.com/)
- [What is network-attached storage (NAS)?](https://www.purestorage.com/knowledge/what-is-nas.html)
- [What is NFS?](https://www.minitool.com/lib/what-is-nfs.html)
- I am using a `Synology DS413j with DSM 6.2.4-25556 Update 7` so the following steps will be inline with my Synology

---------------------------------------------------------------------------------------------------------------

#### Enable NFS on the Synology

- Login to the Synology and go to `File Services`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/01-syno-file-services-icon.png)

- On the `SMB/AFP/NFS` tab and scroll until you see `NFS` and `enable NFS and enable NFSv4 support`

![synology nfs services](images/how-to-bake-an-ortelius-pi/part02/02-syno-nfs-enable-tab.png)

![synology nfs services](images/how-to-bake-an-ortelius-pi/part02/03-syno-nfs-enable.png)

#### Configure Shared Folder
- Go to `File Sharing`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/04-syno-file-sharing-icon.png)

- Click `Create`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/05-syno-file-sharing-create.png)

- Create a name for your folder share, I used `Pi8s`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/06-syno-file-sharing-next.png)

- Skip encryption
- Apply your config

![synology file services](images/how-to-bake-an-ortelius-pi/part02/07-syno-file-sharing-confirm.png)

- Right click your newly created `Shared Folder` and select `Edit`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/08-syno-file-share-edit.png)

- Select `Permissions` tab

![synology file services](images/how-to-bake-an-ortelius-pi/part02/09-syno-file-share-permissions.png)

- Select `Local users`drop down and give the  `admin` `Read/Write` permissions by checking the box

![synology file services](images/how-to-bake-an-ortelius-pi/part02/10-syno-file-share-local-users.png)

![synology file services](images/how-to-bake-an-ortelius-pi/part02/11-syno-file-share-admin.png)

- Select `NFS Permissions` and then `Create`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/12-syno-file-share-nfs-permissions.png)

![synology file services](images/how-to-bake-an-ortelius-pi/part02/13-syno-file-share-nfs-create.png)

- Configure like this then click `OK`

![synology file services](images/how-to-bake-an-ortelius-pi/part02/14-syno-file-share-nfs-config.png)

- Congrats you just configured the Synology for NFS!

---------------------------------------------------------------------------------------------------------------

### OS Prep

#### Pis | Ubuntu Server 22.04.4 LTS
- Update all packages to the latest on each Pi with `sudo apt update -y && sudo apt upgrade -y` then go and make coffee
- Install `sudo apt install nfs-common -y` for each Pi

#### Kubectl | Your machine
- Kubectl docs [here](https://kubernetes.io/docs/reference/kubectl/)
- Kubectl quick reference [here](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- Install Kubectl [here](https://kubernetes.io/docs/tasks/tools/) on `your local machine`
- Install and setup Kubectl on Mac [here](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/)
- Install and setup Kubectl on Windows [here](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
- Install and setup Kubectl on Linux [here](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

#### Helm | Your machine
- Helm docs [here](https://helm.sh/docs/)
- Helm cheat sheet [here](https://helm.sh/docs/intro/cheatsheet/)
- Install Helm [here](https://helm.sh/) on `your local machine`
- Install Helm with Homebrew package manager `brew install helm` generally used on Mac
- Install Helm with Chocolatey windows package manager `choco install kubernetes-helm`

### MicroK8s Prep
- MicroK8s docs [here](https://microk8s.io/docs)
- [Microk8s on a Raspberry Pi](https://microk8s.io/docs/install-raspberry-pi)
- [Microk8s host interface configuration](https://microk8s.io/docs/configure-host-interfaces)
- [Microk8s multi-node cluster creation](https://microk8s.io/docs/clustering)
- `FYI` there are commands related to `Kubectl` such as `kubectl get nodes` which are run from your machine
- `FYI` there are commands related to `MickroK8s` such as `sudo microk8s config` which are run on the Pis where MicroK8s is installed
- Please find the MicroK8s command reference [here](https://microk8s.io/docs/command-reference)

---------------------------------------------------------------------------------------------------------------

- SSH into each Pi and configure the Pi BIOS `sudo vi /boot/firmware/cmdline.txt` and add the following `cgroup_enable=memory cgroup_memory=1`
- Below is the config from my Pi as an example

```
cgroup_enable=memory cgroup_memory=1 console=serial0,115200 dwc_otg.lpm_enable=0 console=tty1 root=LABEL=writable rootfstype=ext4 rootwait fixrtc quiet splash
```

- Install Kernel Modules `sudo apt install linux-modules-extra-raspi`
- Referenced from [here](https://microk8s.io/docs/install-raspberry-pi)
- Install Microk8s on each Pi

```
sudo snap install microk8s --classic
```

- This installs the latest version of Microk8s

#### Create highly available 3 node cluster with MicroK8s

MicroK8s uses [Dqlite](https://dqlite.io/) as a highly available SQLite database to store the Kubernetes logic without any configuration. In Canonicals own words `High-availability SQLite Dqlite is a fast, embedded, persistent SQL database with Raft consensus that is perfect for fault-tolerant IoT and Edge devices.`

- Choose a Pi to start the process, I used `pi01`
- SSH onto `pi01` and run this command on `pi01`

```
sudo microk8s add-node
```

- You will need to run this `3 times` on the same node to generate a unique key for each node you wish to join
- This will return some joining instructions which should be executed on the MicroK8s instance that you wish to join to the cluster `(NOT THE NODE YOU RAN add-node FROM)` <-- Taken from Canonicals docs.

```
# EXAMPLE from Canonicals docs
From the node you wish to join to this cluster, run the following:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05

Use the '--worker' flag to join a node as a worker not running the control plane, eg:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05 --worker

If the node you are adding is not reachable through the default interface you can use one of the following:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
microk8s join 10.23.209.1:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
microk8s join 172.17.0.1:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05
```

- Referenced from [here](https://microk8s.io/docs/clustering)
- On the same Pi run `sudo microk8s config`
- This will return config you will need to access your Microk8s cluster
- On your computer you will need to configure Kubectl by editing your `kube config`
- My Kubectl configuration is here on my Mac `/Users/<username>/.kube/config`

```
- cluster:
    certificate-authority-data: <your certificate authority data goes here>
    server: https://<your local network IP for your Pi goes here>:16443
  name: microk8s-cluster
- context:
    cluster: microk8s-cluster
    namespace: default
    user: <your user goes here>
  name: microk8s
users:
- name: <your user goes here>
  user:
    client-certificate-data: <your client certificate data goes here>
```
- Kubectl quick reference [here](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- Use Kubectl to connect to your cluster
- To view your current kube config
```
kubectl config view
```
- Get your available contexts
```
kubectl config get-context
```
- Switch context to Microk8s
```
kubectl config use-context microk8s
```
- Run the following to see all namespaces
```
kubectl get ns
```
- Run the following to see all pods
```
kubectl get pods --all-namespaces
```
- Well done you are now using your Microk8s Kubernetes cluster

### Conclusion

By this stage you should have three Pi's each with NFS and MicroK8s. Stay tuned for Part 3 where we will deploy the NSF [csi-driver-nfs](https://github.com/kubernetes-csi/csi-driver-nfs) for Kubernetes, deploy [MetalLB load balancer](https://metallb.universe.tf/), deploy [Traefik](https://traefik.io/) and [Ortelius](https://ortelius.io/).

#### Disclaimer: Any brands I mention in this blog post series are not monetised. This is my ho