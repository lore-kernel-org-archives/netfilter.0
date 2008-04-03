From: Nicolas KOWALSKI <niko@petole.dyndns.org>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Thu, 03 Apr 2008 11:36:43 +0200
Message-ID: <87r6dn1dqs.fsf@petole.dyndns.org>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net>
	<20080403081822.GA13254@piper.oerlikon.madduck.net>
	<47F4A36A.2010600@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47F4A36A.2010600@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal.mail@plouf.fr.eu.org> writes:

> martin f krafft a =C3=A9crit :
>>
>> Is IPv6 connection tracking on 2.6.18 just broken?
>
> Are you using a 2.6.18 kernel image from Debian etch or a custom one =
?

I noticed the same behaviour on Etch + kernel 2.6.22 (from
backports.org): ICMPv6 echo replies are matched by INVALID.

--=20
Nicolas
