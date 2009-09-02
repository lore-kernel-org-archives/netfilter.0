From: Simon Ruderich <simon@ruderich.org>
Subject: Some packets not matched with --uid-owner
Date: Wed, 2 Sep 2009 18:09:31 +0200
Message-ID: <20090902160931.GA9353@ruderich.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256; protocol="application/pgp-signature"; boundary="=_zucker.schokokeks.org-17527-1251907744-0001-2"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_zucker.schokokeks.org-17527-1251907744-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm using the owner module with the following setup for outgoing
packets.

-A OUTPUT -m conntrack --ctstate INVALID -j DROP
-A OUTPUT -o eth0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

-A OUTPUT -o eth0 -m owner --uid-owner some-user -j ACCEPT

-A OUTPUT -o eth0 -j LOG --log-uid
-A OUTPUT -j REJECT

The user some-user runs a TCP server and I thought with those
rules all packets by the user would be allowed and traffic from
other users rejected. But the LOG matches some packets like the
following (they are from the some-user but have no UID):

IN=3D OUT=3Deth0 SRC=3D... DST=3D... LEN=3D130 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D44900 DF PROTO=3DTCP SPT=3D... DPT=3D... WINDOW=3D6432 RES=3D0x0=
0 ACK URGP=3D0
IN=3D OUT=3Deth0 SRC=3D... DST=3D... LEN=3D1200 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D28700 DF PROTO=3DTCP SPT=3D... DPT=3D... WINDOW=3D6432 RES=3D0x0=
0 ACK PSH URGP=3D0

Is this expected and can I drop those packets safely or is
something wrong with my setup?

Thanks for your help,
Simon
--=20
+ privacy is necessary
+ using http://gnupg.org
+ public key id: 0x92FEFDB7E44C32F9

--=_zucker.schokokeks.org-17527-1251907744-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAEBCAAGBQJKnpi7AAoJEJL+/bfkTDL5rCMP/jv+phpnmOBnYfg3keYuM7vm
jTYaRvsaRp/s6WgAEZo23lBR21ShXiT9k3U0cCW+4+AWozSXfFNXM2EUN+6vMBFl
JKtFYO8H5JEoQtiVJsrmH4HsO2MoBOPZqm8YV/Q1U776Sp8MS7ZCX6ZKOqTu7Dye
TlpBR4r+EfbzagrFGJD2hA9YO60KLq3J08mjUvoCaj7pAqR25Lbrn6kAh1MHVoYD
yquOrkQ9jgNyGEqI6nnax3cwpxOchm2nzZJOaAkFaV8fMP48zCIP8XqW6dYOnbXz
k1+NVn/Vr82sGVspZi7XwOQkUPvLkNQo62Y6WPQa1EqKf9L/knJyfSRL5n5I6/Sz
Sbz1m4+ZSLBXgofpLpaPyoXNSjK/OpzPCJcifA3srhYg3z4HUINr56VtKUnQ0OVi
drgMXvW7kJjVthkUxqGqG1JLrruDDjwK5AsRHecUaR84x+gLUrvBpt/GeB1hD2tM
/tXgHuUlBygrSNJ3pruOcm3BMg8KEBumxBSBCS7x8mmpK7/lFClx74b0nGAXexe8
GSofauA1tT51NAKDXFuBwDmxV2KvkQqfyYoZoI/WifoIhW5OnlmA76aoLLgVkjhs
vSJLgfVsUU85dIDhnXYbha5NmzG2ChCaPzo3Vl3JkwMz73MR56TE6Tyw9b7E0A64
UWlqcpPrHBJ1Me4NqvhJ
=OJJS
-----END PGP SIGNATURE-----

--=_zucker.schokokeks.org-17527-1251907744-0001-2--
