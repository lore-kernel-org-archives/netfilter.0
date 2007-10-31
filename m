From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Netfilter Performance when using MAC filter
Date: Wed, 31 Oct 2007 13:26:51 -0500
Message-ID: <1193855211.18366.73.camel@grateful.d.umn.edu>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-S+yphpg3N70QYvayhrW4"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Babu Skeitson <babuskeitson@gmail.com>
Cc: netfilter@vger.kernel.org


--=-S+yphpg3N70QYvayhrW4
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Wed, 2007-10-31 at 14:23 -0200, Babu Skeitson wrote:
> Hello everyone.
> I'm thinking about implementing iptables MAC Address filtering (-m mac
> --mac-source xx:xx....) in my network.
> *BUT* I have a big network, with ~ 4000 internal hosts/IPs that will
> be filtered via MAC, and I'm not sure about the performance of this
> filtering.

Are the 4000 hosts on the same network/vlan as the box running iptables?

If so, you can do MAC filtering (performance shouldn't matter as the MAC
address is in the link header), if not MAC filtering won't buy you much,
the layer2 address will always be the same.

This is essentially the difference between ARP and IP, or switching and
routing if you prefer.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-S+yphpg3N70QYvayhrW4
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHKMjrU+eIf4TiLaIRAgTIAJ4nNBtBf6rBDkB744y4KH25aM8DoACglb21
/+DSU1m6XOfE2qA3J9muj3U=
=2oyB
-----END PGP SIGNATURE-----

--=-S+yphpg3N70QYvayhrW4--

