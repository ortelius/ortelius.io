---
date: 2024-10-24
title: "How to Bake an Ortelius Pi Part 8 | OS Upgrades, Microk8s Upgrades and Adding Worker Nodes"
linkTitle: "How to Bake an Ortelius Pi Part 8 | OS Upgrades, Microk8s Upgrades and Adding Worker Nodes"
author: Sacha Wharton
---

<!-- <div class="col-center">
<img src="/images/orteliuspi-part3.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p> -->

- [Introduction](#introduction)
- [Raspberry Pi 5s](#raspberry-pi-5s)
  - [Features](#features)
  - [Storage](#storage)
- [Master Node Preparation Steps](#master-node-preparation-steps)
  - [Upgrading Microk8s](#upgrading-microk8s)
  - [Microk8s drain](#microk8s-drain)
  - [Microk8s uncordon](#microk8s-uncordon)
  - [Upgrading Ubuntu](#upgrading-ubuntu)
- [Deploy the worker nodes](#deploy-the-worker-nodes)
  - [Using the Raspberry Pi Imager](#using-the-raspberry-pi-imager)
  - [Choose Storage](#choose-storage)
  - [IP Addresses and DHCP](#ip-addresses-and-dhcp)
  - [DNS Configuration](#dns-configuration)
- [Microk8s Prep](#microk8s-prep)
  - [Installing Microk8s](#installing-microk8s)
  - [Joining your worker nodes to the cluster](#joining-your-worker-nodes-to-the-cluster)
  - [Microk8s drain to move workloads to the worker nodes](#microk8s-drain-to-move-workloads-to-the-worker-nodes)
- [Conclusion](#conclusion)

### Introduction

In [part 7](https://ortelius.io/blog/2024/10/22/how-to-bake-an-ortelius-pi-part-7-observability-with-netdata/) we deployed [Netdata](https://www.netdata.cloud/) and explored deploying Netdata to gain valuable insights into our cloud infrastracture.

In part 8 I will discuss how I upgraded my cluster from a 3 node Kubernetes cluster to a 6 node Kubernetes cluster by incorporating 3 Pi 5s as worker nodes. My goal with this entire series and project is to emulate as close as possible what an enterprise platform would look like using various solutions and what Ortelius can do once deployed in your cloud infrastructure. My focus is always to empower, sharpen other humans and do my best to break down complexity whilst being resourceful. A monumental task in itself.

### Raspberry Pi 5s

The new Raspberry Pi 5 comes with greater processing power, substantially upgraded graphics performance which should really help with MLOP's workloads when deploying your self-hosted platform (yet to test this thou) and USB C.

#### Features

- Processor Broadcom BCM2712 2.4GHz quad-core 64-bit Arm Cortex-A76 CPU, with cryptography extensions, 512KB per-core L2   caches, and a 2MB shared L3 cache
- VideoCore VII GPU, supporting OpenGL ES 3.1, Vulkan 1.2
- Dual 4Kp60 HDMI® display output with HDR support
- 4Kp60 HEVC decoder
- LPDDR4X-4267 SDRAM (4GB and 8GB SKUs available at launch)
- Dual-band 802.11ac Wi-Fi®
- Bluetooth 5.0 / Bluetooth Low Energy (BLE)
- microSD card slot, with support for high-speed SDR104 mode
- 2 × USB 3.0 ports, supporting simultaneous 5Gbps operation
- 2 × USB 2.0 ports
- Gigabit Ethernet, with PoE+ support (requires separate PoE+ HAT)
- 2 × 4-lane MIPI camera/display transceivers
- PCIe 2.0 x1 interface for fast peripherals (requires separate M.2 HAT or other adapter)
- 5V/5A DC power via USB-C, with Power Delivery support
- Raspberry Pi standard 40-pin header
- Real-time clock (RTC), powered from external battery
- Power button

For a more in depth coverage go to this [URL](https://www.pishop.co.za/store/raspberry-pi-5-0/raspberry-pi-5-model-b-8gb)

#### Storage

For storage I opted for the [Samsung EVO Plus 128GB MicroSD Card](https://www.samsung.com/za/memory-storage/memory-card/memory-card-evo-plus-microsd-card-128gb-mb-mc128sa-apc/) which would host [Ubuntu 24.04.1 LTS Noble Numbat](https://ubuntu.com/blog/canonical-releases-ubuntu-24-04-noble-numbat) and for consolidated centralised storage I got 3 [Western Digital My Passport 2TB USB 3 disks](https://www.westerndigital.com/products/portable-drives/wd-my-passport-usb-3-0-hdd?sku=WDBYVG0020BBK-WESN) for each worker Pi which I will cover in another blog on how to use software defined storage to present them as a single block of storage to Kubernetes.

### Master Node Preparation Steps

#### Upgrading Microk8s

- This is a good time to perform maintenance before you add the worker nodes and is a lengthy process
- **Do one node at a time**
- SSH onto each Pi and run the following commands

#### Microk8s drain

- Draining a node migrates workloads to the other nodes

```shell
# cordons the node preventing workloads from being scheduled on the node
microk8s kubectl drain <node name> --ignore-daemonsets --delete-emptydir-data
```

- Once that is done upgrade Microk8s on that node

```shell
# You will need to change the channel version to the latest version at the time
sudo snap refresh microk8s --channel <latest version>/candidate
# sudo snap refresh microk8s --channel 1.31.1/candidate
```

- Restart the node

```shell
sudo reboot
```

#### Microk8s uncordon

- SSH onto the rebooted node and uncordon that node to schedule workloads on that node

```shell
# Uncordon tells Kubernetes that this node can be used to schedule workloads
microk8s kubectl uncordon <node name>
# microk8s kubectl uncordon pi01
```

- This command will show you the state of each node and you will see that my master nodes are `SchedulingDisabled`

```shell
kubectl get nodes
```

```shell
NAME   STATUS                     ROLES    AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
pi04   Ready                      <none>   9d    v1.31.1   192.168.0.149   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi05   Ready                      <none>   9d    v1.31.1   192.168.0.115   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi06   Ready                      <none>   9d    v1.31.1   192.168.0.23    <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
```

#### Upgrading Ubuntu

- Then upgrade Ubuntu with the following steps
- Do one node at a time
- Follow the prompts

```shell
# Update Current System: Ensure your current installation is fully updated and old packages are cleaned out
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
```

```shell
# Begin the Upgrade: do-release-upgrade will manage the upgrade smoothly and interactively.
sudo do-release-upgrade -d
```

**Rinse and repeat for each SD Card**

### Deploy the worker nodes

Right lets deploy those worker nodes by preparing our Raspberry Pi 5's using a similar process from [part01](https://ortelius.io/blog/2024/04/05/how-to-bake-an-ortelius-pi-part-1-the-hardware/).

#### Using the Raspberry Pi Imager

- Repeat these steps for each SD Card
- The opening screen will present you with `CHOOSE DEVICE` | `CHOOSE OS` | `CHOOSE STORAGE`
- `CHOOSE DEVICE`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/00-choose-device-os-storage.png" alt="raspberry-pi-5" height="300px" width="650px" />
</div>
<p></p>
<br>

**Choose** `Raspberry Pi5`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/01-choose-device.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

**Choose** `Other general-purpose OS`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/02-choose-other-general-purpose-os.png" alt="general purpose os" height="300px" width="650px" />
</div>
<p></p>
<br>

**Choose** `Ubuntu`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/03-choose-ubuntu.png" alt="choose ubuntu" height="300px" width="650px" />
</div>
<p></p>
<br>

**Choose** `Ubuntu Server 24.04.1 LTS (64-bit)`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part08/01-choose-ubuntu-server-24-04-1-lts-x64.png" alt="choose ubuntu server 24.04.4 lts x64" height="300px" width="650px" />
</div>
<p></p>
<br>

#### Choose Storage

Note: This will look different on your machine

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/05-choose-device-media.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

- `Next`

Use OS Customization by clicking: `EDIT SETTINGS`
<p></p>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/07-use-os-customisation.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

Fill in the required info according to your specifications.

Remember to change the `HOSTNAMES` `pi04` | `pi05` | `pi06` before each installation of Ubuntu on the SD Card

(You can use whatever hostnames make sense to you)

<p></p>
<br>

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/08-general-settings.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/09-enable-ssh-password-auth.png" alt="raspberry-pi-4b" height="300px" width="650px" />
<p></p>
</div>

- If you decide to use `Allow public-key authentication only` which I would recommend you need to do some extra steps
- Add the same public key you generated in [part01](https://ortelius.io/blog/2024/04/05/how-to-bake-an-ortelius-pi-part-1-the-hardware/)to each new worker node
- If you are using a Mac or Linux you will find public key marked with a `.pub` extension here `/Users/<your username>/.ssh`
- If you are using Windows you will find the public key marked with a `.pub` extension here `C:\Users\username\.ssh`
- Copy the public key each time you perform an install on the SD Card to `Allow public-key authentication only`
- **Append** this config to `.ssh/config`

```shell
Host pi04.yourdomain.com
 HostName pi04.yourdomain.com
    AddKeysToAgent yes
 IdentityFile ~/.ssh/<private key name>
 User <your user>

Host pi05.yourdomain.com
 HostName pi05.yourdomain.com
    AddKeysToAgent yes
 IdentityFile ~/.ssh/<private key name>
 User <your user>

Host pi06.yourdomain.com
 HostName pi06.yourdomain.com
    AddKeysToAgent yes
    IdentityFile ~/.ssh/<private key name>
 User <your user>
```

- This will allow SSH without a password onto each Pi like this `ssh -i ~/.ssh/<your private key name> <your pi username@<your private ip or domain name>` for example `ssh -i ~/.ssh/pis ortelius@pi04.pangarabbit.com`

- You can also reference this document from [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) for an alternative explanation

**Check** the boxes specific to your needs.

<p></p>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/10-options.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

**Click** `YES` to apply the OS customisation settings

<p></p>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/11-use-os-customisation-yes.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

**Rinse and repeat for each SD Card**

- If all went well you should have 3 Pi 5's with Ubuntu installed

#### IP Addresses and DHCP

- Your new worker nodes should have been assigned IP addresess from the DHCP server
- Remember to reserve these
- Refer to [part 2](https://ortelius.io/blog/2024/04/11/how-to-bake-an-ortelius-pi-part-2-the-preparation/) for a refresher

#### DNS Configuration

- Don't forget to configure DNS by adding your new nodes like we did in [part 2](https://ortelius.io/blog/2024/04/11/how-to-bake-an-ortelius-pi-part-2-the-preparation/)

### Microk8s Prep

- MicroK8s docs [here](https://microk8s.io/docs)
- [Microk8s on a Raspberry Pi](https://microk8s.io/docs/install-raspberry-pi)
- [Microk8s host interface configuration](https://microk8s.io/docs/configure-host-interfaces)
- [Microk8s multi-node cluster creation](https://microk8s.io/docs/clustering)
- Please find the MicroK8s command reference [here](https://microk8s.io/docs/command-reference)
- Kubectl quick reference [here](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
- `FYI` there are commands related to `Kubectl` such as `kubectl get nodes` which are run from your machine
- `FYI` there are commands related to `MickroK8s` such as `sudo microk8s config` which are run on the Pis where MicroK8s is installed

#### Installing Microk8s

- On each node create a folder in your user home directory

```shell
mkdir ~/.kube
```

- SSH into each Pi and configure the Pi BIOS `sudo vi /boot/firmware/cmdline.txt` and add the following `cgroup_enable=memory cgroup_memory=1`
- Below is the config from my Pi as an example

```shell
cgroup_enable=memory cgroup_memory=1 console=serial0,115200 dwc_otg.lpm_enable=0 console=tty1 root=LABEL=writable rootfstype=ext4 rootwait fixrtc quiet splash
```

- Install Kernel Modules `sudo apt install linux-modules-extra-raspi`
- Referenced from [here](https://microk8s.io/docs/install-raspberry-pi)
- I like to use the latest stable version

```shell
# Installs Microk8s, sets permissions and ownership to the current user on the .kube directory
sudo snap install microk8s --classic --channel=1.31/stable && sudo usermod -a -G microk8s $USER && sudo chown -f -R $USER ~/.kube
```

#### Joining your worker nodes to the cluster

- Choose a Pi to start the process, I used `pi04`
- SSH onto `pi04` and run this command on `pi04`

```shell
sudo microk8s add-node
```

- You will need to do this `3 times` on the same node and each time you will need to copy the unique `join instruction with the unique key` for each node you wish to join
- This will return some joining instructions which should be executed on the MicroK8s instance that you wish to join to the cluster `(NOT THE NODE YOU RAN add-node FROM)`
- Make sure you add the `--worker` flag as these are not to be joined as master nodes

```shell
# EXAMPLE from Canonicals docs
Use the '--worker' flag to join a node as a worker not running the control plane, eg:
microk8s join 192.168.1.230:25000/92b2db237428470dc4fcfc4ebbd9dc81/2c0cb3284b05 --worker
```

**Rinse and repeat for each node**

#### Microk8s drain to move workloads to the worker nodes

- **If are adding worker nodes** we want to emulate a enterprise thus we do not want workloads running on our master nodes so we will corden them by performing the drain command again so that workloads cannot be placed on them
- Only drain the master nodes which will be the first 3 nodes you installed

```shell
# cordons the node preventing workloads from being scheduled on the node
microk8s kubectl drain <node name> --ignore-daemonsets --delete-emptydir-data
# microk8s kubectl drain pi01 --ignore-daemonsets --delete-emptydir-data
```

- Run the following to see your new nodes and the master nodes will have `SchedulingDisabled`

```shell
kubectl get nodes
```

```shell
NAME   STATUS                     ROLES    AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
pi01   Ready,SchedulingDisabled   <none>   85d   v1.31.1   192.168.0.48    <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi02   Ready,SchedulingDisabled   <none>   85d   v1.31.1   192.168.0.107   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi03   Ready,SchedulingDisabled   <none>   85d   v1.31.1   192.168.0.141   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi04   Ready                      <none>   9d    v1.31.1   192.168.0.149   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi05   Ready                      <none>   9d    v1.31.1   192.168.0.115   <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
pi06   Ready                      <none>   9d    v1.31.1   192.168.0.23    <none>        Ubuntu 24.04.1 LTS   6.8.0-1013-raspi   containerd://1.6.28
```

**FYI make sure you backup your persistent volumes on the NFS server**

### Conclusion

You now have a 6 node Microk8s Kubernetes 1.31.1 cluster with 3 master nodes, 3 worker nodes all running Ubuntu 24.04.1 LTS Noble Numbat. Your master nodes can focus on Kubernetes logic and your worker nodes can focus on your applications and infrastructure workloads.

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
