From: Eric Leblond <eric@regit.org>
Subject: Re: Problem for Bittorrent Application behind Linux Firewall
Date: Tue, 23 Sep 2003 11:46:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064310359.17646.17.camel@porky>
References: <049201c381b3$672939f0$5a01a8c0@wireless.cheung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-A2U76O2fPZ528VZ8Hc/K"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <049201c381b3$672939f0$5a01a8c0@wireless.cheung.com>
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


--=-A2U76O2fPZ528VZ8Hc/K
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le mar 23/09/2003 =C3=A0 11:16, Tom a =C3=A9crit :
> Hello Everyone:
> =20
> #! /bin/sh
> iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 6881:6889 -j DNAT
> --to 192.168.1.90:6881-6889
> iptables -A FORWARD -p tcp -s 192.168.1.90 --dport 6881:6889 -j ACCEPT

If someone comes from external network, i.e Internet, you have to
authorize packet to your machine :
-d 192.168.1.90 and not -s !

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-A2U76O2fPZ528VZ8Hc/K
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/cBZXnxA7CdMWjzIRAn1oAJ90i6m8GzBUOW5O5jtz//Bkt0LFCACfUa+k
NbYUSaBFktGJdJVHUxs7CUc=
=+6RJ
-----END PGP SIGNATURE-----

--=-A2U76O2fPZ528VZ8Hc/K--

