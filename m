From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables mac update
Date: Wed, 30 Jun 2010 17:39:34 +0200
Message-ID: <4C2B6536.2060401@plouf.fr.eu.org>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>	 <4C29E8B4.5060205@plouf.fr.eu.org> <1277821770.4006.33.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277821770.4006.33.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Pokotilenko Kostik (approximate romanization) wrote :
>>> We have two building with local networks connected by Zyxel Prestige 841
>>> and 841C VDSL-modems. They work in transparent bridge mode.
>>>
>>> On one end 841 is connected directly to a switch. On other 841C
>>> connected to a linux router wich is also connected to a switch, and
>>> those interfaces bridged.
>> So is it a bridge or a router ?
> 
> Modems 841C and 841 are configured in bridge mode.

You already made that clear. I was asking about the Linux box.

> Linux box runs some services and have 3 interfaces, 2 of them are
> bridged to br0 and one is left for separate local segment. So it is a
> router between br0 and eth2 and a bridge between eth0, eth1.

Ok.

>>> There is a problem, when a computer is being moved from one building to
>>> another it stops seeing other end of the bridge until modems are
>>> rebooted.
>> Can you elaborate "stops seeing" ?
>> Packet captures of ARP and IP traffic on both ends might provide more
>> information.
> 
> Can't repeat tests right now, but I'm remembering that if I move the box
> across the bridge and trying to ping box at other side: either
> ARP-who-has can't cross the bridge or ARP-is-at (response) can't cross
> the bridge.
> 
> I'll play more with this soon.

Please do so. And make sure you capture and compare traffic at each port
of the Linux bridge (eth0 and eth1).

> Can you confirm that if MAC (frame with source MAC) pops up on port
> different from the one it was seen previous time then the port for that
> MAC get updated?

I can only confirm that a Linux bridge does this, because I tested it. I
cannot confirm about other bridging devices, although this is what they
should do.

>> rebooting the modems and not the Linux box fixes the problem. So I doubt
>> that the Linux bridge causes the problem.
> 
> It may happen that rebooting the modems brings port link down and the
> bridge may clear the MAC-port table on that port. This is similar to
> what Zyxel support told me.

Note that you can achieve the same result by deactivating and
reactivating br0 or its ports, without touching the modems.
