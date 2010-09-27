From: rhn <vamali.rhn@porcupinefactory.org>
Subject: Re: redirecting connections to userspace
Date: Mon, 27 Sep 2010 11:35:21 +0200
Message-ID: <20100927113521.9cd58500.vamali.rhn@porcupinefactory.org>
References: <20100925162422.7a57f1c6.vamali.rhn@porcupinefactory.org>
	<alpine.LNX.2.01.1009262144160.21905@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009262144160.21905@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sun, 26 Sep 2010 21:45:33 +0200 (CEST)
Jan Engelhardt <jengelh@medozas.de> wrote:

> On Saturday 2010-09-25 16:24, rhn wrote:
> 
> >Hello,
> >
> >I'd like to forward TCP connections coming from intranet to my gateway 
> >to userspace programs on the gateway.
> >
> >For example, host A on the intranet tries to connect to host B on the 
> >Internet using gateway G. Upon receiving the connection, gateway G 
> >sends the original connection destination (B and port) to a userspace 
> >program, and sends the network data to/from the program.
> >
> >Is it possible to achieve that using netfilter?
> >
> >So far, I've only found ipqueue, which operates on the packet level - a 
> >little too low for me. The other solution would be to use VPN, but I 
> >don't get the flexibility of writing my own program then.
> 
> xt_TPROXY comes to mind. Then you just do the usual socket(2) things in 
> userspace.
> 

Thanks!

I did some more research and what I actually needed was a tun/tap VPN. I need the whole thing to tunnel my traffic, and it seems to be easier that way.

I'm having trouble getting the VPN to operate correctly, though. I don't know where to ask my question, so I hope someone can help me over here or point me elsewhere.

Background:
I set up the VPN as an Ethernet network with a router connected to internet. I set up NAT on the router to treat the VPN in the same manner as the other network connected to it.

Problem:
When I leave the MTU on VPN as-is, then for some reason the applications can finish the SYN, SYN ACK, ACK sequence, but I can't see them sending ACK packets later, rendering TCP connections unusable.
When I set MTU on VPN to 1000, then the connections work, albeit very slowly, and I can see a lot of strange things in the network, like TCP payload fragments sent as Ethernet frames or packets exceeding the MTU. I have no idea how the connections can still work with these problems.

Questions:
What these problems can relate to? Is it wrong setup of the iptables rules or something entirely else? What's the best place to ask for help?

Cheers,
rhn
