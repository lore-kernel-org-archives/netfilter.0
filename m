From: Andre Raabe <andre.raabe@gmx.de>
Subject: Re: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 21:15:36 +0200
Message-ID: <20050622191536.GA3563@modular>
References: <002601c5774e$499f2c90$5100a8c0@14bis>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002601c5774e$499f2c90$5100a8c0@14bis>
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


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2005 at 02:17:37PM -0300, Bruno Negr=E3o wrote:
>=20
> I know it's possible to implement bandwidth control with linux, but what=
=20
> about the second feature? Does someone know if it's possible to implement=
=20
> the second feature using linux?
>=20
Maybe take a look at the ClusterIP feature available in newer kernel
versions. Form the iptable man page:
 CLUSTERIP
 This module allows you to configure a simple cluster of nodes that
 share a certain IP and MAC address without an explicit load
 balancer in front of them. Connections are statically distributed
 between the nodes in this cluster.
=20
Another possible solution would be IPVS [1], which implements=20
transport-layer load balancing.

[1] http://www.linuxvirtualserver.org/software/ipvs.html

Best regards,

--=20
Andre Raabe <raabe@tuxknowledge.org>

GnuPG: 0x5FF2A39C | ECBD D562 72C9 DD1B B741 52C0 AFE1 8DA7 5FF2 A39C
http://www.tuxknowledge.org | bash@jabber.ccc.de | encryption welcome

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCubjYr+GNp1/yo5wRAtWbAJ42jKrONe9ylzcQS2/ILzjdT3H6egCfSlDb
+xpwHtDny/XQqYhcyT4IFH0=
=3UDL
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--

