From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 10:58:44 +0100
Message-ID: <49817DD4.1010402@redpill-linpro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I've got an "router on a stick" with about 6000 iptables rules.
Connection tracking is in use, including a few protocol helpers.  The
hardware is a SunFire X4100 with 4x e1000 NICs and two AMD 275 CPUs
(dual-core).  It was running a 2.6 kernel (early .20ies).

A while back I noticed a performance problem, the process ksoftirqd/1
was using 100% of its respective CPU core (#1), and there was severe
packet loss.  The forwarding rate was around 600 Mbps / 110 Kpps, so
nothing that the NIC shouldn't be able to handle.  The other CPU cores
were mostly idle.  I found out that I could move the problem around to
ksoftirqd/{0,2,3} by changing the smp_affinity parameter for eth0's IRQ,
so that the interrupts was handled by a different CPU core.  I found no
way to make the softirqs to be balanced across all four CPU cores.

The workaround I ended up with was to simply connect all four NICs and
join them together in a bonded ethernet device (LAG), making sure the
switch load-balanced incoming packets equally amongst all four LAG
members, and also use smp_affinity to make sure the intterupts for each
NIC is handled by separate CPUs.  It works well enouch - I assume I've
roughly quadrupled the maximum capacity of the router compared to using
a single NIC, even though I'm wasting switch ports since I can at most
utilise half of the interfaces' max bandwith.

Anyway, now I'm considering getting a 10G aggregation switch and connect
the router to it.  The high port cost of 10 GbE interfaces/switch ports
rules out using the same trick, so I was wondering if anyone else has
had a problem with this behaviour and found another way to deal with it,
that enables the full utilisation of a SMP system even if the router has
only one network interface?

Best regards,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
