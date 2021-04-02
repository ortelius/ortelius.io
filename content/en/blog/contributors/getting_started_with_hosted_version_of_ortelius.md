---
date: 2021-03-31
title: "Getting started with SaaS version of Ortelius"
linkTitle: "Getting started with SaaS version of Ortelius"
author: Natch Khongpasuk
---

If you're looking for a microservice management solution for your software systems or applications, Ortelius can do that for you. At 10,000 foot view, Ortelius provides a method to track the collection of application services. It offers solutions for cataloging, versioning, sharing and deploying microservices across various platforms; cloud, virtual, physical and even Kubernetes environment.

### Choose the version of Ortelius that is best for you

Ortelius comes in 2 versions, you can host Ortelius on your servers or use the SaaS version of Ortelius. There is a documentation on how to install Ortelius on-premise <a href="https://docs.ortelius.io/guides/userguide/installation-and-support/0-on-premise-installation-for-pro/" target="_blank">here</a> or you can also check out a walk-through blog on steps to install it on your premise <a href="/blog/2021/03/18/installing-ortelius-on-premise/" target="_blank">here</a>.

In this article, as the title suggests, we will focus on the SaaS version. 

### First step: Signing up

The SaaS version of Ortelius is based upon the Ortelius open source project and is hosted under DeployHub site. To get started, follow this [link](https://console.deployhub.com/dmadminweb/signup.html). You will be asked to fill the form with basic information including the company name and project name. Hit Signup once you're done.

![DeployHub Signup Page](/images/blog/getting_started_with_saas_version_of_ortelius/signup_page.png)

**Note** *Company name: As part of the domain driven structure, the company name you insert is going to be created as a company domain under the global domain. Also, Your project name is going to be inserted under your company domain.*

*Interested in Domain Driven Design? Check out <a href="https://www.deployhub.com/domain-driven-design/" target="_blank">this article</a> from DeployHub

After you hit signup, a new Hipster Store simple application will be provisioned for under your project. You will also receive an email from DeployHub. That email will contain your unique user ID as well as your client ID along with other links and useful information.

Yes, the next logical step is to go and check your mailbox that you sign up with. 

![Sample Signup Email](/images/blog/getting_started_with_saas_version_of_ortelius/sample_email.png)

Please disregard the first paragraph of the email for now. What you need now is your client ID. This client ID will act like a token that gives you access between the Ortelius SaaS console and your local network.

### Installing SaaS Proxy

The Ortelius SaaS version uses a reverse proxy docker container which is required to run inside of your network. This proxy will allow communication between Ortelius and services inside your local network such as local Git repository or Jenkins servers. Every communication is always outbound from the proxy server. This means that you are not required to open any ports or disable any filter in your firewall to allow the packets to travel into your network. More detailed information about the reverse proxy can be found [here](https://docs.deployhub.com/userguide/installation-and-support/0-saas-and-reverse-proxy/#installing-the-reverse-proxy-for-managing-deployments)

Now we're going to assume that you already have Docker installed on your machine. We will need the client ID attached from the email to configure the reverse proxy container. From your email, copy your client ID, open your favorite terminal and run the following command
```sh
export CLIENTID=<client ID>
```

Next, you will need the Reverse Proxy image to create and run a container. Lucky you, you do not need to create the proxy image from scratch. DeployHub already takes care of that for you. Pull the Reverse Proxy image from quay.io with the command below:
```sh
docker pull quay.io/deployhub/deployhub-rproxy:latest
```
![Pull Docker Reverse Proxy Image](/images/blog/getting_started_with_saas_version_of_ortelius/docker_pull_reverse_proxy.gif)

Find the Reverse Proxy image SHA with the following command
```sh
docker images | grep deployhub-rproxy | grep latest
```

![Get docker image SHA](/images/blog/getting_started_with_saas_version_of_ortelius/docker_grep_sha.png)

In my case, the image SHA is `68e1f2ef3320`

Run the Reverse Proxy container with the docker run command below (substitute the image SHA value)
```sh
docker run -v ~/.ssh:/keys:Z -v ~/ortelius/data:/var/lib/pgsql/data:Z -v ~/ortelius/logs:/opt/ortelius/logs:Z -p 7171:8080 -d --hostname docker_dhpro 68e1f2ef3320

## check if the container is running by
docker container ls # or docker ps
```

### Accessing Ortelius Console

Once you start the Reverse Proxy container, head over to the DeployHub console page with the following <a href="https://console.deployhub.com/dmadminweb/Home" target="_blank">link</a>. You will be presented with the Ortelius Login popup. Fill in your credentials to authenticate yourself into the Ortelius console.

![Console Login](/images/blog/getting_started_with_saas_version_of_ortelius/console_page.gif)

The Reverse Proxy status is located at the top right of the page. With a running Reverse Proxy container, you should be able to see the message `2 of 2 Reverse Proxy Running`

![Reverse Proxy Status Message](/images/blog/getting_started_with_saas_version_of_ortelius/reverse_proxy_status_message.png)

**Note** *You may see `1 of 2 Reverse Proxy Running` message on your first login. Do not panic. It may take a couple of minutes for the Reverse Proxy container to get up and running and start communicating with the SaaS database.*

### Conclusion

Congratulations, that's basically all the process you need to get up and running. You are now ready to start using the SaaS version of Ortelius to: either start experimenting the sample Hipster Store application to test the deployments or start creating your own components, application versions and building up your own environments on the SaaS version of Ortelius.

*Contributed by Natch Khongpasuk, Ortelius Contributor*