From: Eric Leblond <eric@regit.org>
Subject: Re: Logging packet owner
Date: Thu, 11 Dec 2003 23:08:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071180480.10512.8.camel@porky>
References: <3FD8E2D6.3040803@live365.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-KAt68lBVTy+1ZnPrqb2W"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD8E2D6.3040803@live365.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "John E. Leon Guerrero" <jguerrero@live365.com>
Cc: netfilter@lists.netfilter.org


--=-KAt68lBVTy+1ZnPrqb2W
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le jeu 11/12/2003 =C3=A0 22:34, John E. Leon Guerrero a =C3=A9crit :
> Hi folks, I browsed the last 7 months of archives and didn't see this=20
> question addressed.
>=20
> Are there plans to allow logging the packet owner?  For example, I get=20
> rogue DNS requests eminating from my workstation and I'd like to know=20
> which process is doing this.

you can do full user filtering and activity logging with the nufw
project which is based on netfilter :
	http://www.nufw.org/
Complete logging of dropped packets will be available on the next
release (0.6.1), which is planned to be available on monday (code is in
cleaning and testing phase).

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-KAt68lBVTy+1ZnPrqb2W
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/2OrAnxA7CdMWjzIRAnNYAJ9BH0J7CKWN4HPwotYjtt7Pt5w6cACfaqY2
csbymBrTDUbljQzd+2K10ps=
=GIoV
-----END PGP SIGNATURE-----

--=-KAt68lBVTy+1ZnPrqb2W--

