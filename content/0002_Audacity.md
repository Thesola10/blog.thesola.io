---
Title: How much power do companies have over open source?
Date: 2021-07-06
Category: os dev
Tags: rant, privacy, our relationship to code
Slug: 0002_Audacity
Image: /images/0002-audacity.png
Summary: The MUSE group wrote a telemetry _proposal_ as a pull request, and it backfired. Linux users are usually safe from telemetry thanks to distro maintainers, so why are people still mad? And what does that say about the way software is distributed as a whole?
---

The MUSE group wrote a telemetry _proposal_ as a pull request, and it backfired. Linux users are usually safe from telemetry thanks to distro maintainers, so why are people still mad? And what does that say about the way software is distributed as a whole?

<!--more-->

![The Audacity logo](/images/0002-audacity.png)

> People were angry because MUSE wanted to introduce telemetry, it's as simple as that!

Is it though?

First things first, I would like to make it clear that _I **do not condone** the actions of MUSE group in any way._ All I want here is to use that situation as a case study.

I will be referring to [Tantacrul's response to the telemetry proposal](https://github.com/audacity/audacity/discussions/889), as well as [the MUSE group's response to the privacy policy changes](https://github.com/audacity/audacity/discussions/1225). I recommend that you give them a read first.

## 1. The telemetry proposal

Here's a quick run-down of what I understood from the discussion around [the telemetry PR of May 4th](https://github.com/audacity/audacity/pull/835)

1. A MUSE developer submitted the pull request, containing working telemetry code intended for Audacity, to the Audacity repository.
2. The community found out about the pull request, which promptly caused a backlash.
3. The most obvious change to Audacity's governance to people was the involvment of [Tantacrul](https://youtube.com/user/martinthekearykid), so the community lashed out to him.
4. Tantacrul explained, in an official response on behalf of MUSE, that the intent was for the PR to serve as a _proposal_ to the community.

Now that I wrote these words out, two possible lines of thought come to mind:

### A: MUSE had intended for people to find out about the PR through their official forum post, as they did with MuseScore.

Maybe. Or at least, that's what they officially said. I guess pull requests aren't a very subtle way of expression, but given that their alternative would have been to _work on a private fork then come out of the blue with an instantly implemented telemetry PR_, I'd say it still was for the better.

Of course, the community wishes that they talked about the idea _before_ starting work on it, but on the other hand, they may have thought that simply asking _"Hey, mind if we add telemetry?"_ would have caused most people to refuse anyway, and that an implementation would have been more clear.

### B: MUSE had intended to implement telemetry as fast as possible. The PR was too complete to just be a proposal.

Except, something just _doesn't fit_. In fact, looking at the commit dates, the whole _"work on a private fork then come out of the blue with an instantly implemented telemetry PR"_ is _precisely what they did_. And of course, the community lashed out on them. As far as was disclosed, there was seemingly no reason to release their work ahead of the forum post they had intended to make, unless they wanted to merge the changes as fast as possible.

The truth is probably somewhere in between, but comparatively speaking, the public reaction was a lot more tame than for _what happened next_.

-----

## 2. The privacy policy update

A privacy policy is a legally binding document which an app developer uses to clarify what personal data their application is able to obtain from its users.

_Just yesterday (at the time of writing)_, MUSE made a public revision to Audacity's privacy policy, allowing them to collect data such as your IP address and error reports... and data intended for _law enforcement_.

When you think about it, Audacity is not like iOS, in that it does not explicitly encrypt or otherwise prevent external use of user data, so law enforcement data should not be in the scope of Audacity's privacy policy. That's what really worried users, so they did what they judged appropriate: _**they forked the project**_.

Again, MUSE reminded people that the new data collection code can be disabled through a **compile-time option**.

Compile-time options are expected to be manipulated by users, but come with the implied requirement that said user should be sufficiently proficient in computing to know how to compile their own programs in the first place. As such, it is fair to say that, regardless of intent, these options will impact the uninformed and damage the image of an app as a unified product whose behavior is identical everywhere.

-----

## Moral of the story

It is much too early for me to give a definitive opinion on the situation, but as a community, we should consider our choices in software distribution, and how they can affect our users in the long run.

Just like with [installers](/2021/0001_inert-installs/), the ability to customize and control the build process is an important part of a sane relationship with software. When the defaults are changed, it's as if the very philosophy of the app is being taken away from the community, who then feel powerless. Such is the irony of modern open-source.

And to MUSE: Not every user of Audacity is a developer, and we are acutely aware of that, which explains the community's overprotective stance. _Code is law_, and proposals should first be formulated in words, before being written down to code.
