From: Thomas Jacob <jacob@internet24.de>
Subject: Re: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 11:49:41 +0100
Message-ID: <1233226181.13705.24.camel@enterprise.ims-firmen.de>
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

On Thu, 2009-01-29 at 10:58 +0100, Tore Anderson wrote:
> The workaround I ended up with was to simply connect all four NICs and
> join them together in a bonded ethernet device (LAG), making sure the
> switch load-balanced incoming packets equally amongst all four LAG
> members, and also use smp_affinity to make sure the intterupts for each
> NIC is handled by separate CPUs.

I'm guessing that would be the standard approach... don't know whether
or not it is possible or advisable to balance soft IRQs

> Anyway, now I'm considering getting a 10G aggregation switch and connect
> the router to it.  The high port cost of 10 GbE interfaces/switch ports
> rules out using the same trick, so I was wondering if anyone else has
> had a problem with this behaviour and found another way to deal with it,
> that enables the full utilisation of a SMP system even if the router has
> only one network interface?

Some newer NICs (some of Intel's for instance) support several packet
queues to make it possible to deal with just this problem.

Check out http://lwn.net/Articles/289137/ for a start...

It would be great if you'd let the list know of the results should you
try to use one of the multiqueue NICs for a netfilter firewall, I for
one am very curious...




