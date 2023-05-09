---
date: 2023-03-08
title: "Enter the Dragon/CKA"
summary: "Crushing the CKA Bruce Lee style"
author: Sacha Wharton
---

![Bruce Lee Enter The Dragon](https://wallpapercave.com/wp/wp380284.jpg)

## Enter the ~~Dragon~~ CKA
This is my blog post about taking on the CKA in the spirit of Bruce Lee based on his film [Enter the Dragon](https://www.imdb.com/title/tt0070034/?ref_=tt_sims_tt_i_4) a Kung Fu cult classic.
The CKA was my dragon which I was determined to conquor which I did on 27 March 2023. I have shared my strategy and experience which I used to subdue the beast.

## Strategy

I did the following:
- CKA course work on [Kodekloud](https://kodekloud.com/) presented by Mumshad Mannambeth which I highly recommend.
- The practice tests that came with the Kodekloud CKA over and over and tested out strategies for saving time.
- All the [Killacoda](https://killercoda.com/) practice scenarios.
- I did [Killershell](https://killer.sh/) multiple times. Killershell for me is the closest to the exam you will get and it really prepped me for how to move quickly with confined screen real-estate. I was able to develop excellent muscle memory and test out strategies for saving time. It gave me the chance to experiment with multiple terminals and how to position my browser and how much to zoom so that I could gain as much screen real estate as possible to avoid context switching.
- For this exam you must practice and practice as time is really against you.
- When you start reading the question you should already be formulating your plan of attack.

## Experience
- It takes 24hrs to get your results.
- You get one free rewrite.
- You only have 6 minutes a question which should leave you with roughly 16 minutes to review flagged questions. I finished the exam with 10 seconds to spare.
- Don't get hung up on a question, remember you only have 6 minutes a question. Just answer what you can and move on otherwise you will not finish.
- Make sure you go through this page thoroughly https://docs.linuxfoundation.org/tc-docs/certification/tips-cka-and-ckad
- The proctor will inspect every corner in your room where you are writing - under the mouse pad, under the keyboard, under your computer. It felt like I was moving house. I removed all paper, all electronic devices, covered the windows, remove all smart devices etc.... go through the URL above thoroughly. I also got asked if I had a table with a glass top.
- If you so much as whisper the question to yourself the proctor will interrupt you in the chat window reminding you not to whisper as this is not allowed, which I found irritating and distracting when you are trying to chase down 17 questions in 2 hours. Especially since the chat window covers a part of your screen. I also feel that this is a frustrating rule as some of us whisper a question to ourselves to comprehend the required tasks.
- You can use any screen as long as there is only one screen and you must have a webcam of course, so if your camera is built into your Mac like mine is I was forced to use my mac screen, luckily mine is 16inch if you have smaller than 15inch you will suffer with the lack of screen real estate. Practise using the smaller screen if you are forced to as it develops muscle memory.
- If you can shave a second here and there its worth it, 2 hours is super short.
- Be quick and comfortable on the Bash command line and get familiar with VI.
- I did not bother with TMUX I felt it just added more things I have to remember.
- I just opened two terminals and split them by resizing them which is way easier and changed my font to bright green and enabled selection copy.
- I zoomed the Kubernetes documentation page to 90% to score more real estate and I also had the shortcuts on the side of the Kubernetes documentation page visible to various topics.
- You can write on weekends which is what I did as this allows to prepare
- Use declarative commands as much as you can even just to build basic yaml template. This saves a ton of pain with indentation and creates a YAML template which is a massive time saver.

## Keyboard Kung Fu

I used the below commands alot!

```
kubectl create
kubectl create -f
kubectl run
kubectl replace --force -f
kubectl get
```

Get very familiar with the Kubernetes cheatsheet so that you can practice commands and get innovative with some of the examples.
For example this one below is fantastic to figure out your JSON path query.

#### Produce a period-delimited tree of all keys returned for nodes | Helpful when locating a key within a complex nested JSON structure
```
kubectl get nodes -o json | jq -c 'paths|join(".")'
```
#### Aliases that I used
```
alias c='clear'
alias h='history'
alias kcf='k create -f'
alias krff='k replace --force -f'
alias sbash='source ~/.bashrc'
alias ebash='vi ~/.bashrc'

# Saves a ton of typing which means you save time
export do="--dry-run=client -oyaml"

# Speeds up deleting a pod drastically
export now="--force --grace-period 0"
```

Go forth and conquor! If I can do it so can you!

![Bruce Lee Fly Kick](https://johnrieber.files.wordpress.com/2015/04/iconic-bruce-lee.jpg)