From: Thomas Jacob <jacob@internet24.de>
Subject: Re: netfilter optimization.
Date: Sun, 26 Aug 2007 01:21:24 +0200
Message-ID: <20070825232124.GA26316@internet24.de>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com>
	<46D06DA0.1010706@solutti.com.br>
	<57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com>
	<20070825225837.GA26251@internet24.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070825225837.GA26251@internet24.de>
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


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ehm, you're original question was about
setting conntrack values :-)

Originally you couldn't change the hash bucket=20
number after the ipt_conntrack module had been loaded,
you needed to do that at load time (for
instance through /etc/sysctl.cnf), but
I gather that current netfilter versions
allow changing the number of hash buckets
at runtime through:

/sys/module/ip_conntrack/parameters/hashsize

Setting #hash buckets=3Dconntrack max should be
fine that's what we do as well.

Maybe you want to carefully reduce some of
the /proc/sys/net/ipv4/netfilter/ip_conntrack_*timeout* parameters
to reduce the number of entries in the connection
tracking hash.



--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFG0Ll0gF9cFv867HwRArFSAJwPLF4v4JtXm1n7QqX7mzKhQidMzQCgmGSy
UPplfkSA3ly3TdKkAGpRQ2E=
=6onI
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

