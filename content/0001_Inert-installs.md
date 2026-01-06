---
title: Installers are evil and here's why
Date: 2021-04-25
Category: os dev
Tags: installers, signing, rant
alias: /2021/04/installers-are-evil-and-heres-why/
Slug: 0001_Inert-installs
Image: /images/0001-wizard.png
Summary: There's one aspect that's always really annoyed me about Windows. Except this time, all major operating systems can be affected. _Installers_ are one of the biggest cryptographic and social engineering security holes out there...
---

There's one aspect that's always really annoyed me about Windows. Except this time, all major operating systems can be affected. _Installers_ are one of the biggest cryptographic and social engineering security holes out there...

<!--more-->

![A typical installer wizard on Windows](/images/0001-wizard.png)

> Okay, now what?

If you already saw my comments over on reddit and stuff, you may have figured out that I'm a proud Arch Linux User™ btw _(there, I said it)_, with a little twist.

My particular install calls itself "Arch Linux Atomic", and for good reason. Taking inspiration from the likes of Fedora Silverblue, I am trying to build an Arch system where most system directories (namely `/usr` and `/etc`) remain _read-only_.

> Wouldn't that be a hassle? Doesn't it break `pacman`?

There's the thing. To me, Arch Atomic is a little experiment on trying to distinguish user-installed programs from the _system state_. The logic is that as long as the system state works, nothing can possibly break from user-side tinkering, and ideally the user won't feel handcuffed by their OS.

The key to achieving this is to have the system precisely control the way software is installed. To pretty much no one's surprise, that means that I try to rely as much as possible on _package managers_. Because I can tell the package manager how to install things on my particular system, and retain compatibility with official Arch Linux repos.

## Signing is cool

> Let me guess, you're hating on _installers_ because you prefer _package managers_? I knew it, you're a Linux shill!

Woah, hold that thought. There's one other thing that's really nice about package managers, and that pretty much no one cares about except when it breaks. That neat little thing is _cryptographic signing_. The ability to ensure, within reasonable doubt, that the random program you're downloading is in fact _trustworthy_.

As they say, _"prevention is better than cure"_. When a package manager sees a signing discrepancy, it outright **blocks** you from installing the program. That's the best kind of safety feature -- it gets out of the way and is simple to understand, yet very hard to break without direct machine access _(but that's another problem entirely)_.

Programs downloaded from a random place can only be trusted if the entire operating system implements that signing feature. For example, macOS does, and _obviously_ are [milking developers for it](https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution).  
Still, it works.

Windows _kinda_ does too, but only when UAC is involved, and it's [not remotely enforceable](https://security.stackexchange.com/questions/202409/what-is-the-benefit-of-signing-an-executable-that-is-not-a-driver-on-windows/202412), and if you think _end users_ are going to tell the difference between a yellow and red UAC box, you're delusional.

## Don't trust strangers

> Yeah, but as you said, macOS _installers_ are signed, so we're all good, right?

[Not right](https://www.youtube.com/watch?v=c13g1L8ycIk).

Say a malicious third-party _somehow_ got through the signing and authoring process. Let's review what they can, and cannot do:

- **Installer**: An installer (especially the system-wide kind) is like a black box. It does some voodoo with elevated access, on the basis that you _trust_ it to install a program. **It can choose not to and there's nothing you can do about it.**
- **Package manager**: Package management is simple. Read through some info, move files to where they should be, update software index, done. We know what's going on, and at no point is the program needlessly elevated. Or run, for that matter. **Package managers treat applications as inert data, meaning they cannot take advantage of elevated privileges.**

The real strength of a package manager is that it makes privilege escalation requests _unusual_.

On Windows, for example, everything shows a boring, identical UAC dialog box. Annoying, get out of the way, done. Now your system's broken.

On macOS, the permission dialog is not only more unusual, it's also more _detailed_. It's worth taking a good look at, because you don't see it everyday, and instead of abstract concepts like _administrator access_, it gives you a down-to-earth explanation of what the app is asking for.

On the usual Linux system, there's `root` and there's plebs. No in-between. Virtually no app will ask you for root access, save from the package manager and the occasional system utility. That makes it look like a _dangerous red button_, rather than a boring formality. When you see `sudo`, **you think twice** _(hopefully)_.

## TLDR

An **installer** is a random program that runs as Administrator and you _trust_ will install something. Nothing is enforcing it to follow conventions (leading to bit rot) or do what it says at all (leading to viruses).

You _could_ enforce signing. Signing in a curated app store is kind of a _given_. Signing on every single program on the system is frowned upon at best.

Your best weapon is to educate users. Eliminating installers removes a reason to accept administrator access prompts, making users more thoughtful about it.
