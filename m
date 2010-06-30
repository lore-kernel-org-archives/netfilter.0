From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables mac update
Date: Wed, 30 Jun 2010 18:54:11 -0500
Message-ID: <4C2BD923.9020503@riverviewtech.net>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>	 <4C29E8B4.5060205@plouf.fr.eu.org>	 <1277821770.4006.33.camel@casper.meteor.dp.ua>	 <4C2B6536.2060401@plouf.fr.eu.org> <1277941138.11021.20.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1277941138.11021.20.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB wrote:
> Funny thing is that the problem persist. Tonight I've made some tests=
=20
> with 782M. I've connected two computers in my office (win7 and linux)=
=20
> through this pair directly. I seccessfully tested ping both=20
> directions, then switched them so that each crossed the bridge and=20
> was unable to ping.

When you switch then, do the Linux and Windows systems know that their=20
network cable has been unplugged?

If they do, they will very likely flush their caches.

If the problem persists after the Linux and Windows systems flush their=
=20
cache, I'm strongly thinking that the problem is with the DSL bridges.

> Regarding this I can surely tell (this is all about 782M pair) that=20
> after box crossing the bridge MAC-port table is not updating (how it=20
> should be if it were switch's logic). Packets with srcMAC of crossed=20
> box CAN cross the bridge, but with dstMAC of crossed box CANNOT cross=
=20
> the bridge.

That really sounds like the something is not forwarding traffic b/c it=20
still thinks that the destination MAC is on the local side.

Please clarify, when you ran your test, did you try trading sides of th=
e=20
Linux bridge individually or the Linux bridge in combination with the=20
DSL bridge?

Can you try repeating your test on either side of the Linux bridge?



Grant. . . .
