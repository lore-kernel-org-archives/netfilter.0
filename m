From: bsilva <bsilva@sonic.net>
Subject: Re: howto dumb switch?
Date: Sun, 16 Nov 2008 13:58:41 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0811161343100.7362@bolt.sonic.net>
References: <49205D8D.2090601@mailinator.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49205D8D.2090601@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Wright <mike.wright@mailinator.com>
Cc: netfilter <netfilter@vger.kernel.org>


Well, dumb switches (as opposed to managed or smart switches), do not need
an IP address, because they only operate on Ethernet packets.  They don't
know (or care) whether those packets are IP or some other protocol.  All
they do is look at the Ethernet address (aka MAC address) and figure out
what port to forward it to.  If they do not know what port, then they send
it out all ports.

That's as short a description of an Ethernet switch as I can write.  There
are a couple of other details, but the important part is that they look at
the first 12 Octets of the packet.

Also, they do not "route".  That term is usually reserved for the logic of
how higher level protocols (such as IPv4 or IPv6) get forwarded.


Managed switches keep track of statisics and other information about the
traffic on the network, and as such have their own commputers internally
that needs to comunicate over IP.


A Linux box can be setup to act like an Ethernet switch, but that's
usually only done if you want to filter or otherwise modify the traffic
going through the box.  A Linux bx cannot forward packets as fast as even
a cheap Ethernet switch (and obviously costs more).  In the Linux kernel,
this is called Bridging.  Here's a good Howto:
http://www.faqs.org/docs/Linux-HOWTO/Ethernet-Bridge-netfilter-HOWTO.html


I hope that helps,
Brad


I hope that helps clear things

On Sun, 16 Nov 2008, Mike Wright wrote:

> Hi all,
>
> Would somebody be so kind as to explain to me how those cheapo ($10US)
> five port unmanaged switches work?  They have no IP of their own but
> manage to bridge?/route? disparate networks together.
>
> I've been trying to make one out of a multi-nic linux box and just don't
> seem to get it.
>
> Pointers to any documention would be great.
>
> tia for any help.
>
> Mike Wright :m)
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
