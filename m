From: Jeff Largent <jwlargent@vlsmaps.com>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 08:25:21 -0500
Message-ID: <1276781121.2021.16.camel@localhost>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-SJrWVAvTyY63ah/pATeI"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mamadou =?ISO-8859-1?Q?Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org


--=-SJrWVAvTyY63ah/pATeI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-06-17 at 08:26 +0000, Mamadou Tour=C3=A9 wrote:
> Hi, all i'd like to move rule to a position.
> ex: i've these rules :
> 1- iptable -A -p TCP --dport 80 -j ACCEPT
> 2- iptable -A -p TCP --dport 21 -j ACCEPT
> 3- iptable -A -p UDP --dport 53 -j ACCEPT
>=20
> after executing these command is there a mean to move rule at
> position 3 to position 1 ?
> So that the rule at 1 could go to 2 and 2 to 3.
>=20
> Someone has allready done that ? plz Help.
> regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

iptables-save > fw.rules
vi fw.rules and put them in the order you want them.
iptables-restore < fw.rules

--=-SJrWVAvTyY63ah/pATeI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwaIkEACgkQd02kARNrtZmnRwCg7dqJZFAE6vYXUgFjrpBvJV5h
bAcAoNwxIq3NQUjh1PYYxIe1xuSzGjSf
=ji20
-----END PGP SIGNATURE-----

--=-SJrWVAvTyY63ah/pATeI--

