From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Thu, 15 May 2008 18:09:56 +0300
Message-ID: <1210864196.6423.17.camel@casper.meteor.dp.ua>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
	 <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
	 <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>
	 <774cb3b60805150611w292f88d1le77aece2ade7e934@mail.gmail.com>
	 <774cb3b60805150732o1ee9f5fao53537d46bec76ac2@mail.gmail.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <774cb3b60805150732o1ee9f5fao53537d46bec76ac2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?J=FCrgen?= Rochol <juergen.rox@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

=D0=92 =D0=A7=D1=82=D0=B2, 15/05/2008 =D0=B2 11:32 -0300, J=C3=BCrgen R=
ochol =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi,
>=20
> Now it goes my scenario.
> What I found is that the same packet is evaluated not only by the
> first match, but by ALL matches
>=20
> Suppose you have two PCs (PC1 and PC2).
>=20
> PC1 only sends continuously  ping packets (icmp echo request)  to PC2=
,
> which answers it, depending on the rules.
>=20
> So, if you have:
>=20
> A) iptables -P OUTPUT DROP
> * PC1 does not receive any answer -> Ok, no problem, this is the defa=
ult policy
>=20
> B)  iptables -P OUTPUT DROP  and iptables -A OUTPUT -t filter  -p icm=
p
>  -j ACCEPT
> * PC1 receives the reply. This is because on the OUTPUT chain there's
> a rule saying: Ok, accept it. And  this is the FIRST to be evaluated
> on OUTPUT chain, so it is expected to be like this.
>=20
> C)  iptables -P OUTPUT DROP  and iptables -A OUTPUT -t filter  -p icm=
p
>  -j ACCEPT and iptables -t mangle -A POSTROUTING -p icmp -j TTL
> --ttl-dec 10
>=20
> What happens now?
> * PC1 receives the reply.  This is the *first match* for this packet
> (as in B). So thats ok.
> * But other thing happens: PC1 receive the reply with TTL decremented=
=2E
> So the 3rd rule above was also evaluated. That is, for a same packet,
> 2 rules were applied.
>=20
> I thought that only the first match should be evaluated. Moreover, if=
 you add:
>  iptables -t mangle -A POSTROUTING -p icmp  -j TOS --set-tos 0x10
>=20
> it will be also evaluted and PC1 will receive packets with ToS change=
d.
>=20
> In short, for the same packet, what you have is:
>=20
> 1 evaluation in OUTPUT chain.
> 2 evaluations in POSTROUTING chain.

The things is that:

1. Packet is being examined in each table regarding a sequence. So if i=
t
matches the rule in the mangle table it can also match in the filter
table. You should see linux firewall scheme so that you can understand
how packets are passing through the firewall.

2. Some targets doesn't return if matched. Example is -t mangle -j MARK
- it doesn't return! This case, if you really want to return you should
explicitely return like this:
 #iptables -t mangle -A FORWARD -s IP1 -j MARK --set-mark 10
 #iptables -t mangle -A FORWARD -s IP1 -j RETURN
 #iptables -t mangle -A FORWARD -s IP2 -j MARK --set-mark 11
 #iptables -t mangle -A FORWARD -s IP2 -j RETURN

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

