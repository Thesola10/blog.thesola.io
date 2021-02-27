---
title: "Find out how this server dropped 200GB in a single day!"
date: 2021-01-25
categories:
- tech
- my server
tags:
- data buildup
- who cares
---

Sysadmins _hate_ him! Okay, maybe not, but still a funny story about how forgotten software data can be difficult to get rid of.

<!--more-->

> Oh noes, all our data's gone again!

Okay, not this time (I think). Let me tell you a little story about the time there really were 200GB worth of data, that came from seemingly nowhere on my server.

As my users may have (unfortunately) noticed, my server has been switching configurations several times, going from [Arch](https://archlinux.org) to [NixOS](https://nixos.org), XFS to Btrfs..., and lately from [Docker](https://docker.com) to [Podman](https://podman.io) (and native NixOS containers).  
Without going into too much detail, you may have guessed that this is, indeed, a pretty big change.

One fateful day, I glance at my _magical dashboard™_ (just a terminal, really), and guess what I see? The main disks' usage, which I had estimated at around 700GB, currently stands at over 900GB...

My first reaction was to fire up my favorite command: `ducks` (that's `du -cksh`, for listing file and directory usage).

```
80K     /var/cache
4.0K    /var/cron
12K     /var/db
0       /var/empty
0       /var/games
```

Aaaand... yeah, it's still hanging there. For a **long** time.

> Must be the size, scanning through 900GB of files isn't reasonable.

Fine. I decide to only scan the `srv` subdirectory, with the permanent data from my known services on the server. In just a couple minutes, I get my answer: 700GB, just as expected.

> I haven't checked my log rotation in a while, wonder where it's at...

So I give it a spin, and look what I find in `/var/log`: For some reason, `sudo-io`'s logs (which record everything going on in a `sudo` session) are taking up a good hundred gigabytes.

> Let me quickly delete that, and...

Well, _quickly_ indeed. Too quickly, actually. I check again, and disk usage is  still effectively the same.

Not very surprising, I mean Btrfs does have its quirks when it comes to reported file size. Goes to show how reflinks are a double-edged sword.

Still, that doesn't help. Maybe there's a reason why `du` hangs on just a small part of occupied data, but why exactly?

> Hang on, `du`'s output is sorted alphabetically, right?

So I give it one last try, this time with `btrfs filesystem du`, which accounts for special Btrfs file size quirks.

It hangs on `/var/games`, again... If memory serves, `/var/lib` should be next, right?

> Wait a second...
>
> Isn't `/var/lib/docker` still in there?

The last time I tried to delete it, it took too much time. I mean, they're containers, each with heaps and heaps of files...

But this time, something's changed. Feedback.

`Operation not permitted`. Several of them.

> Oh, that's because Docker uses Btrfs subvolumes!

So I run a quick `btrfs subvolume delete`, which this time goes pretty fast (for once), and I can _finally_ delete `/var/lib/docker`, just like that.

As it turns out, it was indeed the culprit, too. Disk usage fell to around 700GB, still better when you know where they came from.

**Moral of the story:** ~~DOCKER SUCKS~~ Don't leave unused files behind, clean them up. It could have been much worse.
