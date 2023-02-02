---
# Template for an Ortelius Hugo Blog Post
# Hugo frontmatter, this provides metadata and structural information about our page
# For more information: https://gohugo.io/content-management/front-matter/
#
# title: Defines the title of our content within the UI
title: "Ortelius Blog Template" 
# date: date is used for ordering our blog posts, format is: YYYY-MM-DD
date: 2021-03-21
# summary: Can be used by hugo for additional summary information, and as the .Summary variable
summary: Ortelius GSOC Project Proposal
# author: Name of the blog post author. This is used to display the name ( or names ) at the top of a blog post
author: Owen Bower Adams
# draft: When set to true, prevents the blog post from being rendered unless running hugo serve -D 
draft: true
---

# Hello!
Hello! 

This is the draft template for an Ortelius blog post. If you are seeing this on the public URL, something has probably gone wrong so please log an issue: [Ortelius Github](https://github.com/ortelius/ortelius)

# How to create a new blog post
You have two options for creating a blog post:
1. If you have hugo installed, you can use the steps under 'With Hugo installed locally'
2. If you don't have hugo installed, you can use the steps under 'Without Hugo installed locally'

## With hugo installed locally
To make use of the hugo cli to create your blog post, you'll want to do the following:
- Decide on which category ( represented by folders under content/en/blog ) you want to use, and your blog post title separated by hyphens.
- Run the hugo new blog command from the website root, with the category and title provided. 

For example:
```
hugo new blog/news/theatre-of-the-world.md
```
- Open the file the above command created, for the above this would be:
```
./content/en/blog/news/theatre-of-the-world.md
```
- Edit the frontmatter ( the bit at the top between the --- dividers ) and fill out the summary and your name. You can also update your blog title here if the generated one isn't ideal

For example:
```
---
title: "Theatrum Orbis Terrarum" 
date: 1570-05-20
summary: Theatre of the Orb of the World
author: Abraham Ortelius
draft: false
---
```
- Add your content below the frontmatters final ---. The content must be written in markdown. The commonmark syntax can be referenced here: [Markdown Syntax](https://spec.commonmark.org/0.29/)



## Without hugo installed locally
To make use of this template, you'll want to do the following:
- Copy the template_blog_post.md into a suitable category (represented by folders) under content/en/blog. 

For example:
```
 content/en/blog/news/theatre-of-the-world.md
 ```
- Edit the frontmatter ( the bit at the top between the --- dividers ) with your title, the date for your post, a summary, your name and change draft: true to draft: false. 

For example:
```
---
title: "Theatrum Orbis Terrarum" 
date: 1570-05-20
summary: Theatre of the Orb of the World
author: Abraham Ortelius
draft: false
---
```

- Add your content below the frontmatters final ---. The content must be written in markdown. The commonmark syntax can be referenced here: [Markdown Syntax](https://spec.commonmark.org/0.29/)