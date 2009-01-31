From: =?ISO-8859-1?Q?Vlado_Drz=28=EDk?= <vlado@ttx.sk>
Subject: Re: SMP load balancing of softirqs
Date: Sat, 31 Jan 2009 16:17:47 +0100
Message-ID: <49846B9B.3080103@ttx.sk>
References: <49817DD4.1010402@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49817DD4.1010402@redpill-linpro.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tore Anderson <tore.anderson@redpill-linpro.com>
Cc: netfilter@vger.kernel.org


Tore Anderson  wrote:
> Hello,
> 
> I've got an "router on a stick" with about 6000 iptables rules.
> Connection tracking is in use, including a few protocol helpers.  The
> hardware is a SunFire X4100 with 4x e1000 NICs and two AMD 275 CPUs
> (dual-core).  It was running a 2.6 kernel (early .20ies).
> 
> A while back I noticed a performance problem, the process ksoftirqd/1
> was using 100% of its respective CPU core (#1), and there was severe
> packet loss.  The forwarding rate was around 600 Mbps / 110 Kpps, so

Firstly I'm very surprised that you can reach that packet rate with so
many rules. I'd also focus on that. Do you really need so many rules.
What are you using that for?  accounting traffic, per ip fileters?
There are iptables extensions which are able to do accouning in more
effective maner also IP filters can be convereted to hash based ipsets.
Also there is always space for ruleset optimization (to make it tree
based not flat list) to limit number or rules packet needs to traverse.

> nothing that the NIC shouldn't be able to handle.  The other CPU cores
> were mostly idle.  I found out that I could move the problem around to
> ksoftirqd/{0,2,3} by changing the smp_affinity parameter for eth0's IRQ,
> so that the interrupts was handled by a different CPU core.  I found no
> way to make the softirqs to be balanced across all four CPU cores.
> 
You are right. Nowdays more problem lies in packet rate that CPU is able
to handle not a NIC ( for non-router load LSO could help
http://en.wikipedia.org/wiki/Large_segment_offload ).

> The workaround I ended up with was to simply connect all four NICs and
> join them together in a bonded ethernet device (LAG), making sure the
> switch load-balanced incoming packets equally amongst all four LAG
> members, 
I was forced to use same practice on our 2xquadcore router. We had a 2x
1GB nic traffic and we seen a perforomace problems in much lower
scenarios (80kpps). But we are doing mostly traffic shaping and NAT.
I'm using xmit_hash_policy=layer2+3 on bonding devices. I wanted to keep
  packets belonging to same flow on same NIC to get better cache
locality and avoid problems with ordering. (would be nice to compare to
do comparison to usual rr method).
Also I'd recomed you to play around with coalescing setting of NIC
(ethtool -C) and rx buffer and backlog.

Problem I can see is that Linux is not able to handover processing
packet comming from one NIC (or queue) to more softirqs and it'll end up
using just one softirq.
Really only solution seems to be RSS so packets will be separeted to
independent TCP flows and so could be then handled by separate CPU/softirqs.

I'd also like to test out RSS on our machine. Do someone have experience
with it on various HW (e1000,bnx2..) and recent kernels?


and also use smp_affinity to make sure the intterupts for each
> NIC is handled by separate CPUs.  It works well enouch - I assume I've
> roughly quadrupled the maximum capacity of the router compared to using
> a single NIC, even though I'm wasting switch ports since I can at most
> utilise half of the interfaces' max bandwith.
> 
> Anyway, now I'm considering getting a 10G aggregation switch and connect
> the router to it.  The high port cost of 10 GbE interfaces/switch ports
> rules out using the same trick, so I was wondering if anyone else has
> had a problem with this behaviour and found another way to deal with it,
> that enables the full utilisation of a SMP system even if the router has
> only one network interface?
> 
> Best regards,

