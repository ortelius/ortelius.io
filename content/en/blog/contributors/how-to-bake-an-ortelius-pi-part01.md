---
date: 2024-04-05
title: "How to Bake an Ortelius Pi Part 1 | The Hardware"
linkTitle: "How to Bake an Ortelius Pi Part 1 | The Hardware"
author: Sacha Wharton
---

<div class="col-center">
<img src="/images/orteliuspi-part1.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>

- [Introduction](#introduction)
- [Roadmap](#roadmap)
- [My Home Setup](#my-home-setup)
- [NFS Storage](#nfs-storage)
- [Raspberry Pi Imaging Utility for the Ubuntu 22.04 LTS x64 OS installation](#raspberry-pi-imaging-utility-for-the-ubuntu-2204-lts-x64-os-installation)
- [Preparing the OS for installation](#preparing-the-os-for-installation)
  - [USB 3 flash drives](#usb-3-flash-drives)
  - [Example from configuring my Pi to use USB flash sticks](#example-from-configuring-my-pi-to-use-usb-flash-sticks)
- [Using the Raspberry Pi Imager](#using-the-raspberry-pi-imager)
  - [Choose Storage](#choose-storage)
- [Conclusion](#conclusion)
- [Next Steps](#next-steps)

### Introduction

I recently started building a [Cloud Native Environment](https://filedn.eu/lJEPcSQWQQPRsWJKijxnXCQ/ortelius/gitops/01-ci-dev-ortelius-cloudnative-architecture-poc.html) on three [Raspberry Pi](https://www.raspberrypi.com/]) 4 B's with a [Synology DS413j NAS (ARMv5 architecture)](https://www.synology.com/) running the latest firmware update DSM 6.2.4-25556 Update 7 [Release Notes](https://www.synology.com/en-af/releaseNote/DSM) and so far its been quite a journey. In this blog post I would like to share my undertakings in a series of blog posts.

Raspberry Pi 4 B's pack a punch with a Broadcom Quad Core ARMv8 processor and 8 GB ram. They are very light on electricy thus saving on cost and only require a single small UPS (uninterruptable power supply) to stay online. They are very mobile and take up extremely little space in my man cave.

### Roadmap

`hardware --> networking --> orchestrator --> storage --> certificate store --> load balancer --> proxy/api gateway --> evidence store --> cloudflare --> observability --> secret store --> zerotier --> everything else`

### My Home Setup

- 3X [Raspberry Pi4 Model B 8GB Red/White Official Case Essentials Kit Boxed White Power Supply](https://www.pishop.co.za/store/custom-kits/raspberry-pi4-model-b-8gb-redwhite-official-case-essentials-kit-boxed-white-power-supply)
- Please go to this link for the full hardware specs [Raspberry Pi 4 B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/specifications/)

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/raspberry-pi-4b.png" alt="raspberry-pi" height="300px" width="650px" />
</div>
<p></p>
<br>

Use this [article](https://www.tomshardware.com/best-picks/raspberry-pi-microsd-cards#section-quick-list) from Toms Hardware for microSD card benchmarking. I can also recommend [Jeff Geerling](https://www.youtube.com/@JeffGeerling) for all things Raspberry Pi.

- 3X 32GB Samsung Evo+ microSD Card (UHS-II: theoretical maximum transfer speeds up to 312MB/s)

<strong>or</strong>

- 3X 32GB USB 3 flash drives but this comes with some caveats performance wise which I will discuss further on

- 1X Screen HDMI
- 1X Keyboard USB
- 1X [KVM Switch device](https://www.amazon.com/3-port-kvm-switch/s?k=3+port+kvm+switch)
- 1X 8 Port Switch
- Networking | Use [DHCP](https://www.youtube.com/watch?v=ldtUSSZJCGg) or [static IP addresses](https://www.pcmag.com/how-to/how-to-set-up-a-static-ip-address) in a [private range](https://www.lifewire.com/what-is-a-private-ip-address-2625970).
- 1X UPS (Uninterruptable Power Supply) for the Pis and switch | Something like this [Mecer 650VA](https://mecer.co.za/mecer-line-interactive-ups/). Please note this is a South African brand of UPS but I am showing this for example purposes. The Mecer brand is extremely good and all my lead acid battery UPS's are from Mecer. I have a combination of the 650VA, 2000VA and 3000VA to keep me going (7 in all)

### NFS Storage

- [What is network-attached storage (NAS)?](https://www.purestorage.com/knowledge/what-is-nas.html)
- [What is NFS?](https://www.minitool.com/lib/what-is-nfs.html)
- 1X NAS device for the NFS storage which can be a virtual machine, laptop, old desktop or Synology type device. There are plenty options out there just do a internet search.
- 1X 650VA UPS

### Raspberry Pi Imaging Utility for the Ubuntu 22.04 LTS x64 OS installation

The imaging utility will be used to install Ubuntu onto your SD Card or USB flash drive.

- [Raspberry Pi imaging Utility](https://www.raspberrypi.com/software/)
- [Ubuntu Server 22.04 LTS x64 for Raspberry Pi](https://ubuntu.com/download/raspberry-pi)
- MacOS install with Brew package manager ```brew install raspberry-pi-imager```
- Windows install [here](https://downloads.raspberrypi.org/imager/imager_latest.exe)

### Preparing the OS for installation

- Install Raspi-Config on each Ubuntu server `sudo apt install raspi-config -y`

#### USB 3 flash drives

If you use USB flash drives you will need to do the following as mentioned in this [post](https://forums.raspberrypi.com/viewtopic.php?f=28&t=245931). It all comes down to the implementation of the UAS specification.

- In the article the author says to go here `/boot/cmdline.txt` but on my Pi4 I had to go here `/boot/firmware/cmdline.txt`
- A Pi has no BIOS so this is how you configure a Pis BIOS by editing `/boot/firmware/cmdline.txt`
- Install dmesg `sudo apt install dmesg -y`
- Raspi-Config allows you to configure your Pis hardware without having to fiddle with `/boot/firmware/cmdline.txt`
- Run Raspi-Config like this `sudo raspi-config` and you will get a screen like this

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/12-raspi-config.png" alt="raspberry-config" height="300px" width="650px" />
</div>
<p></p>
<br>

- Use Raspi-Config to configure boot order, enable or disable read-only filesystem and many other tweaks
- I found it much easier just to use the right microSD Card and skip all this but it was still a good learning curve

#### Example from configuring my Pi to use USB flash sticks

- You will need to do this for each Pi
- As you can see I was using a [32GB Lexmark USB flash stick](https://www.amazon.co.uk/Lexar-Jumpdrive-Flash-Drive-Memory/dp/B008XIYKP2)

```shell
Lexmark 32GB USB
Product: USB Flash Drive
[    2.885515] usb 2-2: Manufacturer: Lexar
[    2.885527] usb 2-2: SerialNumber: AA0G3FCUYDI06HNV
[    3.007270] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    3.157900] usb 1-1: New USB device found, idVendor=2109, idProduct=3431, bcdDevice= 4.21
[    3.157922] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
```

- Getting your USB flash drives details

```shell
sudo dmesg | grep usb-storage
```

```shell
[    0.000000] Kernel command line: coherent_pool=1M 8250.nr_uarts=1 snd_bcm2835.enable_compat_alsa=0 snd_bcm2835.enable_hdmi=1 bcm2708_fb.fbwidth=1600 bcm2708_fb.fbheight=900 bcm2708_fb.fbswap=1 smsc95xx.macaddr=DC:A6:32:B1:5D:DF vc_mem.mem_base=0x3eb00000 vc_mem.mem_size=0x3ff00000  usb-storage.quirks=05dc:a838:u cgroup_enable=memory cgroup_memory=1 console=ttyS0,115200 dwc_otg.lpm_enable=0 console=tty1 root=LABEL=writable rootfstype=ext4 rootwait fixrtc quiet splash
[    2.958568] usb-storage 2-2:1.0: USB Mass Storage device detected
[    2.958964] usb-storage 2-2:1.0: Quirks match for vid 05dc pid a838: 800000
[    2.959059] scsi host0: usb-storage 2-2:1.0
[    2.959390] usbcore: registered new interface driver usb-storage
```

```shell
usb-storage.quirks=05dc:a838:u
```

- Pi01's BIOS config at `/boot/firware/cmdline.txt` aka Pi 4 BIOS file

```shell
usb-storage.quirks=05dc:a838:u cgroup_enable=memory cgroup_memory=1 console=serial0,115200 dwc_otg.lpm_enable=0 console=tty1 root=LABEL=writable rootfstype=ext4 rootwait fixrtc quiet splash
```

### Using the Raspberry Pi Imager

- Repeat these steps for each SD Card or USB flash stick
- The opening screen will present you with `CHOOSE DEVICE` | `CHOOSE OS` | `CHOOSE STORAGE`
- `CHOOSE DEVICE`

<div class="col-left">
<img src="/images/how-to-bake-an-ortelius-pi/part01/00-choose-device-os-storage.png" alt="raspberry-pi-4b" height="300px" width="650px" />
</div>
<p></p>
<br>

<strong>Choose:</strong> `Raspberry Pi4 models B, 400 and Compute Modules 4, 4s`
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

<strong>Choose:</strong> `Ubuntu Server 22.04.4 LTS (64-bit)`
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

### Conclusion

By this stage you should have three Pi 4 B's running with Ubuntu 22.04.4 LTS each configured for SSH with a password or preferably a SSH private key and public key. Stay tuned for part 2 where we will dive into DHCP, NextDNS, NFS and install MicroK8s.

### Next Steps

[How to Bake on Ortelius Pi | Part 2 | The Preparation](https://ortelius.io/blog/2024/04/05/how-to-bake-an-ortelius-pi-part-2-the-preparation/)

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
