From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 04 Apr 2008 01:00:39 +0200
Message-ID: <47F56197.1000504@plouf.fr.eu.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <20080403152330.GA15573@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080403152330.GA15573@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter discussion list <netfilter@vger.kernel.org>

martin f krafft a =E9crit :
> also sprach Pascal Hambourg <pascal.mail@plouf.fr.eu.org> [2008.04.03=
=2E1707 +0200]:
>=20
>>I'm not sure what you both mean. I tested the IPv6 conntrack on vanil=
la =20
>>2.6.20 and 2.6.24 kernels built from kernel.org sources and everythin=
g =20
>>worked as expected :
>=20
>=20
> I agree, it works if you don't have INVALID at all, but try:
>=20
>   -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>   -A INPUT -m state --state INVALID -j DROP
>   -A INPUT -m state --state NEW -j in-new
>=20
> and this will match echo-requests on my 2.6.24. echo-replies get
> matched by the first rule, but echo-requests should be NEW, not
> INVALID.
>=20
>=20
>>I do not see a reason why 2.6.22 would behave differently. Maybe
>>there is something special in Debian kernels ?
>=20
>=20
> This bug I see with 2.6.18

Of course, Debian's 2.6.18 does not support IPv6 conntrack.

> and someone else with 2.6.22.

Nicolas ? He just wrote he couldn't reproduce it.

> It's
> a different issue than what this thread is about: that pre-2.6.24
> kernels don't seem to register OUTGOING packets in the connection
> table.

This is higly unlikely IMHO. People would have noticed it.

> Or are you saying that if you ping6 from the machine with the
> iptables rules to somewhere else, the echo-reply gets matched by
> RELATED or ESTABLISHED?

Yes, of course. The outgoing echo request is in the NEW state and the=20
incoming echo reply is in the ESTABLISHED state. Same with an incoming=20
echo request.

> Because it certainly does *not* here.
>=20
> $ ping6 ipv6.aerasec.de(2001:a60:9002:1::184:1) yields:
>=20
> [INPUT6]: IN=3Deth2 OUT=3D MAC=3D00:16:3e:46:5a:86:00:0e:d6:b8:dc:1b:=
86:dd
> SRC=3D2001:0a60:9002:0001:0000:0000:0184:0001
> DST=3D2001:1620:2004:0000:0000:0000:0000:0002 LEN=3D104 TC=3D0 HOPLIM=
IT=3D57
> FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D129 CODE=3D0 ID=3D34094 SEQ=3D1
>=20
> which is logged after falling through the end of the chain and *not*
> being matched by ESTABLISHED,RELATED. Note that the source address
> is the same as the destination address to which I sent the
> echo-request.

There must be something wrong with your kernel.
Here is what I get :

[NEW]   IN=3D OUT=3Deth2 SRC=3D2001:07a8:6d23:####=20
DST=3D2001:0a60:9002:0001:0000:0000:0184:0001 LEN=3D104 TC=3D0 HOPLIMIT=
=3D64=20
=46LOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 CODE=3D0 ID=3D55565 SEQ=3D1

[ESTAB] IN=3Deth2 OUT=3D MAC=3D####=20
SRC=3D2001:0a60:9002:0001:0000:0000:0184:0001 DST=3D2001:07a8:6d23:####=
=20
LEN=3D104 TC=3D0 HOPLIMIT=3D53 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D129 CO=
DE=3D0 ID=3D55565=20
SEQ=3D1

with the following test ruleset :

ip6tables -t mangle -N logstate
ip6tables -t mangle -A logstate -m state --state NEW -j LOG \
   --log-prefix "[NEW]   "
ip6tables -t mangle -A logstate -m state --state ESTABLISHED -j LOG \
   --log-prefix "[ESTAB] "
ip6tables -t mangle -A logstate -m state --state RELATED -j LOG \
   --log-prefix "[RELAT] "
ip6tables -t mangle -A logstate -m state --state INVALID -j LOG \
   --log-prefix "[INVAL] "
ip6tables -t mangle -A logstate -m state --state UNTRACKED -j LOG \
   --log-prefix "[UNTRA] "

ip6tables -t mangle -A PREROUTING -j logstate
ip6tables -t mangle -A OUTPUT -j logstate
