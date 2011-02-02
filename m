From: Guido Winkelmann <guido-nf@thisisnotatest.de>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 14:30:41 +0100
Message-ID: <201102021430.44239.guido-nf@thisisnotatest.de>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de> <alpine.LNX.2.01.1102020207390.25701@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1102020207390.25701@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Am Wednesday 02 February 2011 schrieben Sie:
> On Wednesday 2011-02-02 00:00, Guido Winkelmann wrote:
> >On Tuesday 01 February 2011 22:38:49 you wrote:
> >>that each VPS can only use the IP and MAC addresses
> >>assigned to them.
> >>With IPv6, does anyone have any experience on how to do this? I
> >>know we can use ip6tables, but isn't there some trickery with NDP
> >>(Which replaces ARP)?
> >
> >There shouldn't be, just as long as you only filter on the source
> >address of outgoing packets, and not on the destination of incoming
> >ones. The NDP request packets go to weird multicast addresses
> 
> That "weird multicast address" is just broadcast so to speak, there is
> nothing weird about it.

Well, from what I could gather in wireshark, it's a bunch of different dst 
addresses that are used for that, and which one is used appears to depend on the 
address being queried...

> >Answer packets for NDP always have a valid IPv6 address from the answering
> >host as their source address. Also, they're IPv6 packets like any other
> >and not a separate protocol as with ARP+IPv4.
> >
> >Note that hosts using IPv6 will usually have at least two autoconfigured
> >addresses
> 
> Can you back up this statement?

Well, as soon as you enable IPv6 on a host, all of its interface will generally 
immediately be assigned an autoconfigured link-local address calcaluted from the 
MAC address. As soon the host receives a router advertisement on one of its 
interfaces, it will auto-configure an additional address from the advertised 
prefix and its MAC.

Of course, if you don't have any IPv6 routers on the local net, or if they don't 
send router advertisements, then the second autoconfigured address will not 
exist, but then, if there is no IPv6 router, then saying the host is "using 
IPv6" is a bit far fetched, and having an IPv6 router on the local network that 
does not send any router advertisements is, as far as I can tell, a rare corner 
case.

	Guido
