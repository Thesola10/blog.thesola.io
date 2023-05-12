---
title: "Our relationship to code: The Year of the Linux Desktop won't happen, and that's fine"
date: 2021-09-03
thumbnailImagePosition: left
thumbnailImage: /images/0003-ubuntu-laptop.jpg
categories:
- tech
- os dev
tags:
- our relationship to code
---

Linux, and the community of hackers and users that formed around it, make for a formidable operating system product, both for software development and everyday use. Clearly it is superior, so _where are all the apps?_

<!--more-->

![A laptop with Ubuntu](/images/0003-ubuntu-laptop.jpg)

> It's a conspiracy from Microsoft!

That's an interesting point, because it used to be [very much true](https://en.wikipedia.org/wiki/Embrace,_extend,_and_extinguish), so it isn't unreasonable to be wary of Microsoft today. However, times have changed, and they stopped fighting their pointless war. After all, Windows is probably not even profitable to them anymore.

But that is besides the point. Linux has indeed essentially _dominated_ most devices with a CPU and memory, so why aren't we seeing it on desktops?

## A ship with no captain

> But Android is the dominant mobile OS! The desktop is dying anyway.

Ah, the Canonical argument, I see.

You may not have noticed, but there was a change of tone in Ubuntu development and marketing. This is important, because Ubuntu still represents the definition of the typical Linux desktop.

Back in the good old days of 2011, Canonical's first objective was Ubuntu on personal desktop computers. Whichever way you looked at it, GNOME was not exactly pretty, and KDE was still knee-deep in Qt licensing issues. Thus, they decided to start development on the Unity desktop, which would become the trendsetter for various features we've come to expect on modern Linux. That, and Unity would eventually also drive the Ubuntu Touch project.

Fast-forward to 2016, and Canonical has given up development on Mir and Unity 8, both due to frictions with the broader Linux community, and the failure and abandonment of Ubuntu Touch. Around the same time, Windows Subsystem for Linux came out, and the first distribution available at launch was _none other than Ubuntu._

The Ubuntu Desktop effort, which used to be front-and-center on Ubuntu's website, is no longer mentioned. They now focus on WSL, and the Internet of Things. And I believe that this left a void in the Linux desktop community. Because no matter how flawed it was, Ubuntu had the brand power. Ubuntu was the flagship, the one solution that we could point to as the definitive "Linux desktop". _Now, it has all but fizzled out._

## A labyrinth with no way out

> But Fedora/Zorin/elementary/_(insert distro here)_ will be the new standard! Why aren't people adopting those?

There are an uncountable number of Linux distributions, which aren't completely compatible with each other, and whose software offering isn't necessarily consistent. For a long time, and especially these days, we have been experiencing _fragmentation_.

With an open-source project, when something isn't quite right, you will usually be tempted to _fork it_. This is a great freedom to have, but now there are two, hardly distinguishable projects. It's only natural that, when given the option, [everyone wants to "do it right"](https://xkcd.com/927).

A Linux distribution, at heart, is a set of software packages that are built and distributed together with intent to provide a ready-to-use version of Linux. The prime philosophy of GNU, Linux, and pretty much all other constituent projects, is that _only source code is officially distributed._ Software is shipped with a set of compile-time flags, so that the user can configure it just right for their system.

A distribution's job is to pick out the best compile-time flags for their projects, build them on the same shared libraries, and regularly keep them up to date. This not only means that _some distributions may be lagging behind on updates_, but also and more importantly, that _important configuration options differ and are obscured_. 

Both of these issues make software support a lot harder for any developer, because suddenly there isn't one, but several different versions and flavors of your software floating around at one time. _And whether or not your software makes it to a distribution depends on the distributor, so god forbid you keep your code proprietary._

Let's not get into details on how there are _multiple ways to do basic things_ on Linux. As you can see, there is a certain philosophy, and it is incompatible with software distribution at scale. _You can't just roll out infinite package maintainers._

## A product with no market plan

> But Flatpak and AppImage are solving those issues, right?

That's if the community even wants to accept those (they don't). Also, [AppImages are a very bad idea](/2021/0001_inert-installs), but whatever.

There is one other [thing](https://youtu.be/BEcoJYMB_SA) that Ubuntu had, and I cannot seem to find in other Linux distributions. A sense of _identity_.

The people who decide on where the Linux desktop is headed, don't seem to agree on a single identity. Some even [want none at all](https://stopthemingmy.app). Sure, a bland and neutral appearance might help users customize it... but most user themes usually revolve around Windows and macOS look-alike anyway...

The Linux desktop wants to be the _jack of all trades_, but ends up being _master of none_. It doesn't have a **definitive, be-all end-all appeal**, and it's hard to sell users on something if we can't even show them what it's supposed to "look like".

I know it may seem superficial, but looking at Windows starting with XP, or Mac OS X, they have a strong identity. Fedora is just default GNOME, elementary is just a macOS wannabee, and Zorin's main sales pitch is literally _its ability to look and feel like competitors_.

## And yet, it lives on

> So all hope is lost? I thought you said it was "fine"?

We don't have a legendary startup tune. We don't have a distinct desktop experience. That's because we want the user to design their own.

We don't have a single packaging format. Our shared libraries are a mess. That's because package maintainers are [protecting us](/2021/0002_audacity).

We don't have a company fully devoted to the Linux desktop since Canonical. That's because profit would prevent us from making it the best it could be.

Linux has shown that people can come together to do great things, with no compensation. Before we even begin to think about sharing the Linux desktop, we need to answer one crucial question: _**What even is the Linux desktop?**_


_Never give up, guys._
