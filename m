From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: libipt_drop.so: cannot open shared object file
Date: Tue, 29 Jun 2004 09:01:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040629070152.GA2037@zion.homelinux.com>
References: <40E10006.3060805@tigerteam.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40E10006.3060805@tigerteam.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Andy Walden <andy@tigerteam.net>
Cc: netfilter@lists.netfilter.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Andy,

On Tue, Jun 29, 2004 at 01:37:10AM -0400, Andy Walden told us:
>=20
> # ./iptables -I INPUT -s 217.238.177.2 -j drop
> iptables v1.2.11: Couldn't load target=20
> `drop':/usr/local/lib/iptables/libipt_drop.so: cannot open shared object=
=20
> file: No such file or directory

try DROP instead of drop, then it should work.


Sven

>=20
> I just started getting this one day. Searches show only three hits for=20
> that file and there is no sign of it in my distrobution or the source=20
> package. Any ideas as to what I'm seeing here? Thanks for the time.
>=20
> --=20
> Best Regards,
> Andy Walden
>=20

--=20
Linux zion 2.6.7 #1 Thu Jun 17 10:44:26 CEST 2004 i686 athlon i386 GNU/Linux
 09:00:59  up 3 days, 13:51,  4 users,  load average: 2.17, 2.10, 2.02

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA4RPgo4FAdB2PneQRArp3AKCA+XUxkxCWdrw8po0GAxfGGYE+0wCfZbvE
url/F+l6306p5kB9NtgxmCM=
=i9Ac
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

