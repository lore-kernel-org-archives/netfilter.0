From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 13:19:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076930382.2334.8.camel@raylinux.internal>
References: <005801c3f475$91a645d0$2d64a8c0@pcjka>
	 <1076927162.2333.6.camel@raylinux.internal>
	 <200402161047.18866.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-q5dmQFrADo3k8JjIbPsw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402161047.18866.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'netfilter' <netfilter@lists.netfilter.org>


--=-q5dmQFrADo3k8JjIbPsw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-02-16 at 12:47, Antony Stone wrote:
> On Monday 16 February 2004 10:26 am, Ray Leach wrote:
>=20
> > The 'filter' table does not exist by default, but the 'FILTER' table
> > does. Is this a user chain than you created?
>=20
> I think you're getting confused here about the difference between chains =
and=20
> tables.
>=20
Thank you, you are quite correct ...

> Chains are normally named in uppercase; standard ones are INPUT, OUTPUT,=20
> PREROUTING, POSTROUTING, FORWARD.   User-defined chains can of course be=20
> added.
>=20
> Tables are normally named in lowercase; standard ones are filter, nat, ma=
ngle.  =20
> Adding a user-defined table is quite a significant programming task, and =
not=20
> to be assumed in a reasonably standard configuration of netfilter :)
>=20
> The 'filter' table should exist in any healthy netfilter install.
>=20
> Regards,
>=20
> Antony.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-q5dmQFrADo3k8JjIbPsw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAMKdOh1fuR/Bv+ygRAgpoAKCuGrwVnorFhd+qPJSKwDWSH4i4bQCfZd6C
aEu9H23z/VQ0BPAtH1rRcSM=
=mHuk
-----END PGP SIGNATURE-----

--=-q5dmQFrADo3k8JjIbPsw--


