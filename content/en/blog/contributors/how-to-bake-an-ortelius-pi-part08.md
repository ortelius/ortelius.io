---
date: 2024-10-24
title: "How to Bake an Ortelius Pi Part 8 | Adding 3 Kubernetes Worker Nodes"
linkTitle: "How to Bake an Ortelius Pi Part 8 | Adding 3 Kubernetes Worker Nodes"
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
- [Deploy the worker nodes](#deploy-the-worker-nodes)
  - [Using the Raspberry Pi Imager](#using-the-raspberry-pi-imager)
  - [Choose Storage](#choose-storage)
  - [Helm-Repository | Netdata](#helm-repository--netdata)
- [Conclusion](#conclusion)

### Introduction

In [part 7](https://ortelius.io/blog/2024/10/22/how-to-bake-an-ortelius-pi-part-7-observability-with-netdata/) we deployed [Netdata](https://www.netdata.cloud/) and explored deploying Netdata to gain valuable insights into our cloud infrastracture.

In part 8 I will discuss how I upgraded my cluster from a 3 node Kubernetes cluster to a 6 nodes Kubernetes cluster by incorporating 3 Pi 5s as worker nodes. My goal with this entire series and project is to emulate as close as possible what an enterprise platform would look like using various solutions and what Ortelius can do once deployed in your cloud infrastructure. My focus is always to empower, sharpen other humans and do my best to break down complexity whilst being resourceful. A monumental task in itself.

### Raspberry Pi 5s

The new Raspberry Pi 5 comes with greater processing power, substantially upgraded graphics performance which should really help with MLoPs workloads when deploying your self-hosted platform (yet to test this thou) and USB C.

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

For storage I opted for the [Samsung EVO Plus 128GB MicroSD Card](https://www.samsung.com/za/memory-storage/memory-card/memory-card-evo-plus-microsd-card-128gb-mb-mc128sa-apc/) which would host [Ubuntu 24.04.1 LTS Noble Numbat](https://ubuntu.com/blog/canonical-releases-ubuntu-24-04-noble-numbat) and for consolidated centralised storage I got 3 [Western Digital My Passport 2TB USB 3 disks](https://www.westerndigital.com/products/portable-drives/wd-my-passport-usb-3-0-hdd?sku=WDBYVG0020BBK-WESN) for each worker Pi which I will cover in another blog how to use software defined storage to present them as a single block of storage to Kubernetes.

### Deploy the worker nodes

Right lets deploy those worker nodes by preparing our Raspberry Pi 5's using a similar process from [part01](https://ortelius.io/blog/2024/04/05/how-to-bake-an-ortelius-pi-part-1-the-hardware/).

#### Using the Raspberry Pi Imager

- Repeat these steps for each SD Card or USB flash stick
- The opening screen will present you with `CHOOSE DEVICE` | `CHOOSE OS` | `CHOOSE STORAGE`
- `CHOOSE DEVICE`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/00-choose-device-os-storage.png" alt="raspberry-pi-5" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Choose:</strong> `Raspberry Pi5`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/01-choose-device.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Choose:</strong> `Other general-purpose OS`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/02-choose-other-general-purpose-os.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Choose:</strong> `Ubuntu`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/03-choose-ubuntu.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Choose:</strong> `Ubuntu Server 24.04.4 LTS (64-bit)`
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/04-choose-ubuntu-server-22-04-4-lts-x64.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

#### Choose Storage

Note: This will look different on your machine especially if you are using either SD Card or USB flash drive

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

Remember to change the: `HOSTNAMES` `pi01` | `pi02` | `pi03`

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
- Generate the keys in the home folder at this location `/Users/<your username>/.ssh` if you are using a Mac or Linux
- Generate the keys in the home folder at this location `C:\Users\username\.ssh` if you are using Windows

```shell
ssh-keygen -t ed25519 -C "you-email@domain.com" -f <public key name>`
ssh-keygen -t ed25519 -C "i-love-aliens@ortelius.com" -f pi8s
```

- Then you will end up with two files, one being the `private key` which you never ever share and the other will be the `public key`
- Copy and paste all the scrambled numbers and text from the `public key` each time on the line under `Allow public-key authentication only` for each Pi
- This will allow SSH without a password onto each Pi like this `ssh -i ~/.ssh/<your private key name> <your pi username@<your private ip or domain name> | ssh -i ~/.ssh/pi8s ortelius@pi01.pangarabbit.com`
- Then add this config to `.ssh/config`

```shell
Host pi01.yourdomain.com
 HostName pi01.yourdomain.com
    AddKeysToAgent yes
 IdentityFile ~/.ssh/<private key name>
 User <your user>

Host pi02.yourdomain.com
 HostName pi02.yourdomain.com
    AddKeysToAgent yes
 IdentityFile ~/.ssh/<private key name>
 User <your user>

Host pi03.yourdomain.com
 HostName pi03.yourdomain.com
    AddKeysToAgent yes
    IdentityFile ~/.ssh/<private key name>
 User <your user>
```

- You can also reference this document from [GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) for an alternative explanation

<strong>Check:</strong> `all boxes specific to your needs.`
<p></p>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/10-options.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Click:</strong> `YES to apply the OS customisation settings`
<p></p>
<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/11-use-os-customisation-yes.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Rinse and repeat for each SD Card or USB flash stick. </strong>
<p></p>
<br>


#### Helm-Repository | Netdata

- Lets add the Netdata Helm repository
- A Helm repository is a collection of Helm charts that are made available for download and installation
- Helm repositories serve as centralised locations where Helm charts can be stored, shared, and managed
- Create a file called `netdata.yaml` in the helm-repositories directory and paste the following YAML


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
