From: Eric Leblond <eric@inl.fr>
Subject: Re: Fwd: Re: IP Tables slows network response times
Date: Mon, 15 Aug 2005 13:59:17 +0200
Message-ID: <1124107157.4956.15.camel@porky>
References: <200508152332.15400.michael@networkstuff.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-aGdF4cum7vYLbN2owIQ8"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508152332.15400.michael@networkstuff.co.nz>
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
To: michael@networkstuff.co.nz
Cc: netfilter@lists.netfilter.org


--=-aGdF4cum7vYLbN2owIQ8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-08-15 at 23:32 +1200, Michael Hallager wrote:
> AS FOLLOWS: (Opps. my mistake!)
>=20
> -A INPUT -i lo -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m tcp --dport 22 -j ACCEPT
> -A INPUT -d 202.150.101.225 -p tcp -m layer7 --l7proto smtp -m tcp --dpor=
t 25=20
> -j ACCEPT

l7filtering is completly useless here. In fact l7 is able to detect a
protocol after a few packets so your=20
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
take precedence over l7 rules.
Furthermore (I may be mistaking) match is often done on reply thus
filtering on OUTPUT is necessary.
One other point is : why do you need to check the protocol running on
your own computer ?

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-aGdF4cum7vYLbN2owIQ8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDAIOVnxA7CdMWjzIRAp9cAKCOesu7OUs5sUbkAGtA3tuJzZ88pACfcw+j
lBhUgIOQGig+KTjkGzq7rB0=
=0lzG
-----END PGP SIGNATURE-----

--=-aGdF4cum7vYLbN2owIQ8--


