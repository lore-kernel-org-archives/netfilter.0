From: Thomas Jacob <jacob@internet24.de>
Subject: Re: netfilter optimization.
Date: Sun, 26 Aug 2007 00:58:37 +0200
Message-ID: <20070825225837.GA26251@internet24.de>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com>
	<46D06DA0.1010706@solutti.com.br>
	<57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com>
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


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> So, this leads us to solving the connection pooling issue.  We have two 1=
=2E8ghz machine with 512MB, one is the active firewall, the other one would=
 be the failover.  Each one has 4 nics, two onboard 100MB and a dual 1GB.  =
Here is the config:
>=20
> eth0 -> INET (100MB)
> eth1 -> Private, heartbeat for linux-HA (100MB) -- Future implementation
> eth2 -> DMZ (1GB)
> eth3 -> Internal (1GB)

Unless you have a lot of traffic between the dmz and the internal network, =
and assuming
100MB means 100Mbps, and that you have some decent NICs (maybe with NAPI/in=
terrupt
throttling, Intel's work nicely) you should probably be fine. We're running=
 something similar=20
with about 400mbps peak traffic and a P4 3Ghz and it's maybe at 30-40% capa=
city in peak hours.

Good NICs, good buses (PCI-Express), high memory transfer rates & large
cache sizes all make a difference though.

Harald Welte gave a talk once about selecting hardware for netfilter firewa=
lls,
the notes are available online, maybe it's helpful to you:

http://www.heinlein-support.de/upload/slac/network_performance.pdf

> Anyway, this is one of the reasons we are rebuilding the firewalls.  The =
other reason being a spinlock but in that kernel version.  So, we wanted to=
 go with something fresher.

In kernel 2.4 there are some "nice" effects under various load levels and a=
ttacks, 2.6
kernels is much more robust there. We've added a packet rate limiter
(using hash limit) for good measure and since then never had any troubles
again....

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFG0LQdgF9cFv867HwRAgPeAKDAdyoZC67AEV5tqteXiW9rie5htgCggU6L
3OVG8dCoLuWVZpNYvVKW+0s=
=g28p
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--

