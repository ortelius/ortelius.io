# Ortelius Website

The website is based on the [hugo](https://gohugo.io/) web server + the [docsy](https://www.docsy.dev/) theme.

Hugo uses [markdown](https://www.markdownguide.org/) in conjunction with the themes to drive the formatting of the page content as html.  Git is used to persist the markdown and themes and provides updating the web site via a Pull Request.  The [Ortelius Website Repo](https://github.com/ortelius/website) is where the production site is created from.  Please fork the repo and use Pull Requests to get your changes merged back into the production site. See [Contributing](https://docs.ortelius.io/guides/contributorguide/) to Ortelius Project for details.

## Git Repo Layout

- /
  - /archetypes: default page type
  - /assets: override theme css and logo image
  - /chart: helm chart for deploying to Kubernetes
  - /cloudbuild: clouldbuild yaml to create the docker image, push to quary and deploy with DeployHub to the cluster
  - /content/en: markdown of the site content
  - /layouts: override theme layout for pages and divs on the pages
  - /public: used for runtime execution, ie. generated site
  - /resources: used for runtime execution, ie. generated site
  - /static: static files such as images, pdfs, videos, js
  - /themes: docsy theme
  - Dockerfile: docker file to build the image using klakegg/hugo:ext-alpine

## Getting Started

1. Fork and clone the repo
2. [Install hugo](https://gohugo.io/getting-started/installing/)
    - Make sure for Windows to install hugo-extended
3. Open a command prompt and cd to your repo dir
4. Run: `hugo server`
5. Access the local site using `http://localhost:1313`

_Note: the site will automatically refresh on a file save._

## Editing

[Visual Studio _which is free_ ](https://code.visualstudio.com/) has a couple of useful plugins:
* Docsy (Etienne Dldc)
* Markdown Preview Enhanced (Yiyi Wang)
* markdownlint (David Anson)

## Merging your changes

Create a PR in the [ortelius/website](https://github.com/ortelius/website) repo referencing
your forked repo as where to merge from.  

Make sure that you squash your commits in your local repo before doing your push.  See the [Git PR Cheatsheet](https://docs.ortelius.io/guides/contributorguide/pull-request-cheat-sheet/) for instructions.  Also, reference any issues for example as `resolves ortelius/ortelius#201` so they will close on the completion of the merge.

After your changes have been merge the Cloudbuild job will trigger and push your chnages to the Kubernetes cluster and the [production site](https://ortelius.io).
