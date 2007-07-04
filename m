From: Eric Leblond <eric@inl.fr>
Subject: Re: Difference
Date: Wed, 04 Jul 2007 15:56:12 +0200
Message-ID: <1183557372.15193.1.camel@khasse.inl.fr>
References: <000e01c7be42$6cb41a50$0200640a@wtlc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-OPwgf+38lhE04RSmvB/i"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c7be42$6cb41a50$0200640a@wtlc>
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
To: Andrea Bencini <andrea.bencini@tin.it>
Cc: netfilter@lists.netfilter.org


--=-OPwgf+38lhE04RSmvB/i
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 04 juillet 2007 =C3=A0 15:51 +0200, Andrea Bencini a =C3=A9crit=
 :
> what the difference between the "ip_conntrack" and "nf_conntrack" is?

ip_conntrack is the old IPv4-only implementation that will soon
disappear.
nf_conntrack is the new one and is IPv6 compliant.

BR,
--=20
=C3=89ric Leblond, eleblond@inl.fr
T=C3=A9l=C3=A9phone : 01 44 89 46 39, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-OPwgf+38lhE04RSmvB/i
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGi6b8nxA7CdMWjzIRAjajAJ9rpQHjeIe3G8Rl35+vZ4BmNkBKqgCgjpnJ
cKrVP9sSYDXf9now1+IaBdI=
=XvhL
-----END PGP SIGNATURE-----

--=-OPwgf+38lhE04RSmvB/i--


