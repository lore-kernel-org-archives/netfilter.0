From: Eric Leblond <eric@regit.org>
Subject: Re: ip_conntrack_ftp
Date: Tue, 14 Oct 2003 18:08:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066147702.1692.38.camel@porky>
References: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E3@eai-exchange.edgeaccess.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dS+g08yR3AhO/q+MMl/E"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E3@eai-exchange.edgeaccess.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Britt Tabor <btabor@edgeaccess.net>
Cc: netfilter@lists.netfilter.org


--=-dS+g08yR3AhO/q+MMl/E
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le lun 13/10/2003 =C3=A0 23:22, Britt Tabor a =C3=A9crit :
> lsmod:
> bash-2.05# lsmod
> Module                  Size  Used by
> ip_conntrack_ftp        3856   0  (unused)
> vhub                    9664   0  (unused)
> iptable_nat            14432   1  (autoclean)
> ip_conntrack           16656   2  (autoclean) [ip_conntrack_ftp iptable_n=
at]
> iptable_filter          1760   1  (autoclean)
> via-rhine              12768   1=20
> eepro100               18432   1=20
> mii                     2160   0  [via-rhine eepro100]
> pcmcia_core            40608   0=20
> doc                   146464   1
>=20
> why does my ftp data still get block/dropped ???
the NAT is the problem the module "ip_nat_ftp" is not here to correctly
nat connection.

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-dS+g08yR3AhO/q+MMl/E
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/jB92nxA7CdMWjzIRAgrVAJwOeAA8u9l+q+vJBJVPij6RtimxMgCggHXD
6JX2fAvAstvyQ1OZkG5dOhM=
=X1Q1
-----END PGP SIGNATURE-----

--=-dS+g08yR3AhO/q+MMl/E--


