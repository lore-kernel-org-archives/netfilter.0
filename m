From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd and CacheWriteThrough
Date: Tue, 04 Nov 2008 11:13:24 +0100
Message-ID: <49102044.8090400@netfilter.org>
References: <20081029155332.GA20850@bongo.bofh.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081029155332.GA20850@bongo.bofh.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, md@linux.it

Marco d'Itri wrote:
> When I try to start conntrackd (0.9.6 and 0.9.7, from the Debian
> packages), it dies with this message:
> 
> Error parsing config file: line (58), symbol 'CacheWriteThrough': syntax error
> 
> What's wrong?
> 
> I have a pair of firewalls running quagga and OSPF announcing the
> network behind them to my network core and keepalived managing a
> virtual gateway on it, so I need an active-active setup because
> traffic can enter the protected network from any of the firewalls.

Sorry, this setup is no longer supported. At least until we find a sane
way to do it. See http://conntrack-tools.netfilter.org/manual.html.
Also see: http://marc.info/?l=netfilter&m=122164806109759&w=2

Anyway, about your problem:

> This is my configuration file:
[...]
> 
>         # Replicate ESTABLISHED TIME_WAIT for TCP
>         Replicate ESTABLISHED TIME_WAIT

Missing "for TCP" confuses the parsing?

>         # If you have a multiprimary setup (active-active) without connection
>         # persistency, ie. you can't know which firewall handles a packet
>         # that is part of a connection, then you need direct commit of
>         # conntrack entries to the kernel conntrack table. OSPF setups must
>         # set on this option. Default is Off.
>         #
>         CacheWriteThrough On
> }

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
