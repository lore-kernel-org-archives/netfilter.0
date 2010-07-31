From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipv6 forwarding without netfilter
Date: Sat, 31 Jul 2010 19:47:43 +0200
Message-ID: <4C5461BF.1000604@plouf.fr.eu.org>
References: <AANLkTik0MPyj4Vthm1fFXA56yEMW-a5FJ_vP6+-U+WhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik0MPyj4Vthm1fFXA56yEMW-a5FJ_vP6+-U+WhQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Ryden <markryde@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Mark Ryden a =E9crit :
> According to this link:
> http://www.faqs.org/docs/Linux-HOWTO/Linux+IPv6-HOWTO.html#FIREWALLIN=
G-NETFILTER6
>=20
> "In IPv6 you can't control forwarding per device, forwarding control
> has to be done using IPv6-netfilter (controlled with ip6tables)
> rulesets and specify input and output devices (see
> Firewalling/Netfilter6  for more). This is different to IPv4, where
> you are able to control forwarding per device (decision is made on
> interface where packet came in). "
>=20
> My question is:
> Suppose you don't want to control forwarding in IPv6 on a certain
> device, just forward packets which are received on any device.
> I am not sure that this howto is relevant.
> Is it true that in order to achieve IPV6 forwarding you must use
> netfilter rule ?

No.

> Is it possible to achieve forwarding simply by running:
> echo "1" /proc/sys/net/ipv6/conf/all/forwarding
>=20
> without setting any ip6tables netfilter rule ?

Yes.
If you don't need filtering, you don't need ip6tables.
