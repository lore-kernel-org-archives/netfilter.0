From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: linux-next netfilter: xt_recent: Add an entry reaper
Date: Sun, 28 Feb 2010 21:02:12 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1002282100510.11244@obet.zrqbmnf.qr>
References: <20100228033841.265CFF8BB0@sepang.rtg.net> <1267331677.9082.46.camel@edumazet-laptop> <4B8AB4BE.7080206@tpi.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4B8AB4BE.7080206@tpi.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Gardner <timg@tpi.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, kaber@trash.net, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org


On Sunday 2010-02-28 19:23, Tim Gardner wrote:
>
>Let me explain one of my use cases. One of the companies that I work for
>is an ISP. Our primary bridge/firewall uses iptables as a first line of
>defense. One of the methods to detect attackers is by using a port scan
>detection filter (PSD), which is a bit memory and CPU intensive. Once
>PSD identifies an attacker, then that source IP is added to a 'recent'
>filter instance with an X second timeout, and the PSD entry flushes
>after some timeout. 'recent' continues to block _all_ traffic from that
>source IP until it stops sending packets for at least X seconds, at
>which time I would like 'recent' to release the entry.
>
>As for your fast path comment, how about scaling the frequency with
>which the reaper is run using a module parameter ? See attached patch.

That won't work as I posted earlier today
( http://marc.info/?l=netfilter&m=126735427707917&w=2 )
and the patch pretty much breaks xt_recent by purging entries
too early.
