From: Thomas Jacob <jacob@internet24.de>
Subject: Re: netfilter optimization.
Date: Sun, 26 Aug 2007 12:58:55 +0200
Message-ID: <20070826105855.GB15249@internet24.de>
References: <20070825232124.GA26316@internet24.de>
	<57F9959B46E0FA4D8BA88AEDFBE5829024F4BC@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829024F4BC@pxtbenexd01.pxt.primeexalia.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> net.netfilter.nf_conntrack_max=3D1048576
> net.netfilter.nf_conntrack_buckets=3D1048576
>=20
> But it only does for nf_conntrack_max.  I did overwrite it by going to
> /sys/modules/nf_conntrack/parameters/hashsize and it did take it on the
> second try.  The first time it complained about file descriptors.  The
> second time it seemed to set it, which I verified by looking at
> /proc/sys/net/netfilter/nf_conntrack_buckets.
>=20
> Is there a way to set this on startup? =20

Oh yes sorry,  you can't set it in sysctl.conf then, since the
module must probably already be loaded if you can use that. Try
the module load parameters instead (options ip_conntrack hashsize=3DXXXX
in /etc/modprobe.d/somefile worked in older kernels).

I am actually just patching the numbers in to the kernel version myself,
since I don't want to have a module-based kernel on my firewall box.

    Thomas

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFG0VzvgF9cFv867HwRAlrYAJ9jBYdXMkav/iwah83hsSlc7pMD4ACg2nCN
7gzHPcPovt53c0w+69oImM4=
=7KVM
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--

