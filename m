From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Mon, 03 Nov 2008 10:35:58 -0600
Message-ID: <490F286E.9070302@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DFA21.3050906@riverviewtech.net> <490ED879.2060101@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490ED879.2060101@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/03/08 04:54, Pascal Hambourg wrote:
> Hello,

Hi.

> Ebtables, are you sure ? AFAIK ebtables does only layer 2 MAC address 
> translation, not IP address translation. Don't you mean bridge-nf aka 
> bridge-netfilter instead of ebtables ?

It's been too long so I can not say for 100% sure, but it may have been 
with bridge-nf.  However, even if you are using bridge-netfilter and 
using IPTables to operate on the layer 2 bridged traffic, this is still 
done on layer 2, not layer 3.  I know it's starting to get ambiguous, 
but...  I.e. I could have one subnet split in half and be NATing the 
traffic as it passes through, say .3 can automagically become .4.

> It's far from being that simple. Doing stateful IP address translation 
> at layer 2 requires other operations such as fragment reassembly because 
> stateful NAT operates at the datagram level, not at the packet level, 
> and rerouting and ARP lookup when the destination IP and MAC addresses 
> change. IMO these are definitely not layer 2 operations.

You have some good points about where NAT operates.  With out going back 
and reviewing my notes and old config, I believe it /is/ possible to do, 
just very much of a kludge and difficult to do.

> Ipchains did not have a state match extension, but it had some 
> connection tracking for its NAT features (masquerading and port 
> forwarding).

Could be that NAT had some connection tracking.  I did not really mess 
with IPChains that much, more IPTables, so I don't know for sure.

> Actually the IP_ROUTE_NAT option enabling the old stateless NAT aka 
> "fast NAT" or "route NAT" support in the kernel has been removed since 
> kernel 2.6.9 only. But a new stateless NAT was added in kernel 2.6.24. 
> See option NET_ACT_NAT in the "QoS and/or fair queueing" menu (yeah, I 
> guess the location may seem misleading). I have not dug into it, but I 
> think it can be set up with the "tc" tool from the iproute package. It 
> requires iproute2-2.6.24-rc7 at least.

*nod*

I may have to dig it out and look at it some time.  I'm glad to know 
that they brought something back that offered the stateless NAT 
functionality.



Grant. . . .
