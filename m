From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: logging -- a newbie question
Date: Fri, 7 May 2004 16:33:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507143355.GA28500@zion.homelinux.com>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de> <200405071445.38711.Antony@Soft-Solutions.co.uk> <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Pawel Mueller <rusatlan@bofh.rus.uni-stuttgart.de>
Cc: netfilter@lists.netfilter.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2004 at 04:04:37PM +0200, Pawel Mueller told us:
> Hi,
>=20
> I didn't meant the LOG target. There must be a file where all
> connections are listed. I know, because I saw it once. But it was a half
> year ago, so I can't remember. I know I read it in a howto. It was one
> that described, how you can debuge a firewall and it mentioned a file,
> where you can see the hole ACK, SYN and ESTABLISHED or DROPED stuff for
> each package (I think) that passes the firewall.
>=20
> Idea?

You probably mean /proc/net/ip_conntrack where all tracked=20
connections are listed. But be aware that this file will exist only
if connection tracking is in the kernel, e.g. statically compiled in=20
or the ip_conntrack module is loaded.

HTH

Sven

>=20
> thx
> Pawel
>=20
> PS: sorry, my english is terrible :-(

--=20
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386 GNU/=
Linux
 16:32:17  up 1 day, 16:27,  1 user,  load average: 0.06, 0.04, 0.01

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAm55To4FAdB2PneQRAs+kAJ46nKQ3wS8IcpK+CoyKLB1qs+ixKQCfdFkh
ml6iIdu4xgKXihkUY7qqzHc=
=TsyQ
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

