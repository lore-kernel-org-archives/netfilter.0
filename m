From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: Iptables issue with EPSV FTP
Date: Mon, 03 Nov 2003 21:23:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067912630.12041.38.camel@tarkus>
References: <659503E2-0E4F-11D8-9512-0050E425B26F@yourhost.com>
 <20031103235737.0bb8b430.netfilter@schuetter.org>
 <F64DE249-0E52-11D8-9512-0050E425B26F@yourhost.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-GDnCkWkLVvTtvUeyKE2x";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <F64DE249-0E52-11D8-9512-0050E425B26F@yourhost.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Matt Kotich <matt@yourhost.com>
Cc: =?ISO-8859-1?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>, netfilter@lists.netfilter.org


--=-GDnCkWkLVvTtvUeyKE2x
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

su -
modprobe ip_conntrack_ftp
lsmod  grep fto

Ted
On Mon, 2003-11-03 at 18:10, Matt Kotich wrote:
> [root@server root]# modprobe ip_conntrack_ftp
> [root@server root]#
>=20
> Got nothin'
>=20
> What should I do now?
>=20
> PS: This is IPTables 1.2.8-8.72.3 on Linux 2.4.20-20.7smp

--=-GDnCkWkLVvTtvUeyKE2x
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/pw22iZhiYWDacWIRAjZRAKCRlxDDV+334tjK6df9RCZ2yQhzYQCgtr2D
pwhvYMzWN0S3M8pg88gmC2w=
=Qi1m
-----END PGP SIGNATURE-----

--=-GDnCkWkLVvTtvUeyKE2x--


