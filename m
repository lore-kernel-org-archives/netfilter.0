From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Re: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 12:23:25 +0100
Message-ID: <498191AD.7010302@redpill-linpro.com>
References: <49817DD4.1010402@redpill-linpro.com> <1233226181.13705.24.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1233226181.13705.24.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

* Thomas Jacob

> Some newer NICs (some of Intel's for instance) support several packet
> queues to make it possible to deal with just this problem.
> 
> Check out http://lwn.net/Articles/289137/ for a start...

Interesting link, thanks!   However, I was under the impression that the
problem is incoming (RX) frames, that causes an interrupt to be raised
on a certain CPU (core) which in turn causes the frame to be processed
by that particular CPU by the NET_RX softirq handler.

The multiqueue patch seem to be about being able to submit outgoing (TX)
frames to multiple hardware queues.  So I don't think it will make much
of a difference for me?

> It would be great if you'd let the list know of the results should you
> try to use one of the multiqueue NICs for a netfilter firewall, I for
> one am very curious...

I'll remember that.  Thanks again!

Best regards,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
