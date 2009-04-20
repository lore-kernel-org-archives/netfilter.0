From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Sun, 19 Apr 2009 23:56:50 -0600
Message-ID: <op.usn740lix1lyi3@localhost>
References: <op.uskfabufx1lyi3@localhost>
 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
 <20090419090016.GA19987@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090419090016.GA19987@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, 19 Apr 2009 03:00:17 -0600, Thomas Jacob <jacob@internet24.de> wrote:

>>Well, I want to load-balance packets from the local machine, which is serving as gateway for a home LAN (eth0).  The local machine is 192.168.1.1 on the LAN.
>
> Then your current setup in PREROUTING is what you want to go for, just keep
> in mind that this does not give you load balancing for connections originating
> from your router box, just the ones from your LAN.

I'm sorry, I don't understand.   According to what you are saying, I should not get any load balancing, since all my testing up until now has been with connections (to the Internet) originating on the router box.  (I haven't even tried connecting from the LAN.)

However, the packets originating on the router box *are* showing up in the conntrack table with the fwmark, put there by my prerouting rules.  Is there a reason why they should not be pushed out the interface specified by the rt_link1/2 tables?  (As far as I can tell, my user-defined routing tables are ignored, and the default route in the "main" table is always used.)

>
> C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
>
> I'm not sure why you need NAT on your eth0 though then, what are you
> trying to achieve with this? But that should not be the cause
> of the load balancing failure.

I was trying to masquerade any LAN-connected machine so it could connect to the Internet through the router box, but I mistakenly specified "-o eth0" instead of Internet connected interface.

The lines:
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
should do the masquerading I suppose, although the idea was not that, but rather to fix the source address of outgoing packets to coincide with the IP of the interface (ppp0 or ppp1).

>
>> When I remove the default route in the main routing table, I completely lose Internet connectivity.   My logic tells me that a default "main" route should not be necessary at all if all packets are marked and sent to my 2 custom routing tables (rt_link1/2), each of which has a default route.
>
> That's right, but if all your /proc/net/ip_conntrack entries contain mark values
> then there really must be something wrong with the fw mark <-> route interaction.
>
> My suggestion is to try this with the lastest IPtables user space and 2.6.27.X for
> instance, then maybe more people have a comparable setup to look at.
That's good advice, although I can't use kernel 2.6.27 I'm afraid.  At some point after 2.6.21 the code for a USB serial driver changed.  I have to patch that driver to make my USB-connected GPRS (ppp over GSM cell phone) modem work.  (I already hacked the patch once, after the driver code changed between kernel 2.4 and 2.6, and I don't want to have to do it again.)  GPRS is my only Internet option in my remote area of Costa Rica.

My idea was to download the 2.6.18.8 kernel and use it with iptables v1.3.6, which as you pointed out previously ought to have the functionality I need.  (It is a drag to be tied to an old kernel version due to hardware dependency.)
>
> Do you know about LARTC? The best way to get started IMO: http://lartc.org/

Yes, I downloaded the tutorial a couple of days ago, thanks!

--
Lloyd
