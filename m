From: Harald Welte <laforge@gnumonks.org>
Subject: Re: patching iptables ttl
Date: Fri, 26 Dec 2003 18:25:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031226172545.GE9391@obroa-skai.de.gnumonks.org>
References: <Pine.GSO.4.58.0312261114160.8600@peppar.cs.umu.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.58.0312261114160.8600@peppar.cs.umu.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Johan Cimen <c99jcn@cs.umu.se>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2003 at 11:27:03AM +0100, Johan Cimen wrote:
> Hi!
>=20
> Question about iptables and the ttl target!
>=20
> When I looked into my Debian-2.4.20 config file I couldn't find the
> CONFIG_IP_NF_TARGET_TTL , when I read the Patch-O-Matic list I saw that
> there is a patch for iptables-ttl ipv4. I also found a kernel-patch-ttl
> 2.4.18 at debians page, but this has a bug reported.
>=20
> My question is how do I patch ttl to my Debian-2.4.20 kernel using patch
> files at:
> http://www.netfilter.org/documentation/pomlist/pom-base.html#TTL
> Is there any bugs reported using these files with Debian-2.4.20 ?
>=20
> Shall I use all files to patch ?
> Where in my kernel shall I patch required files?
> How do I patch those files?
> mystation:/usr/src/linux/ patch -p1 < what file to patch ???

please download patch-o-matic from www.netfilter.org/downloads.html and
read the README instructions.

you cannot just use 'patch', sorry.

> -Johan-

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/7G8YXaXGVTD0i/8RAjEjAJ9xlyioq/SfQxYuzN636pfBT1kNygCglFyV
txgEbqMj7Jwjh2qFtzNh9q8=
=0EdG
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--

