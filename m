From: Harald Welte <laforge@gnumonks.org>
Subject: Re: Question about TTL patch
Date: Tue, 16 Sep 2003 08:38:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916063813.GB666@obroa-skai.de.gnumonks.org>
References: <Pine.LNX.4.44.0309121504370.7718-100000@pingwin.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0309121504370.7718-100000@pingwin.eu.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Andrzej Nakonieczny <dzemik@pingwin.eu.org>
Cc: netfilter@lists.netfilter.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2003 at 03:11:17PM +0200, Andrzej Nakonieczny wrote:
> Hello.
>=20
> 	I would like to add TTL target to my own chain. This chain is=20
> connected to POSTROUTING's chain in mangle table. But when I try to add=
=20
> that target then I've got "iptables: Invalid argument". Is there any=20
> simple way to do that ?

Actually I don't think there is a way you could call the TTL target,
where you would just receive the 'Invalid Argument' message without any
further error message in syslog/dmesg.

All four error paths in checkfn() do a printk about the exact error
cause.

> Regards,
> Andrzej

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/Zq/VXaXGVTD0i/8RAqFJAKCRDUvnyB/U4hsyRMTFL04uQWvYxgCdHw6j
V0R1OIJEDggJGRYYbvwjBCE=
=uZ5W
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

