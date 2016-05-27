From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Subject: `ip addr del` kills conntrack entries of unrelated IP addresses
Date: Fri, 27 May 2016 12:40:51 +0200
Message-ID: <CANvSZQ9VCCMpcxShc-3u0gAFbAL2gSkbYKsxmOsOmY4Tz3iK2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkel.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=aaX5cTl/aAUnqCbmZJyFJpptxt9dHiBsQcOo6cBzBUY=;
        b=BTn73LpymyIHTmQ6P3uMgXJiR1mqOQUUZGh1Zwfy7yTd7BzGblRRNtsI/TC4XDMecr
         2fgzOj/KGjg9mUNrDd/6SOBRSWcLbj2fQaJFztb7LENL1TKAmI5pgHM11F8N/KOSlCCK
         +YL3XP9l8RdX/tYXPT6vXJ0CvcBYV2vMCB6jQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

we've been hunting a bug over the last couple of days and have been
able to isolate it to an unfortunate `ip addr del` / conntrack
interaction, which is where my knowledge ends and I'd welcome any
input on whether what we are seeing is expected behavior or a
potential bug.

We are operating a Docker-based infrastructure where - in addition to
a hosts primary IP - additional IP addresses are added to the primary
network interface to allow binding the containers' published ports on
dedicated IP addresses.

Let's say, the primary IP is 10.70.0.5/16 (on bond0) and
container-specific IPs are allocated from 10.70.0.64/32 onwards.

Container-specific addresses are added using `ip addr add 10.70.0.x/32
dev bond0` (x >= 64). This works as expected. Things get weird once
one of these addresses is removed using `ip addr del 10.70.0.x/32 dev
bond0`. From that point on established outbound connections
originating from within Docker containers (source IP = 10.70.0.5) no
longer receive any traffic. The cause of this seems to be that the
respective connection's entries in the conntrack table are flushed as
soon as `ip addr del` is executed (as can be observed using `conntrack
-L`) -- despite this being a different IP address (but on the same
interface).

I have reproduced the issue so far on
  Linux redacted 3.10.0-327.el7.x86_64 #1 SMP Thu Oct 29 17:29:29 EDT
2015 x86_64 x86_64 x86_64 GNU/Linux
and
  Linux lyra 4.1.19-v7+ #858 SMP Tue Mar 15 15:56:00 GMT 2016 armv7l GNU/Linux

Any ideas? Expected behavior? Bug?

To reproduce:

Start outbound netcat within Docker container
ip addr add on the host
conntrack -L still shows the entry
ip addr del
conntrack -L no longer shows the entry (and connection is dead)

Please let me know if you need more details.

Thanks & kind regards,
Thilo
