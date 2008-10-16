From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: General question about chains
Date: Thu, 16 Oct 2008 08:19:25 -0500
Message-ID: <1224163165.3999.7.camel@grateful.d.umn.edu>
References: <001501c92f41$d380c0a0$7a8241e0$@net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Db9lu69lzoUEvOzjlnFc"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001501c92f41$d380c0a0$7a8241e0$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Joey <Joey@Web56.net>
Cc: netfilter@vger.kernel.org


--=-Db9lu69lzoUEvOzjlnFc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2008-10-15 at 23:46 -0400, Joey wrote:
> Hello All,
>=20
> While I have used iptables for a while, I have found that I needed to gai=
n
> more knowledge to push what I am doing with it to another level.
>=20
> I have read through a few things on-line and in the readme stuff, but hav=
e
> some confusion that I want to clear up.
>=20
> I am thinking that a chain is a group of rules, and I can create multiple
> chains to define rules for different things.
> Lets say FTP-RULES, SPAM-RULES etc.
>=20
> If I do this I can hopefully flush just one group or chain without effect=
ing
> the other rules is what I am thinking.
>=20
> When I execute a rule I do this:
> iptables -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-prefix SPAM-BLOCK=
-
> CIDR-ASIAN
> iptables -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DROP
>=20
>=20
> I wanted to change it to add it to a chain like so:
> iptables CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-prefix
> SPAM-BLOCK-CIDR-ASIAN
> iptables CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DROP
>=20
> iptables -N CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 -j LOG --log-pre=
fix
> SPAM-BLOCK-CIDR-ASIAN
> iptables -N CIDR-ASIAN -A INPUT -p tcp -s 118.242.0.0/16 --dport 25 -j DR=
OP

# create the chain
iptables -N CIDR-ASIAN

# hook the chain into another chain (PREROUTING, INPUT, FORWARD, etc)
iptables -A INPUT -j CIDR-ASIAN

# add rules to the new chain
iptables -A CIDR-ASIAN -p tcp -s 118.242.0.0/16 -j LOG --log-prefix
SPAM-BLOCK-CIDR-ASIAN

iptables -A CIDR-ASIAN -p tcp -s 118.242.0.0/16 --dport 25 -j DROP=20

# flush the chain
iptable -F CIDR-ASIAN


> This didn't work for me and I have tried several varients with no luck.
>=20
> So my first question is do I understand correcty how to utilize chains?
>=20
> Will I be able to load and unload chains rather than flush everything end
> reload everything? ( I have a lot of rules )

I don't quite understand your question.

You 'create' and 'delete' user-defined chains. You can, of course, flush
chains individually as well.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-Db9lu69lzoUEvOzjlnFc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkj3P1YACgkQU+eIf4TiLaJbZQCg6nhjU/Ps9WQI6R+HJ5nAHCgx
ms4AoPAgjkzXQRmrZKfoMWFA+sGU9h/I
=+Xo6
-----END PGP SIGNATURE-----

--=-Db9lu69lzoUEvOzjlnFc--

