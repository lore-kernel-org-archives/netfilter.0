From: Eric Leblond <eric@regit.org>
Subject: Re: rp-l2tpd iptables and rh9 but no google
Date: 18 Jul 2003 21:49:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058557759.16546.2.camel@porky>
References: <HBELLDKFGOFPEHBLCFCLCEBJCCAA.rverduij@dds.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VPwxpnCEelprnY0xofgW"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HBELLDKFGOFPEHBLCFCLCEBJCCAA.rverduij@dds.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-VPwxpnCEelprnY0xofgW
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le ven 18/07/2003 =E0 21:01, Rob Verduijn a =E9crit :
> Hi there,
>=20
> I've got this curious problem with netfilter.

> I did
> echo 1 > /proc/sys/net/ipv4/ip_forward

>=20
> I can ping google so icmp seems to work but I can't surf the web for goog=
le.
> Neither windows nor linux will work.

You may have look to the MTU, with encapsulation in L2TP you loose some
bytes.
To test try increase your ping size with the -s option.

If it is working with -s 1500 then try to look at tcpmss.

BR,
--=20
Eric Leblond <eric@regit.org>

--=-VPwxpnCEelprnY0xofgW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/GE8/nxA7CdMWjzIRAsBGAJ91450p/Je2jKFLo+MMu5uytSSsSACfUSdD
v/g5thnMkbFmX7YGDfeo0Fk=
=CtGV
-----END PGP SIGNATURE-----

--=-VPwxpnCEelprnY0xofgW--

