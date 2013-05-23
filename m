From: Christian Hesse <list@eworm.de>
Subject: IPv6 connection tracking mDNS
Date: Thu, 23 May 2013 12:58:52 +0200
Message-ID: <20130523125852.591af01c@leda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/dDaXnm.aMQ_1V5zGZDR=/iK"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/dDaXnm.aMQ_1V5zGZDR=/iK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello everybody,

I have problems with my IPv6 firewall concerning connection tracking and
mDNS. This is part of the rules:

-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m conntrack --ctstate INVALID -j DROP
-A INPUT -s fe80::/64 -d ff02::fb -p udp -j LOG --log-prefix "DEBUG1: "
-A INPUT -s fe80::/64 -d ff02::fb -p udp --dport 5353 -j ACCEPT
[...]
-A INPUT -j LOG --log-prefix "DEBUG2: "
-A INPUT -j REJECT

DEBUG1: IN=3Den OUT=3D MAC=3D SRC=3Dfe80:0000:0000:0000:ea03:9aff:feac:8631
DST=3Dff02:0000:0000:0000:0000:0000:0000:00fb LEN=3D661 TC=3D0 HOPLIMIT=3D2=
55
FLOWLBL=3D0 PROTO=3DUDP SPT=3D5353 DPT=3D5353 LEN=3D621
DEBUG1: IN=3Den OUT=3D MAC=3D SRC=3Dfe80:0000:0000:0000:ea03:9aff:feac:8631
DST=3Dff02:0000:0000:0000:0000:0000:0000:00fb LEN=3D1496 TC=3D0 HOPLIMIT=3D=
255
FLOWLBL=3D0 FRAG:0 INCOMPLETE ID:042d5795 PROTO=3DUDP SPT=3D5353 DPT=3D5353=
 LEN=3D7378
DEBUG1: IN=3Den OUT=3D MAC=3D SRC=3Dfe80:0000:0000:0000:ea03:9aff:feac:8631
DST=3Dff02:0000:0000:0000:0000:0000:0000:00fb LEN=3D1496 TC=3D0 HOPLIMIT=3D=
255
FLOWLBL=3D0 FRAG:1448 INCOMPLETE ID:042d5795 PROTO=3DUDP
DEBUG2: IN=3Den OUT=3D MAC=3D SRC=3Dfe80:0000:0000:0000:ea03:9aff:feac:8631
DST=3Dff02:0000:0000:0000:0000:0000:0000:00fb LEN=3D1496 TC=3D0 HOPLIMIT=3D=
255
FLOWLBL=3D0 FRAG:1448 INCOMPLETE ID:042d5795 PROTO=3DUDP
[...]

All following packets are logged twice.

So why is the connection not tracked? I would expect the fragment to belong
to an established connection and accepted.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH"
"CX:;",b;for(a/*    Chris           get my mail address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*               gcc -o sig sig.c && ./sig    */b/42*2-3)*42);}

--Sig_/dDaXnm.aMQ_1V5zGZDR=/iK
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQEcBAEBAgAGBQJRnfZtAAoJEIlFIdfMgPR2ZkUIAI5EhRtd8thqcNrvkEzCwe3g
uipYHNTDQeDCqUnTSX6/5ffBTU5xjEozO6PjrBwplQQVebej4NJgCrIw4LbEvBLX
CCTLQzUzF+JYYVxQ4hMIeVOa0keA4ZMRsgJjMb1Qqa3YeHUV167cnNDk8SWvMvvn
hHIbJrO55CcdpyyOmRsa/E33yA4ZNAYJJ+K/RjLE1yvghGvCo5EiXgQZdr+gcR3p
VNTJnHkQn2Da0GPgAw2PZOeoBnSXNQYGmwZNYRTjg1ofDrREg5l/DcA0OZZVvf2O
UtGjre4zXA4mc7sHnxtGKq1UZq8LuB6g65agy4NmI5kw+IBbIbM9rnNU4XhLT/U=
=jQX0
-----END PGP SIGNATURE-----

--Sig_/dDaXnm.aMQ_1V5zGZDR=/iK--
