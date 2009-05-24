From: Linus =?iso-8859-1?Q?L=FCssing?= <linus.luessing@web.de>
Subject: errors with ebtables 2.0.8-2 in dmesg (tried OpenWRT)
Date: Mon, 25 May 2009 00:06:52 +0200
Message-ID: <20090524220651.GA5730@Linus-Debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm trying to do some DHCP/ARP filtering here on my little router
running OpenWRT svn-rev. 15336. When I'm trying to insert a rule
like this:

"ebtables -A INPUT --in-interface bat0 --protocol IPv4
--ip-protocol udp --ip-source-port 68 -j DROP"

then I get the following reply:

"The kernel doesn't support a certain ebtables extension, consider
recompiling your kernel or insmod the extension."

And in dmesg: "eb_tables: ip match: invalid size 32 !=3D 28"

A rule like "ebtables -I INPUT --in-interface bat0 --protocol ARP
-j DROP" results in the dmesg output "eb_tables: standard target:
invalid size 8 !=3D 4".

The error posted on this mailing-list seems to be similar:
http://osdir.com/ml/linux.network.bridge.ebtables.devel/2006-12/msg00001.ht=
ml

Is this a bug in ebtables in general (or related to my OpenWRT
firmware)? Is ebtables an active project at the moment anyway?
Seems like the last bugfixes have been quite a long time ago.=20
But as far as I know, I can't use iptables with physdev to filter
ARP for example.

Cheers, Linus

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBAgAGBQJKGcT7AAoJEBKw7u43QNpfiQcQALyB/vOJlShq5N75PUgFgZry
fUrPoNqWhqLugrIyS8fpC/d3S391CweRA5VBE/HqILSpt2KAdoBvBwaZpo8rGYUh
B3Sxq+L7U1N7g/XVzE490H2ukxf/jSBKK7/dySD+tmSy9PNlnbrgxD969W15Fbbk
cQbw2ZlXqQX/u6/8RYx4s9vTN+AyloUlfhBKYAYDzCdW2aWX30MA33pLQbfFUu3J
x0eNl8rMQKMDU6sxdSR8siBoDvNJowrDLXt5UpBMHaqHZ2YuoAYuBKWNR9iqz9sC
ApZHHkQ7ODrec/IljhlSDhK2FPXF7HamQ6gWL5SEC3qdI5AhgWWQ45mxEckBttdx
uK5gDO4BcyD0otkBhnbhZ3ZjCQPpFu+KtqdB1zHzdLz97b7Zz2th9qSzJf4JAUd8
LnQ5d8tWNqFvrdaVpDCT/QjFZag44CjJwTXnfrG6ji3NShfBu1uI5U6Nj3Fr1Sex
fffKyua7iTgr3IFy8zsJG+5Ybt5TXrxjxBxdZzIysYiQYacMiCQ6xDXOiYcV7moR
tba6F17/GWDZ+Kanyni7l4qzfeva4vpx4AnlGhu84DWeozTQLyLrF7SlqGKVhNEJ
8Q9IvvRULyfg1mT1nwq+RDxWAPx+hISdvWQb1HKlSorr4+6YdYwufO9MiyOqYQ2s
ylXfwrMJ9wv00UQGhtYe
=P87M
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
