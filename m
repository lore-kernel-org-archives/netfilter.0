From: Guido Winkelmann <guido-nf@thisisnotatest.de>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 00:00:58 +0100
Message-ID: <201102020000.58388.guido-nf@thisisnotatest.de>
References: <4D487D69.7000808@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D487D69.7000808@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Tuesday 01 February 2011 22:38:49 you wrote:
> With IPv6, does anyone have any experience on how to do this? I know we
> can use ip6tables, but isn't there some trickery with NDP (Which
> replaces ARP)?

There shouldn't be, just as long as you only filter on the source address of 
outgoing packets, and not on the destination of incoming ones. The NDP request 
packets go to weird multicast addresses that depend on the address being 
requested. I haven't totally figured out the scheme yet (haven't really 
tried).
Answer packets for NDP always have a valid IPv6 address from the answering 
host as their source address. Also, they're IPv6 packets like any other and 
not a separate protocol as with ARP+IPv4.

Note that hosts using IPv6 will usually have at least two autoconfigured 
addresses, and it's sometimes hard to predict which one will be used as source 
address for outgoing packets, especially if the number of configured addresses 
grows. You must not block any of those.

Also see my message from yesterday on that subject, please. I'm having 
problems with filtering IPv6 from VPSes as well, and if you find a solution 
that works with large numbers of vpses, I would appreciate it if you could 
share it.

	Guido
