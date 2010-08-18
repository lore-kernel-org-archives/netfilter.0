From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 01:05:21 +0200
Message-ID: <4C6C6731.50401@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C63EF.7060305@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>>> Sorry, I used a bad choice of words - Would ebtables stop the fram=
e reaching
>>>>  the remote host (VM in my case) is what I meant to say:)
>>> No. The two bridges are not connected to another in the first place=
,
>>> so the only way for a packet to come in on br0 and go out on br1 is
>>> routing, for which iptables is needed to filter.
>=20
> But even without iptables, traffic coudn't cross without a router in =
the=20
> middle, right?

Remember that Linux itself can act as a router.

> BTW, my post above wasn't really related to having 2 bridges, but mor=
e=20
> of the "dumb hub" situation.

I think Jan misunderstood your question which was

> Incidentally, would using ebtables rules prevent the bridge from=20
> going into "dumb hub" mode? Like let's say I said that "all traffic=20
> leaving this interface must have this destination MAC address".

IIUC your question, yes, ebtables could do that. But beware when doing
this, you could easily break very useful things such as ARP resolution
(which uses broadcast) or IPv6 neighbour discovery (which uses multicas=
t).
