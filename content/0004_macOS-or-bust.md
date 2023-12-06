---
Title: macOS or Bust! How to do the unfeasible
Date: 2023-02-28
Category: os dev
Tags: nixie, macos, rant
Slug: 0004_macOS-or-bust
Summary: Well… it's been a while since I last wrote an article. But I wasn't just sitting idly by, watching paint dry. I've been busy fighting macOS as well.
---

Well… it’s been a while since I last wrote an article. But I wasn’t just sitting idly by, watching paint dry. I’ve been busy fighting macOS as well.

<!--more-->

Now, you may have noticed that I just released a tool called [Nixie](https://github.com/nixie-dev/nixie). Nixie installs Nix in your repository, in such a way that your contributors don’t actually have to do anything special to themselves jump into the Nix workflow.

In order to achieve that level of integration, I had to figure out a way to present the infamous Nix Store at the root of the filesystem.

On Linux, that’s simple enough. Unprivileged namespaces have made it easy to bake non-root Nix Store support straight into the upstream Nix binary. It’s on Apple’s Darwin that things start to get a little messy…

## No namespaces? No problem!

So, what do you do when you don’t have mount namespacing? You fake it! With [fakedir](https://github.com/nixie-dev/fakedir), more specifically.

I had to get creative to implement a fake root directory at the system root, when that very system root is now locked down entirely on modern macOS.

### Let’s try `chroot`?

Now, that is a reasonable solution, but it does require root access, making it less than ideal from a usability standpoint.

But that wasn’t the biggest issue. Can you hazard a guess as to which *other* crucial feature macOS absolutely lacks but is crucial for this? Yep, **union mounting**, the ability to “merge” two unrelated directories or filesystem on top of each other, which would have been a hard requirement to create the `/nix` directory to mount things onto in the first place. So that’s a nope.

### The `Virtualization` framework?

Okay, fine, macOS doesn’t have container tech, but it has virtualization, right? *(oh dear…)*

There is a built-in `Virtualization` framework, with functions to create a macOS VM without too much suffering, but it has three big issues:

- It only exists on Apple Silicon
- It requires entitlements (which a single-file script cannot have)
- It requires *installing macOS from scratch*. Just imagine the launch times.

So that’s also absolutely out the window, and I’m not shipping a fragile solution like Qemu either.

### … just rewrite the filesystem calls

oh no. OH NO-

**that’s *precisely* what I set out to do.** I must hate myself. Also, that’s where [fakedir](https://github.com/nixie-dev/fakedir) comes in.
