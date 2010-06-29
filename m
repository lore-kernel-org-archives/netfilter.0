From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 14:36:04 +0200
Message-ID: <4C29E8B4.5060205@plouf.fr.eu.org>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277808205.3791.17.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Pokotilenko Kostik (approximate romanization) wrote :
> 
> We have two building with local networks connected by Zyxel Prestige 841
> and 841C VDSL-modems. They work in transparent bridge mode.
> 
> On one end 841 is connected directly to a switch. On other 841C
> connected to a linux router wich is also connected to a switch, and
> those interfaces bridged.

So is it a bridge or a router ?

> There is a problem, when a computer is being moved from one building to
> another it stops seeing other end of the bridge until modems are
> rebooted.

Can you elaborate "stops seeing" ?
Packet captures of ARP and IP traffic on both ends might provide more
information.

> I was thinking the problem is in modems' part, but in Zyxel support I've
> been told they are just dumn transparent bridges and doesn't behave like
> that.

A bridge (or a switch) is never completely as dumb as a hub. It uses a
MAC-port table in order to forward frames only through the relevant ports.

> So, the only device left that may cause such problem is linux
> router/bridge.
> 
> Is there any kind of behaviour of linux bridge (ebtables) that may cause
> such problem?

The Linux bridge maintains a MAC-port table based on the source MAC
address in received frames. As expected, if a MAC address was associated
to a given port and a frame from that MAC address is received on a
different port, then the table is updated accordingly. Besides,
rebooting the modems and not the Linux box fixes the problem. So I doubt
that the Linux bridge causes the problem.

Of course the update process requires that the moved box sends traffic
first. If it just sits there waiting then MAC-port tables won't be
updated, until the entry eventually expires.

> P.S. there is no ebtables rules at all, no iptables related rules.

Then may I ask what is the purpose of this box ?
