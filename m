From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Wed, 26 Mar 2008 12:12:54 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803261211470.3620@blackhole.kfki.hu>
References: <20080325012807.GA15637@transpect.com>
 <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
 <20080325024424.GA16089@transpect.com> <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu>
 <47EA2D6E.9090409@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-474819862-1206529974=:3620"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47EA2D6E.9090409@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-474819862-1206529974=:3620
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Mar 2008, Pascal Hambourg wrote:

> Jozsef Kadlecsik a =E9crit :
> >=20
> > If you have got ethernet devices with MTU smaller than 1500, those won'=
t
> > support IPv6 and therefore don't show up in /proc/sys/net/ipv6/conf.
>=20
> Don't you mean smaller than 1280 ?

You are right, the exact boundary is 1280.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-474819862-1206529974=:3620--
