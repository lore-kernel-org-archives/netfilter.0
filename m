From: Alexander Samad <alex@samad.com.au>
Subject: Re: newbie question : ip_conntrack_ftp
Date: Wed, 24 Mar 2004 14:11:50 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040324031150.GN3387@samad.com.au>
References: <Pine.GSO.4.50.0403231611290.14538-100000@jagor.srce.hr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4oQnj4jcM03NhqPN"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.50.0403231611290.14538-100000@jagor.srce.hr>
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


--4oQnj4jcM03NhqPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2004 at 04:13:52PM +0100, Mihael Kukec wrote:
>=20
> Hello!
>=20
> Excuse me for my poor English...
>=20
> I'm using latest stable Debian, with 2.4.18 kernel. Unfortunately it does
> not have ip_conntrack_ftp module included and I need it. Can someone give
> me short instructions on that to do? Where to get code, if there are some
> special instructions for compiling etc..

can you run

COLUMNS=3D200 dpkg -l 'kernel-im*' | grep ii

this will show with kernel image you have install=20

then run=20
dpkg -L '<insert the package name from above>' | grep -i conn

this should show you all the conntrack modules in the packages.

Some else stated in another thread that the BF2.4 package doesn't come
with all the conn track modules=20

A
>=20
>=20
> TIA
>=20
>=20
>=20
>=20

--4oQnj4jcM03NhqPN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAYPx2kZz88chpJ2MRAuj3AKChIoztGI5XgJ95sRKuDN+Im+zU5wCgjILo
Yll6jh2jJbRUwKMJAeIOMHg=
=G1uY
-----END PGP SIGNATURE-----

--4oQnj4jcM03NhqPN--

