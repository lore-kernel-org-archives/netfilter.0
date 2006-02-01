From: Eric Leblond <eric@inl.fr>
Subject: Re: How make iptables script with NAT handle "active FTP"?
Date: Wed, 01 Feb 2006 10:43:37 +0100
Message-ID: <1138787017.6290.2.camel@localhost.localdomain>
References: <1138390474.4844.79.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-xVv4GGyLA6aFWyxwuUjK"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1138390474.4844.79.camel@localhost.localdomain>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: Ray Schumacher <rays@blue-cove.com>, netfilter@lists.netfilter.org


--=-xVv4GGyLA6aFWyxwuUjK
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le vendredi 27 janvier 2006 =E0 11:34 -0800, Christian Seberino a =E9crit :
> Active FTP seems to need to open new sockets.
>=20
> This creates problems for NAT'ing firewalls.
>=20
> What is easiest way to open the right ports
>=20
> and do NAT'ing back to clients on 192.168.x.y IP addresses?

Netfilter has a module called ip_conntrack_ftp which is used to take new
socket opening into account for the ftp protocol. To use that feature
you need t load the module and use a rule which accept packet RELATED to
another connection :
iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-xVv4GGyLA6aFWyxwuUjK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBD4ILInxA7CdMWjzIRAv1fAKCP4dzVO4A2NVhlKI4QdFRC6wKzpwCggON2
7WNtTi23KdXS4/TGMMkMtXw=
=ubS8
-----END PGP SIGNATURE-----

--=-xVv4GGyLA6aFWyxwuUjK--


