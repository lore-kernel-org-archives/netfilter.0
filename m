From: Martin Bochenek <bochi2006@gmail.com>
Subject: Initial loading of ruleset slower than subsequent tries
Date: Tue, 16 Feb 2021 17:49:28 +0100
Message-ID: <CAHb6YP+415eVAH2yh5MwUhvHZuo_7xV9s1DvA_=0rPcgoUVjgQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gOWa/2yyQNx+jV8cccdPUXZtnu4Oc19x689BAgUNahk=;
        b=gYnXExvOopGSS9AMZITNDaiLqip/aC09QUkUnFWseJYq39vm6yk6AZ3UyQVyF0toHK
         gsQUdxLUdxX6BfmgrwrnCJ/j6NnIJhbutR71W0ijFNTthXhdcxybZPr33VERmp5s0woW
         jGBlN+E2g8KjUc4+/86wkFk6qm/T/hLc7IllliVeNe7lXjcezj4e98eepVSf9pWjZIN7
         JYUk6HIZh52wHRJkudK1n7mjSEkGhNEKHMMnF44R2r+vRFR1SiWzGZc5EqDQdRallpvP
         sD39Mxemgo7YiGZJV4wj7ResAh3K92zMJgCJxVCcvTD6O0NsvjwiD0/C4hSq/hqdKX0O
         Dhog==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi @all,

I got myself a pretty strange situation here, that I am stuck at
debugging any further myself - not even sure if this might be expected
behavior.

Setup is the following:
- custom built linux kernel v4.14.137 (with preempt_rt patch, aarch64)
- nft v0.9.8 (and matching libraries)

One of the first things I do after entering userspace is loading a
rather simple ruleset (containing ~100 rules in 7 chains) via "nft -f
ruleset.conf".
I want to get this done even before setting up the network interfaces,
so it's just nft being executed - nothing else at this point in time.
What I observe here is a total setup time of about 300ms on the
initial call, but about 150ms on subsequent calls or when called again
later when the system is fully up and running (and even more loaded).
Most of the time is consumed during the sendmsg call to the kernel.

So my questions would be:
- Is a setup time of 300ms in line with what would be generally
expected for a small ruleset? Are there any reference values
available?
- What is happening behind the scenes that would explain the
difference between the first and the subsequent calls?

Regards, Martin
