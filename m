From: David Cary Hart <dch@TQMcube.com>
Subject: Re: Shorewall vs. Iptables
Date: Thu, 12 Feb 2004 17:17:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076624237.3037.26.camel@dchws.TQMcube.com>
References: <004201c3f1af$b16d7fa0$2405010a@rsa>
	 <200402121356.56294.teastep@shorewall.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qp4Wyd6H1LpWFQqkAgT5"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402121356.56294.teastep@shorewall.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Tom Eastep <teastep@shorewall.net>
Cc: Ray Anderson <rsa@prideindustries.com>, Netfilter Users' List <netfilter@lists.netfilter.org>


--=-qp4Wyd6H1LpWFQqkAgT5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-02-12 at 16:56, Tom Eastep wrote:

> My opinion is far from unbiased but here goes. Shorewall is a high-level =
tool=20
> for configuring netfilter. It uses the iptables utility to do so. As a=20
> result, it cannot offer any more protection than the iptables utility use=
d=20
> alone can provide.
>=20
Correct me if I am wrong but Shorewall only works properly on a
dedicated box. In other words, if you are running netfilter on the same
machine as a server then Shorewall doesn't work properly.

--=-qp4Wyd6H1LpWFQqkAgT5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAK/ttol4OE0cpGaIRAjXuAJwPTjcG2Fw6L0xFER2kIstJdAezNACfYOlh
LrQoLksaOvoKtytenHf9R9Y=
=KQCq
-----END PGP SIGNATURE-----

--=-qp4Wyd6H1LpWFQqkAgT5--


