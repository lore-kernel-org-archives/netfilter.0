From: hanxin <benny@telindus.com.hk>
Subject: Re: ip range generic matches
Date: 26 Feb 2003 14:44:33 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046241881.936.2.camel@mobile_benny>
References: <7dfe27f780.7f7807dfe2@student.uml.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-4CaihuBX0CYjnhvfgduJ"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7dfe27f780.7f7807dfe2@student.uml.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter <netfilter@lists.netfilter.org>


--=-4CaihuBX0CYjnhvfgduJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2003-02-26 =E4=B8=89 =E7=9A=84 14:23=EF=BC=8C William Olbrys =E5=
=86=99=E9=81=93=EF=BC=9A
> is there a syntax to to create a generic match for a range of ips
> instead of the whole thing?=20
>=20
> ex.: $IPTABLES -t filter -A FORWARD -s 10.1.2.0-10.1.5.255 -j ACCEPT
>=20

use netmask,=20
ex. : iptables -t filter -A FORWARD -s 10.1.0.0/16 -j ACCEPT

> i tried to do this and it gave me an error about not being able to find
> the host. is there a workaround?
>=20
> will olbrys
>=20
>=20
>=20
>  E2-O: The presence of this footer indicates the message has been scanned=
 for viruses by the WebShield e500.
>=20
>=20
>=20
--=20

Regards,
Benny


pub  1024D/2A4B237A


--=-4CaihuBX0CYjnhvfgduJ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQA+XGJQ9Y/ucypLI3oRAsr1AJ9W47QViW7abjxNfM4eO0YxpLd6+QCfXopi
io8/LdkmCiwsIkbWjHYJyXg=
=AQGc
-----END PGP SIGNATURE-----

--=-4CaihuBX0CYjnhvfgduJ--


