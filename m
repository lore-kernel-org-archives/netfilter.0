From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 03 Apr 2008 17:07:28 +0200
Message-ID: <47F4F2B0.9020205@plouf.fr.eu.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080403102632.GA22035@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter discussion list <netfilter@vger.kernel.org>

martin f krafft a =E9crit :
>=20
> also sprach Nicolas KOWALSKI <niko@petole.dyndns.org> [2008.04.03.113=
6 +0200]:
>=20
>>I noticed the same behaviour on Etch + kernel 2.6.22 (from
>>backports.org): ICMPv6 echo replies are matched by INVALID.
>=20
> See http://marc.info/?l=3Dnetfilter&m=3D120717177831833&w=3D2
> And this is still the case with 2.6.24.

I'm not sure what you both mean. I tested the IPv6 conntrack on vanilla=
=20
2.6.20 and 2.6.24 kernels built from kernel.org sources and everything=20
worked as expected :

- ping6 :
ICMPv6 echo request -> NEW
ICMPv6 echo reply -> ESTABLISHED

- UDP packet to a closed port :
UDP packet -> NEW
ICMPv6 port unreachable -> RELATED

- TCP connection to a closed port :
TCP SYN -> NEW
TCP RST -> ESTABLISHED

- TCP connection to an open port :
TCP SYN -> NEW
TCP SYN/ACK and the following -> ESTABLISHED

I do not see a reason why 2.6.22 would behave differently. Maybe there=20
is something special in Debian kernels ?

Did you check that the echo reply source address matches the echo reply=
=20
destination address ? I observed that some kernels may reply using a=20
different source address when the box/interface has several IPv6=20
addresses. When this happens the reply gets the INVALID state of course=
=2E

However it appears that ICMPv6 types related to neighbor discovery=20
(router advertisement, neighbor solicitation/advertisement...) are=20
always in the INVALID state.
