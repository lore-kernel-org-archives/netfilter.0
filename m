From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 04 Apr 2008 18:19:12 +0200
Message-ID: <47F65500.8040705@plouf.fr.eu.org>
References: <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <20080403152330.GA15573@piper.oerlikon.madduck.net> <47F56197.1000504@plouf.fr.eu.org> <20080404085029.GA27854@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080404085029.GA27854@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter discussion list <netfilter@vger.kernel.org>

martin f krafft a =E9crit :
>=20
>>>This bug I see with 2.6.18
>>
>>Of course, Debian's 2.6.18 does not support IPv6 conntrack.
>=20
> Okay, this is all I was asking in the original mail.
>=20
> Note, however, that the 2.6.18 kernel modules exist and everything
> can be set up without errors, it then just doesn't work.

This is getting confused. Didn't you wrote "I can confirm that nf_*=20
modules are not present in Debian's 2.6.18" ?

>>>and someone else with 2.6.22.
>>
>> Nicolas ? He just wrote he couldn't reproduce it.
>=20
> Okay, I have not tried.

But you reply him that "this is still the case with 2.6.24."
So what exactly is wrong with IPv6 conntrack in 2.6.24 ?
On which pre-2.6.24 versions - besides Debian's 2.6.18 image which has=20
IPv6 conntrack support disable at build time, this is not a bug but a=20
feature - do you see an IPv6 conntrack bug such as the "don't seem to=20
register OUTGOING packets in the connection table" bug you described ?

>>>Or are you saying that if you ping6 from the machine with the
>>>iptables rules to somewhere else, the echo-reply gets matched by
>>>RELATED or ESTABLISHED?
>>
>>Yes, of course. The outgoing echo request is in the NEW state and
>>the  incoming echo reply is in the ESTABLISHED state. Same with an
>>incoming  echo request.
>=20
> ... except for 2.6.18, where everything seems like that should be
> the case, but it doesn't work at all. Packets aren't even in the NEW
> state, it seems.
>=20
> On 2.6.18, I've observed that --state INVALID seems to match *all*
> IPv6 packets, and NEW,ESTABLISHED,RELATED match *none*.

If I understood correctly, that's just because Debian's 2.6.18 kernel=20
image has NF_CONNTRACK disabled at build time and lacks IPv6 conntrack=20
support. So using the 'state' match in ip6tables rules with this kernel=
=20
just makes no sense. If you build a custom 2.6.18 kernel with=20
NF_CONNTRACK and IPv6 conntrack support enabled instead of=20
IP_NF_CONNTRACK, I bet that IPv6 packets will have the proper state.

>>There must be something wrong with your kernel.
>=20
> Yeah, it's 2.6.18.

I thought you meant a pre-2.6.24 kernel other than the Debian's 2.6.18.

> You have 2.6.20. Apparently conntrack has been
> worked on.

AFAIK, the only improvement in the area of this thread is that an error=
=20
"can't load conntrack support for proto=3D10" is triggered when you try=
 to=20
use the 'state' match in ip6tables if the kernel is built with=20
ip_conntrack, thus lacks IPv6 conntrack support.
