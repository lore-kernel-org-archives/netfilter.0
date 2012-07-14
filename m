From: Eric Leblond <eric@regit.org>
Subject: Re: ulogd2 and multiple outputs
Date: Sat, 14 Jul 2012 18:39:43 +0200
Message-ID: <1342283983.11019.18.camel@tiger.regit.org>
References: <mj+md-20120704.164008.2210.albireo@ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-K1hOQbYcj9aigUIs00Fm"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mj+md-20120704.164008.2210.albireo@ucw.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Martin Mares <mj@ucw.cz>
Cc: netfilter@vger.kernel.org


--=-K1hOQbYcj9aigUIs00Fm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

That's a late reply but it is one anyway.=20

Le mercredi 04 juillet 2012 =C3=A0 18:44 +0200, Martin Mares a =C3=A9crit :
> Hello, world!\n
>=20
> I am configuring ulogd2 on my router and I would like to log all packets
> rejected by the firewall to both a textual log and a PCAP file.
>=20
> However, ulogd2 refuses to put multiple output modules in a single stack,
> so I have to make iptables send packets to two different NFLOG groups
> handled by separate ulogd stacks.=09


You can use the same input in two different stacks:

stack=3Dlog1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,e=
mu1:LOGEMU
stack=3Dlog1:NFLOG,base1:BASE,pcap1:PCAP

You can even do something like:

stack=3Dlog1:NFLOG,base1:BASE,pcap1:PCAP,ifi1:IFINDEX,ip2str1:IP2STR,print1=
:PRINTPKT,emu1:LOGEMU

BR,
--=20
Eric Leblond=20
Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/

--=-K1hOQbYcj9aigUIs00Fm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlABoM8ACgkQnxA7CdMWjzKUjACcCkTeod628xqEnyeXnem2j3aH
m5EAn0xvif8K9pnH/lfcOKUVEZBHgp5c
=reyy
-----END PGP SIGNATURE-----

--=-K1hOQbYcj9aigUIs00Fm--

