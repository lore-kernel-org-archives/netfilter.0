From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Allow client only 1 connect per 20 seconds
Date: Tue, 25 Nov 2008 14:21:32 -0600
Message-ID: <1227644492.11373.562.camel@grateful.d.umn.edu>
References: <gghgq9$33t$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qMl26rXTolOGQM4KQ50O"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gghgq9$33t$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org


--=-qMl26rXTolOGQM4KQ50O
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-11-25 at 19:38 +0100, Adem wrote:
> How would you code this rule in iptables:
>=20
> If anybody tries to do more than 1 connection to port 8191
> within 20 seconds, regardless of the protocol, then DROP=20
> it and ignore any further connect attempts on that port
> from that source for 20 seconds.

NOTE: this is completely untested:

iptables -A INPUT -p tcp --dport 8191 --match state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 8191 --match state --state NEW --match
recent --name THROTTLE --set
iptables -A INPUT -p tcp --dport 8191 --match state --state NEW --match
recent --name THROTTLE --update --seconds 20 --hitcount 2 --rttl -j DROP

Same rules for '-p udp'.

Cheers,

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-qMl26rXTolOGQM4KQ50O
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkksXkgACgkQU+eIf4TiLaKOJgCgm7VDECmHke9aMzdhlrMyeEZO
wR8AoIca/7GNr4v0TM6NAaXUAI5eOAhp
=outq
-----END PGP SIGNATURE-----

--=-qMl26rXTolOGQM4KQ50O--

