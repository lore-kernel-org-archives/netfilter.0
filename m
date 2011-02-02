From: Guido Winkelmann <guido-nf@thisisnotatest.de>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 14:05:49 +0100
Message-ID: <201102021405.52880.guido-nf@thisisnotatest.de>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de> <4D492560.1070609@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D492560.1070609@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Am Wednesday 02 February 2011 schrieben Sie:
> > Answer packets for NDP always have a valid IPv6 address from the
> > answering host as their source address. Also, they're IPv6 packets like
> > any other and not a separate protocol as with ARP+IPv4.
> 
> Yes, however there is nothing currently like arptables for IPv6 that I
> know of.

ip -6 neighbor show (Requires iproute2 to be installed)

> Even though the NDP answers may have a correct source IP,
> surely the payload could provide wrong (i.e. malicious) data...

As far as I know, as long the source address of the answer packet is one 
address, it cannot be used to advertise a different address. If you want 
certainty, read the respective RFC (4861 afaict), study the packets being sent 
with wireshark and/or experiment with sending faked packets yourself.
 
> > Note that hosts using IPv6 will usually have at least two autoconfigured
> > addresses, and it's sometimes hard to predict which one will be used as
> > source address for outgoing packets, especially if the number of
> > configured addresses grows. You must not block any of those.
> 
> I'm willing to give up the auto-config features of IPv6. We can just
> manually put the address in the respective config file. It's no big deal
> really.

As long as any of your VPSes still have it enabled (I wouldn't even know how to 
disable it, and I think disabling the autoconfigured link-local addresses may 
break things), they will end up using it as a source address sooner or later.

I don't see why you want to completely forego autoconfiguration, really. IMHO, 
it's a nice "it just works"-feature. It can be a bit harder to filter, because 
you need to predict how these addresses will look like before the fact, but once 
you understand the principle, it's easy enough:

Just take the network address as advertised by your router, or fe80:: for the 
link-local address, and replace the lowest 8 byte with modified EUID of the 
machine's NIC. That "modified EUID" in turn can be calculated by taking the 6-
byte MAC address of the NIC, inserting the two bytes 0xff and 0xfe between the 
third and the fourth byte and toggling the second bit of the most significant 
byte. (Note: Some guides on the Internet will tell you to unconditionally set 
that last bit to 1. That is wrong.)

	Guido

