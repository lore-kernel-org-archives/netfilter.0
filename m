From: Eric Leblond <eric@inl.fr>
Subject: Re: how to match connection tracker's flows?
Date: Wed, 03 Nov 2004 20:07:48 +0100
Message-ID: <1099508868.24863.8.camel@porky>
References: <20041103181718.GA16850@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-W/PLQk1BkpTIyj9tX20i"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041103181718.GA16850@oasis.frogfoot.net>
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


--=-W/PLQk1BkpTIyj9tX20i
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-11-03 at 20:17 +0200, Abraham van der Merwe wrote:
> Hi!
>=20
> If I add
>=20
> # rules to track ftp
> iptables -t mangle -A POSTROUTING -p tcp -j CONNMARK --restore-mark
> iptables -t mangle -A POSTROUTING -p tcp -m mark ! --mark 0 -j RETURN

If packet are marked they return so leave mangle, so if CONNMARK works
leave mangle.

> # a rule to see how much ftp traffic is matched
> iptables -t mangle -A POSTROUTING -m mark --mark 2

This line is never reached if CONNMARK works.

BR,
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-W/PLQk1BkpTIyj9tX20i
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBiSyDnxA7CdMWjzIRAifNAJ46roQzgULuq50iaA7V4O8u0G4emgCfbkMt
KX/4d+sl3IZu8kxciWaEN8w=
=GWzX
-----END PGP SIGNATURE-----

--=-W/PLQk1BkpTIyj9tX20i--


