From: Eric Leblond <eleblond@inl.fr>
Subject: Re: ipq_read error
Date: Thu, 27 Oct 2005 13:58:50 +0200
Message-ID: <1130414330.14426.73.camel@localhost.localdomain>
References: <12274.1130407731@www36.gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-kvYsIfzgB4j2s/btoNEe"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12274.1130407731@www36.gmx.net>
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
To: Peter.Muller@gmx.at
Cc: netfilter@lists.netfilter.org


--=-kvYsIfzgB4j2s/btoNEe
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 27 octobre 2005 =E0 12:08 +0200, Peter.Muller@gmx.at a =E9crit :
> Hello!
>=20
> I'm using libipq's ipq_read function in a program to read packets that we=
re
> queued to userspace by a kernel module.
> Does ipq_read really needs root privileges or are there other solutions? =
Any
> help on this is appreciated.

As the program is directly talking to the kernel, you need to be root to
be able to access libipq.

A standard solution is to switch to a given user as soon as you do not
need anymore root privileges.

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-kvYsIfzgB4j2s/btoNEe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDYMD5nxA7CdMWjzIRAtwSAJ96kbdQ6YrBonnv+og2/2P27+U+wgCfUuYA
3jScL41E6LjCAzbB6wogHa8=
=8EKx
-----END PGP SIGNATURE-----

--=-kvYsIfzgB4j2s/btoNEe--


