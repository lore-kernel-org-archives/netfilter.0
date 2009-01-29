From: Rick Jones <rick.jones2@hp.com>
Subject: Re: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 09:33:50 -0800
Message-ID: <4981E87E.2070103@hp.com>
References: <49817DD4.1010402@redpill-linpro.com> <1233226181.13705.24.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1233226181.13705.24.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>
Cc: Tore Anderson <tore.anderson@redpill-linpro.com>, netfilter@vger.kernel.org

> Some newer NICs (some of Intel's for instance) support several packet
> queues to make it possible to deal with just this problem.

I think it may be more than just "some" newer/newish 10Gig NICs actually. 
Besides Intel, ChelsIO and Neterion and Broadcom come to mind, and probably 
Myricom and SolarFlare (did they merge with someone?) and certainly others.  I 
think that Cisco and Qlogic also offer 10G NICs these days.

> It would be great if you'd let the list know of the results should you
> try to use one of the multiqueue NICs for a netfilter firewall, I for
> one am very curious...

IIRC there are sort of "two" multiqueues - there is the older, more established 
"inbound" multiqueue stuff - what Microsoft has everyone calling RSS or Recieve 
Side Scaling (or am I mixing terms?) that only affects inbound packets.

Then there is "tx (transmit) multiqueue" which is rather newer (first in 2.6.26 
kernels?) and still "evolving."

If you are forwarding traffic, you probably want both, and likely as not probably 
want to be on as current (bleeding edge) a kernel and NIC drivers as you can 
stomache.

rick jones
