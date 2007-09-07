From: Eric Leblond <eric@inl.fr>
Subject: Re: Cryptic ulogd 2.0.0beta1 error message
Date: Fri, 07 Sep 2007 23:51:16 +0200
Message-ID: <1189201876.8516.4.camel@localhost>
References: <20070907233438.aefd66ca.cthompson@libertysurf.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-nuwKEa13rvPYQndQ++mn"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070907233438.aefd66ca.cthompson@libertysurf.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-nuwKEa13rvPYQndQ++mn
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 07 septembre 2007 =E0 23:34 +0200, Christoph J. Thompson a
=E9crit :
> Greetings,
>=20
> I'm trying to get ulogd 2.0.0beta1 to work but each time I start the daem=
on I get this in my log file:
>=20
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `NFLOG'
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `NFCT'
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `IFINDEX'
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `LOGEMU'
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `OPRINT'
> Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `BASE'
> Fri Sep  7 22:21:45 2007 <8> ulogd.c:928 not even a single working plugin=
 stack

Use svn version, it should fix the bug :
https://svn.netfilter.org/netfilter/branches/ulog/ulogd2

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-nuwKEa13rvPYQndQ++mn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD4DBQBG4cfUnxA7CdMWjzIRApPrAJ0UdnZ4mnR0EIhdh9Lgw8rZG0ObMQCYmTfb
xiyCvkEbkc+j8pZoP3wWpA==
=YcEI
-----END PGP SIGNATURE-----

--=-nuwKEa13rvPYQndQ++mn--


