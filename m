From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Performance question for chains
Date: Thu, 13 Mar 2008 13:50:42 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803131337310.14822@fbirervta.pbzchgretzou.qr>
References: <200803122024.56217.bossk@tyntec.biz> <1205396286.4457.5.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1205396286.4457.5.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?= =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Cc: bossk@tyntec.biz, netfilter@vger.kernel.org


On Mar 13 2008 10:18, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=
=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wrote:
>
>1. You can match first packet in the nat table and DROP/ACCEPT there.

Just because it is possible, it is not good to do so.
Loading NAT introduces no less than 3 hooks, so you
do not really save any processing time.

Do not rely on the semantics of the nat table!
It gets the first packet yes, but what "first" is
depends on the implementation of connection tracking;
in some cases even *all*, or significantly more than one
packet goes through nat.

Do not do that, it needlessy needs resources and the nat table
is an IPv4-specific thing.

>2. You may consider using ipset patch, this will allow you to use
>bindings (IP/port single rule match). Also sets are hashed or in a
>tree-like structure, depending on what you choose.
>
>Also don't forget about RELATED packets. ICMP is not only a PING!


> I have a lot of FORWARD rules to the same IPs and handfull different =
ports and=20
> I try to increase the overall performance. I have the following rules=
et in my=20
> mind to achieve this goal,
>=20
> iptables -A FORWARD -d 10.0.0.1 -j next
> iptables -A next -p TCP --dport 111 -j next2
> iptables -A next2 -s 10.7.0.1 -j ACCEPT
>=20
> This means that I have to traverse 2 chains and than the next2 chain =
for=20
> finding the right IP. If the sender sends another packet the packet h=
as to=20
> traverse the same chains again. If I instead do a
>=20
> iptables -A FORWARD -d 10.0.0.1 -m conntrack --ctstate ESTABLISHED -j=
 ACCEPT
> iptables -A FORWARD -d 10.0.0.1 -j next
> iptables -A next -p TCP --dport 111 -j next2
> iptables -A next2 -s 10.7.0.1 -m conntrack --ctstate NEW -j ACCEPT
>
> The following packets just traverse the first rule.=20
>=20
> My question now is are there any drawbacks to do it this way? Or is t=
here=20
> another more convenient way to do it?

It is perfectly fine. You may want to use -g instead of -j, depending o=
n=20
your possibilities.
