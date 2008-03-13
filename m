From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Performance question for chains
Date: Thu, 13 Mar 2008 10:18:06 +0200
Message-ID: <1205396286.4457.5.camel@casper.meteor.dp.ua>
References: <200803122024.56217.bossk@tyntec.biz>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803122024.56217.bossk@tyntec.biz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: bossk@tyntec.biz
Cc: netfilter@vger.kernel.org

=F7 =F3=D2=C4, 12/03/2008 =D7 20:24 +0100, bossk =D0=C9=DB=C5=D4:
> Hi,
>=20
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
>=20
> The following packets just traverse the first rule.=20
>=20
> My question now is are there any drawbacks to do it this way? Or is t=
here=20
> another more convenient way to do it?

1. You can match first packet in the nat table and DROP/ACCEPT there.
2. You may consider using ipset patch, this will allow you to use
bindings (IP/port single rule match). Also sets are hashed or in a
tree-like structure, depending on what you choose.

Also don't forget about RELATED packets. ICMP is not only a PING!

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

