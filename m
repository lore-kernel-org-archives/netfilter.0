From: Thomas Jacob <jacob@internet24.de>
Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
Date: Fri, 06 Jun 2008 11:39:22 +0200
Message-ID: <1212745162.32573.11.camel@enterprise.ims-firmen.de>
References: <305732.3074.qm@web58309.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <305732.3074.qm@web58309.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vincent Arniego <vincent_arniego@yahoo.com>
Cc: netfilter@vger.kernel.org

On Thu, 2008-06-05 at 18:49 -0700, Vincent Arniego wrote:
> Hi Everyone,
> 
> We did a setup using libnetfilter_queue that examines the http headers of http packets.
> In the setup, the firewall redirects packets in port 80 (source and destination) to an application listening on queue 0.
> This box is acting as a router, so we setup the NFQUEUE rule in the forward chain
> 
> Somehow we were able to make it work after some adjustments in the kernel (sysctl net.core.rmem_max and rmem_default)
> 
> Assuming we are facing around 66 Mbps or around 11000 packets per second of traffic (from iptraf):
> 1. Is there a way to compute the correct optimized settings for net.core.rmem_max and rmem_default? Like a formula?
> 2.
> Is there a way to automatically load balance the incoming packets to
> multiple applications using multiple queues? This is assuming we cannot
> segregate the packets by its source IP and/or destination IP.

Why not use pound or some similar http proxy for that? 66mbps and 11.000
pps doesn't sound all that much (presumably this is the whole traffic,
not just ingress?), and pound is pretty fast:
http://www.apsis.ch/pound/index_html

This way, you also don't have to deal with the problem of where exactly
in the incoming packets you'll find your http headers. After all, what's
to stop a client from sending the http-request, for instance, in many
packets each containing only one character at a time.

Plus pound is very easy to use and presumably, given its size, easy
to hack.

