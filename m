From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Stateless NAT
Date: Thu, 24 Feb 2005 17:56:07 +0100
Message-ID: <20050224165607.GA22228@zion.homelinux.com>
References: <1109243487.9286.4.camel@jasiiitosh.nexusmgmt.com>
	<Pine.LNX.4.58.0502241738490.5273@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0502241738490.5273@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, Netfilter users list <netfilter@lists.netfilter.org>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Jozsef, Hi John,

On Thu, Feb 24, 2005 at 05:43:12PM +0100, Jozsef Kadlecsik told us:
> You cannot do NAT without conntrack, because NAT in netfilter is built on
> the top of conntrack. By the NOTRACK target you disable conntrack for
> the selected packets thus disable NAT as well.
>=20
> Currently there is no way to define stateless NAT in netfilter. That is
> the bad news. The good one is that however one could write a stateless NAT
> target module, nothing prevents that.

in 2.4 kernels there was a possibility to do "dumb NAT", i.e. NAT
without connection tracking, which could be configured with the
ip utility if I remember correctly. Unfortunately, this dumb NAT
has been removed from the 2.6 kernel because it was broken (I think
due to the ipsec/xfrm changes, again IIRC :-) )


Sven

>=20
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>=20
>=20

--=20
Linux zion 2.6.11-rc3-mm2 #1 Mon Feb 21 00:29:04 CET 2005 i686 athlon i386 =
GNU/Linux
 17:51:51 up 3 days, 17:02,  1 user,  load average: 0.01, 0.01, 0.00

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFCHgcno4FAdB2PneQRAvLPAJwP8C4kP1YI9cgxYAZuc3Xit9x92gCaAv9a
oKfFCtJE19SR9i3zKeBrKZg=
=DlO9
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

