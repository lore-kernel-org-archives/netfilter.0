From: Eric Leblond <eric@inl.fr>
Subject: Re: nfnetlinkf ctnetlink ct-event
Date: Thu, 08 Mar 2007 17:31:41 +0100
Message-ID: <1173371501.31743.2.camel@localhost.localdomain>
References: <009801c7619e$dff4adf0$7100000a@W2KMPLOURDE>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-WpMtqcOTfppoSJW4amjY"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009801c7619e$dff4adf0$7100000a@W2KMPLOURDE>
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
To: Michael Plourde <mplourde@digicom.ca>
Cc: netfilter@lists.netfilter.org


--=-WpMtqcOTfppoSJW4amjY
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 08 mars 2007 =E0 11:28 -0500, Michael Plourde a =E9crit :
> Hi,
>=20
> i want to patch my kernel 2.4.25 to use conntrack-1.00.=20
> Could someone give me tips and URL to get those patchs?

This can not be done as nfnetlink infrastructure is only available for
2.6.14 and over.

I fear you need to upgrade your kernel or do a huge backport.

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 39, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-WpMtqcOTfppoSJW4amjY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBF8DpsnxA7CdMWjzIRAsKSAJ4k1gxMjKhHI6t3MTu5R3OreSSmdgCaAu3F
OzPZUKqp+PKyYHSELL4F7C4=
=9syF
-----END PGP SIGNATURE-----

--=-WpMtqcOTfppoSJW4amjY--


