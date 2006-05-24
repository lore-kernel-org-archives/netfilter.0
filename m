From: Eric Leblond <eric@inl.fr>
Subject: Re: User space firewall
Date: Wed, 24 May 2006 19:11:28 +0200
Message-ID: <1148490688.13582.20.camel@localhost.localdomain>
References: <44749333.5080805@gmx.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-DFkgGEs7c3z0CRCREQ8e"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44749333.5080805@gmx.at>
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
To: halfdog@gmx.at
Cc: netfilter@lists.netfilter.org


--=-DFkgGEs7c3z0CRCREQ8e
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 mai 2006 =E0 19:09 +0200, halfdog@gmx.at a =E9crit :
> Hi all,
>=20
> I want to write a (simple) user space firewall. All packets not acceptabl=
e for=20
> the iptables go to as netlink message (ulog) to the user space. All estab=
lished=20
> connections are kept. The user is then to decide, if he accepts the conne=
ction.

have you heard about libnetfilter_queue (or ip_queue). This is done for
that. Do NOT use ulog to do this!

See http://www.netfilter.org/ for information about libnetfilter_queue.

For code example, you can have a look at NuFW : http://www.nufw.org/

BR,

>=20
> Use case: Lets assume a Tcp-Syn hits the iptables, gets rejected, capture=
d by my=20
> software. What should I do to make the connection stable?
>=20
> * Just push the Syn into the stack again, will this make the connection=20
> established? If yes, where to put it so that I do not have to care about =
Nat and=20
> so on, so it should go rather the same way an accepted packet would have =
gone.
>=20
> * Modify the conntrack tables first and then push the syn back?
>=20
> * Do I have to go an more complicated way?
>=20
> Thanks for your input,
>=20
> halfdog
>=20
>=20
>=20
>=20


--=-DFkgGEs7c3z0CRCREQ8e
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEdJO/nxA7CdMWjzIRAq9/AJ9PANYWlqVmfdFCFb61yuxYCuCyoQCcDO68
AFrgmY5pI1q98oiJMFtvVQU=
=fSny
-----END PGP SIGNATURE-----

--=-DFkgGEs7c3z0CRCREQ8e--


