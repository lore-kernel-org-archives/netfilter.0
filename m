From: Torsten Luettgert <t.luettgert@combox.de>
Subject: Re: Large number of repeated rules with only differing -s
	ipaddrs/cidrs
Date: Mon, 19 Apr 2004 14:12:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082376749.29831.11.camel@scaramouche>
References: <4083A3B2.7020808@linuxmail.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-s/IfZEZNwGw+mmgi218S"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4083A3B2.7020808@linuxmail.org>
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


--=-s/IfZEZNwGw+mmgi218S
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-04-19 at 12:02, Feizhou wrote:
> I don't know if such a question has been asked before and the archive=20
> didn't provide a search button...
>=20
> I have a whole bunch of ips/cidrs that I want to apply the rule to.
>=20
> Is there any way to insert one rule where the -s would be able to look=20
> up a table (btree/hash/cdb whatever) that contains those ips/cidrs=20
> instead of insert gazillion rules?
>=20

There's no built-in match for that. That's exactly why I wrote a match
for this (back when we were hit by code red).

I called it 'manyaddr', and it reads up to 15000 ip addresses (per rule)
from a file. You can then match source or destination address against
the addresses in the file.

If you aren't afraid of patching your kernel and iptables tree,
running patch-o-matic and recompiling everything, this could be
a good solution for you.

Please mail me if you want to give manyaddr a try.

Greetings,
Torsten L=FCttgert <t.luettgert at pressestimmen.de>

--=-s/IfZEZNwGw+mmgi218S
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAg8ItbLxp21AqFXsRAqyUAKC5o+K+nxWueEj/70MbM0tGKKNK9gCcDh+V
/VAt69xERq1uqCsdT95PzgA=
=sgee
-----END PGP SIGNATURE-----

--=-s/IfZEZNwGw+mmgi218S--


