From: Eric Leblond <eric@regit.org>
Subject: Re: tcp & udp timeout hardcoding
Date: Mon, 17 Nov 2003 17:30:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069086632.2640.3.camel@tech004.alphalink.fr>
References: <20031117144208.GA22431@nest.8d.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-adC0LW7skQ481jywmzaP"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117144208.GA22431@nest.8d.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: xavier <list.netfilter@natch.dyndns.org>
Cc: netfilter@lists.netfilter.org


--=-adC0LW7skQ481jywmzaP
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le lun 17/11/2003 =E0 15:42, xavier a =E9crit :
> Hello,
>=20
> I saw in the 2.4.22 kernel source :=20
>=20
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c

> Is there any plan to be able to set thoses values throught /proc ?

It is already available in P-O-M :
http://www.netfilter.org/documentation/pomlist/pom-combined.html#tcp-window=
-tracking

BR,
--=20
Eric Leblond
NuFW, Now User Filtering Works (http://www.nufw.org)

--=-adC0LW7skQ481jywmzaP
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/uPeonxA7CdMWjzIRAr1bAJ0ReUkA0Emog2jeg4GsKbRbBa65VgCbB6q3
BCLl5DlHLM1MdnIP1BS+WD4=
=/Knv
-----END PGP SIGNATURE-----

--=-adC0LW7skQ481jywmzaP--


