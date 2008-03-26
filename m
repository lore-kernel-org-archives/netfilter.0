From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Wed, 26 Mar 2008 12:03:10 +0100
Message-ID: <47EA2D6E.9090409@plouf.fr.eu.org>
References: <20080325012807.GA15637@transpect.com> <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr> <20080325024424.GA16089@transpect.com> <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik a =E9crit :
>=20
> If you have got ethernet devices with MTU smaller than 1500, those wo=
n't=20
> support IPv6 and therefore don't show up in /proc/sys/net/ipv6/conf.

Don't you mean smaller than 1280 ?
