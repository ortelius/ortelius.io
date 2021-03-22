---
date: 2021-03-18
title: "Installing Ortelius On-Premise"
summary: "Installing Ortelius On-Premise"
author: Aditi Agarwal- Architecture Working Group
---

# Ortelius On-Prem Installation Tips

An Ortelius on-premise installing makes it easy to get started with your microservice management. You install Ortelius by pulling the Ortelius container from RedHat, performing some basic configurations and your ready to run Ortelius on-premise. These steps are all you need to complete the task.

##	Prerequisites
Ortelius runs in a Docker container with all the required dependencies included, such as Postgresql. Docker is the only prerequisite for your on premise installation of Ortelius. If you do not have Docker, below are steps for building a Docker environment.

## Docker Installation

1. Setup RedHat VM in VirtualBox.
2. Setup yum and docker repo in VM.

<div>
<img src="/images/onpreminstall/docker1.png" alt="Installing Docker" height="33x" width="451px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker2.png" alt="Installing Docker" height="37x" width="451px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker3.png" alt="Installing Docker" height="120x" width="452px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker4.png" alt="Installing Docker" height="40x" width="452px" />
</div> 
<p></p>
<div>
<img src="/images/onpreminstall/docker5.png" alt="Installing Docker" height="130x" width="602px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker6.png" alt="Installing Docker" height="80x" width="602px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker7.png" alt="Installing Docker" height="80x" width="602px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/docker8.png" alt="Installing Docker" height="73x" width="602px" />
</div>

## Test Docker Installation

### 1. Start the Services 
<p></p>
<div>
<img src="/images/onpreminstall/dockertest1.png" alt="Testing Docker" height="56x" width="602px" />
</div>

### 2. Check the Status
<p></p>
<div>
<img src="/images/onpreminstall/dockertest2.png" alt="Testing Docker" height="127x" width="602px" />
</div>

### 3.Run the Docker Commands
<p></p>
<div>
<img src="/images/onpreminstall/dockertest3.png" alt="Testing Docker" height="127x" width="602px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/dockertest4.png" alt="Testing Docker" height="56x" width="602px" />
</div>
  
## Installing the Ortelius Docker Image
The Ortelius Docker Image is found on the RedHat Quay Docker Registry. Follow the steps below to install Ortelius into your Docker installation.

### 1. Pull Ortelius from RedHat Quay Docker Registry
<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker1.png" alt="Ortelius Docker" height="103x" width="602px" />
</div>
<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker2.png" alt="Ortelius Docker" height="68x" width="602px" />
</div>
<p></p>
Wait until the image is being pulled and the above message doesn’t display. After completion, check the image pulled by issuing docker.
<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker3.png" alt="Ortelius Docker" height="68x" width="602px" />
</div>

### 2. Create a Directory to Persist the Postgres Database
<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker4.png" alt="Ortelius Docker" height="38x" width="608px" />
</div>

### 3. Find Your SHA
<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker5.png" alt="Ortelius Docker" height="49x" width="608px" />
</div>
<p></p>
SHA is given in the third column,

~~~bash
e.g. - 789c2713c047 
~~~

### 4. Start the Container for Linux and OS/X
Use the image SHA from Step 3 as the last parameter to the docker run.

<p></p>
<div>
<img src="/images/onpreminstall/orteliusdocker6.png" alt="Ortelius Docker" height="51x" width="608px" />
</div>

### 5. Access Ortelius From Your Browser
Ortelius is accessible through the following URL:

~~~bash
http://<Ortelius DNS name>:7171/dmadminweb/Home
~~~

Your Ortelius DNS name is the server where you installed Ortelius.

<p></p>
<div>
<img src="/images/onpreminstall/screen.png" alt="Ortelius Welcom" height="364x" width="602px" />
</div>
<p></p>
To log in please use:

~~~bash
User Id: admin 
password: admin
~~~
<p></p>
<div>
<img src="/images/onpreminstall/screen2.png" alt="Ortelius Welcome" height="346x" width="602px" />
</div>
<p></p>
<strong>Welcome to Ortelius!</strong>
