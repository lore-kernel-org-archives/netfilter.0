From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: libipq installation
Date: Wed, 5 May 2004 16:34:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040505143441.GA25003@zion.homelinux.com>
References: <OFB831D70A.34529ED3-ON65256E8B.001C8EDD@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFB831D70A.34529ED3-ON65256E8B.001C8EDD@hss.hns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2004 at 12:13:14PM +0530, aksingh@hss.hns.com told us:
>=20
> hi,
>=20
>  How do I install libipq on my redhat linux box (2.4.2-2) ? Iahve
> downloaded iptables source code -- iptables-1.2.9.tar.bz2

You need to run a 'make install-devel' after compiling iptables
so that the libipq libs, headers and manpages are installed.

But isn't kernel 2.4.2-2 a little bit outdated? I think this is
the installation kernel from redhat 7.1. You probably want to
install the last errata kernel from redhat first, or even=20
a vanilla kernel from kernel.org as there's no more support for
redhat 7.1 from redhat and so also no new erratas...


HTH

Sven

>=20
> thanks,
> Amit
>=20

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:31:46  up 14 days, 21:21,  1 user,  load average: 0.02, 0.01, 0.00

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAmPuBo4FAdB2PneQRAm51AJ4yFKCchZIAKo1gQxC70KeBMY3rXgCfa3Q/
Oey0bcRIXHwoXx7AmaR7kZQ=
=yuyx
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

