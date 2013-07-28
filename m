From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Sun, 28 Jul 2013 09:51:03 +0200
Message-ID: <51F4CD67.8010600@plouf.fr.eu.org>
References: <1374803962.5489.12.camel@fermat.scientia.net>	 <51F42451.9010308@plouf.fr.eu.org> <1374958401.5194.13.camel@fermat.scientia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1374958401.5194.13.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter <netfilter@vger.kernel.org>

Christoph Anton Mitterer a =E9crit :
>=20
> On Sat, 2013-07-27 at 21:49 +0200, Pascal Hambourg wrote:
>> You should not blindly drop UNTRACKED or INVALID IPv6 packets.
>=20
> Why not INVALID IPv6 packets? AFAICS, the patch you've mentioned only
> removes tracking for these kinds of packets, but doesn't mark them
> invalid.

Because before the patch, older kernels marked NDP packets INVALID.

> 1) So... are there any other reasonable default rules one should make
> for IPv6 (or IPv4) then?

Sure. On an ethernet-like interface, accept the following ICMPv6 types,
with hop limit 255 as these packets are link-local only :
- neighbour solicitation and neighbour advertisement in both directions
- router solicitation in output and router advertisement in input if th=
e
box is an IPv6 host using stateless autoconfiguration
- router solicitation in input and router advertisement in output if th=
e
box is an IPv6 router with radvd or the like listening on this interfac=
e.
Then you can drop anything else you (don't) like.

> I guess the kernel itself already assures that any address of his own
> interfaces are not accepted as source address for packages coming ove=
r
> the wire? I.e. to prevent spoofing of the hosts own addresses.

Yes.

> 2) What about INVALID/UNTRACKED with respect to IPv4? Is it there sti=
ll
> advisable to DROP them unconditionally?

AFAIK, IPv4 has nothing like NDP, so
- INVALID : normally, yes.
- UNTRACKED : AFAIK, it can only be the result of the NOTRACK target, s=
o
you would know about it.

> Oh and btw: Does the IPsec handling I do still work with IPv6 or has
> anything changed there as well?

I don't use IPSec and don't know about its handling by iptables.
