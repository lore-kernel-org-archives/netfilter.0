From: Martijn van Oosterhout <kleptog@svana.org>
Subject: Re: Different routes for different src addresses
Date: Wed, 7 Jul 2004 22:39:39 +1000
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20040707123930.GD17226@svana.org>
References: <20040707120502.GA23120@nihil>
Reply-To: Martijn van Oosterhout <kleptog@svana.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040707120502.GA23120@nihil>
List-Id: <netfilter.vger.kernel.org>
To: Alpt <alpt@freaknet.org>, netfilter@lists.netfilter.org, linux-net@vger.kernel.org


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2004 at 02:05:02PM +0200, Alpt wrote:
> Hi all,
> is it possible to create a route for a single src address?
> For example these are some routes I'd like to use:=20
>=20
> 1) "All the pkts coming from hostA with dst=3DhostX are routed to eth1".
> 2) "All the pkts coming from hostB with dst=3DhostT are routed to eth0"
> /*Normal routes start here*/
> 3) "All the pkts (that are not pkts of type 1) and 2)) with dst=3DhostX
> are routed to eth3"
> 4) "All the pkts (that are not pkts of type 1) and 2)) with dst=3DhostU
> are routed to eth2"
> 5) And so on...

Lookup ip rules, you can do something like:

ip rule add from hostA table tableA
ip rule add from hostB table tableB

ip route add hostX dev eth1 table tableA prio 500
ip route add hostY dev eth0 table tableB prio 501

etc...

Hope this helps,
--=20
Martijn van Oosterhout   <kleptog@svana.org>   http://svana.org/kleptog/
> Patent. n. Genius is 5% inspiration and 95% perspiration. A patent is a
> tool for doing 5% of the work and then sitting around waiting for someone
> else to do the other 95% so you can sue them.

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQFA6+8CY5Twig3Ge+YRAqP5AJ4gq6OQ1BBkvJ09Ia0YaYhjpOhq7QCeOHnm
e0iVAwB5WFQNs/8+6YiMWOw=
=OpMH
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
