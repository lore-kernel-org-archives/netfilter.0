From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: CPU usage of simple DROP rule
Date: Wed, 30 Sep 2009 10:02:02 +0200
Message-ID: <20090930100202.7f86497f@catlap>
References: <7d7f2e8c0909291131m5cd58372ta5907f1612d8fa05@mail.gmail.com>
	<20090929212744.6679cfec@catlap>
	<7d7f2e8c0909291245i5c9bf0bal93757ce374c406d6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7d7f2e8c0909291245i5c9bf0bal93757ce374c406d6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Fink <sphink@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

>Well, I was originally having a problem with the CPU load distribution
>independent of netfilter. Initially, one CPU was getting the bulk of
>..
>(single) sending thread was running on CPU0, which mattered more than
>the smp_affinity of the irqs themselves.

Well, in my line of work I'm mostly dealing with routed/bridged traffic
not localy generated. That would explain different results of
setting smp_affinity.

>How would I know if I'm using intel i/o dma or whatever? 4 of my 6
>total gigabit NICs are using the e1000e driver. The other two are the
>'igb' driver, whatever that is.  modinfo says "Intel(R) PRO/1000
>Network Driver" for e1000e and "Intel(R) Gigabit Ethernet Network
>Driver" for igb. lspci says

There is some info about i/o at:
http://downloadmirror.intel.com/10959/eng/README.txt
... but it seems it can speed up receiving
not transimitting :(

>By "nic coalesce parameters", do you mean TxIntDelay and
>TxAbsIntDelay, or InterruptThrottleRate, or IntMode (all for e1000e)?
>Or something else? How can I tell what the current settings are?
>(Sorry, that's probably a basic question.)

I mean those settings: tx-usecs, tx-frames, tx-usecs-irq,
tx-frames-irq. They can be set by ethtool binary. AFAIK by default
there is no coalescence enabled (at least at my boxes I don't see any).
Meaning of parameters is well described here:
http://www.mail-archive.com/netdev@vger.kernel.org/msg14995.html

"> tx-usecs: 400
> tx-frames: 53
> tx-usecs-irq: 490
> tx-frames-irq: 5

The first tx interrupt will be generated after 53 packets are
transmitted or 400 microseconds after the nth packet is transmitted (1
<= n < 53). When irq is disabled, 5 packets or 490 micosecs before
updating status."

Cheers
Marek Kierdelewicz
