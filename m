From: Eric Leblond <eric@regit.org>
Subject: Re: Proxies
Date: Wed, 17 Dec 2003 14:54:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071669257.28521.37.camel@tech004.alphalink.fr>
References: <32916.66.4.149.1.1071667972.squirrel@www.korrnet.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-gTEEX1nnPTrJmHJ2Cvsf"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <32916.66.4.149.1.1071667972.squirrel@www.korrnet.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: jwebb@korrnet.org
Cc: netfilter@lists.netfilter.org


--=-gTEEX1nnPTrJmHJ2Cvsf
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le mer 17/12/2003 =E0 14:32, jwebb@korrnet.org a =E9crit :
> Hello,
>
> We've been blocking based on port, and obviously we can't block all of
> port 80 outbound.  Is there any way to block a proxy on port 80 and still
> have it be transparent to the users?

Install a transparent proxy like squid. It should be able to detect a
part of non HTTP traffic.
You can also use the Layer7 filtering project to match only HTTP request
on port 80.

BR,
--=20
Eric Leblond
NuFW, Now User Filtering Works (http://www.nufw.org)

--=-gTEEX1nnPTrJmHJ2Cvsf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/4GAJnxA7CdMWjzIRApodAKCNrcLxMMj85g8iIerHQNuMpaBT3QCeIzw3
JPm8LXE4ATcU3qUkKAYLYfg=
=3Zh9
-----END PGP SIGNATURE-----

--=-gTEEX1nnPTrJmHJ2Cvsf--


