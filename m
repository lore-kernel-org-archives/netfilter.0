From: Martin Tomasek <mtd@mk.cvut.cz>
Subject: Re: how to delete *some* netfilter rules?
Date: Fri, 5 Jul 2002 15:57:43 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705135743.GB4851@mt.mk.cvut.cz>
References: <20020614161800.GA6137@kostra.uh.cz> <02070513492203.14428@Lms>
Reply-To: mtd@mk.cvut.cz
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070513492203.14428@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Pavel Mores <pvl@uh.cz>, netfilter@lists.samba.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

using iptables without full path is insecure, I would modify this script
this way:

> Your bash script could look like this:
>=20
> #!/bin/bash
+IPT=3D/usr/sbin/iptables
>=20
-> ADD=3D-A
+ADD=3D"$IPT -A"
-> INS=3D-I
+INS=3D"$IPT -I"
>=20
> if [ -n "$1" ]; then
> 	if [  "$1" !=3D "delete" ]; then
> 		echo usage: $0 [delete]
> 		exit 1
> 	fi

these two too:
> 	ADD=3D-D
> 	INS=3D-D

> fi
>=20
> #examples:
-> iptables $ADD INPUT -i eth0 10.0.0.0/8 -j DROP
+$ADD INPUT -i eth0 10.0.0.0/8 -j DROP
-> iptables $INS OUTPUT -i eth0 192.168.0.0/16 -j DROP
+$INS OUTPUT -i eth0 192.168.0.0/16 -j DROP
>=20

there is other way of rules deletion:

iptables -D chain num

where num is rule number in chain. in some cases it is better to
use this command.

--=20
Martin Tomasek, mtd@email.cz
BOFH excuse #27:
radiosity depletion

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9JaXXzWKqGie3rqoRAs0+AJ44dPal85oIdqlPQuIlXHXpX4FVbgCePexg
QpVQ1Y5ZfzgADDf75XiSajI=
=84xd
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--

