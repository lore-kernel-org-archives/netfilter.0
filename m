From: Eric Leblond <eric@inl.fr>
Subject: Re: Explicit source port mapping
Date: Wed, 01 Nov 2006 16:48:12 +0100
Message-ID: <1162396092.4395.14.camel@localhost>
References: <200611011624.21822.andreas.micklei@ivistar.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-U0gnos7fXQXG+ZK0xmD8"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611011624.21822.andreas.micklei@ivistar.de>
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
To: Andreas Micklei <andreas.micklei@ivistar.de>
Cc: netfilter@lists.netfilter.org


--=-U0gnos7fXQXG+ZK0xmD8
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

I've never heard about such a feature.

Just a simple question :
	Why do you want to do this ?

BR,

Le mercredi 01 novembre 2006 =E0 16:24 +0100, Andreas Micklei a =E9crit :
> Greetings,
>=20
> I have an unusual (maybe?) request. I have several private IPs (192.168.x=
.x)=20
> behind a Linux gateway. All are NATed to the Internet. Now I want to=20
> explicitely map each private IP to a fixed source port range on the WAN=20
> interface of the gateway.
>=20
> Example:
>=20
> Connections from 192.168.42.1 are mapped to source ports 1024 - 1279
> Connections from 192.168.42.2 are mapped to source ports 1280 - 1343
> Connections from 192.168.42.3 are mapped to source ports 1344 - 1408
> ...
>=20
> Quetions 1: Can netfilter do this for me?
> Question 2: If not, would it be easy to implement, and can someone give a=
=20
> suggestion where I should start? - Or even better: Has someone already=20
> implemented this?
>=20
> Sorry if my question sounds stupid. In the HOWTOs I could only find impli=
cit=20
> source port mapping. Also I did not find a search interface for the=20
> mailinglist. So if this question is already answered, pointers are=20
> appreciated.
>=20
> regards,
> Andreas Micklei
>=20
>=20
--=20
Eric Leblond <eric@inl.fr>
INL

--=-U0gnos7fXQXG+ZK0xmD8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFSMG8nxA7CdMWjzIRAkqJAJ47nGMpnLj+OH/EamvCcfo4XI8G1ACgkmle
t8++g7bEVYt5juL5ipHDl2w=
=vbDm
-----END PGP SIGNATURE-----

--=-U0gnos7fXQXG+ZK0xmD8--


