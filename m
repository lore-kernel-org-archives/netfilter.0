From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Fri, 04 Apr 2008 01:03:53 +0200
Message-ID: <47F56259.6080203@plouf.fr.eu.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <87r6dn1dqs.fsf@petole.dyndns.org> <20080402212653.GC11325@piper.oerlikon.madduck.net> <20080403081822.GA13254@piper.oerlikon.madduck.net> <47F4A36A.2010600@plouf.fr.eu.org> <20080403102632.GA22035@piper.oerlikon.madduck.net> <47F4F2B0.9020205@plouf.fr.eu.org> <20080403152330.GA15573@piper.oerlikon.madduck.net> <47F56197.1000504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F56197.1000504@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter discussion list <netfilter@vger.kernel.org>

Pascal Hambourg a =E9crit :
> martin f krafft a =E9crit :
>=20
>> It's
>> a different issue than what this thread is about: that pre-2.6.24
>> kernels don't seem to register OUTGOING packets in the connection
>> table.
>=20
> This is higly unlikely IMHO. People would have noticed it.
>=20
>> Or are you saying that if you ping6 from the machine with the
>> iptables rules to somewhere else, the echo-reply gets matched by
>> RELATED or ESTABLISHED?
>=20
> Yes, of course. The outgoing echo request is in the NEW state and the=
=20
> incoming echo reply is in the ESTABLISHED state. Same with an incomin=
g=20
> echo request.

Oops, I forgot to mention :
# uname -r
2.6.20.3
