From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Netfilter Performance when using MAC filter
Date: Wed, 31 Oct 2007 13:41:44 -0500
Message-ID: <4728CC68.9000804@riverviewtech.net>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com> <1193855211.18366.73.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1193855211.18366.73.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/31/07 13:26, Matt Zagrabelny wrote:
> If so, you can do MAC filtering (performance shouldn't matter as the 
> MAC address is in the link header), if not MAC filtering won't buy 
> you much, the layer2 address will always be the same.

Agreed.

However this can also be extended to help prevent spoofing in a routed 
network.  If you know that a given subnet is available via a given 
router or routers you can only accept the packet if the source IP is 
coming from said router's MAC address.  Thus preventing someone else in 
a different subnet from spoofing the source IP address.  Or for those of 
us who like to run basic layer 3 filtering on all routers that would 
prevent such spoofed addresses, you can prevent someone from spoofing IP 
addresses with in the core network, i.e. backbone LAN trying to claim to 
be someone else.

This can and will work fairly well, though you have to be aware that 
this is in effect if you ever change MAC addresses of routers.

If you are going to go this route, I'd suggest that you use your own 
private OUI MAC addresses on routers.  This way you know that you need 
to alter the MAC on the routers when you put them in place to support 
your security model.

> This is essentially the difference between ARP and IP, or switching 
> and routing if you prefer.

*nod*

Or brouting (bridging / routing combination) if you so choose to go there.



Grant. . . .
