From: Andreas Hainke <andreas.hainke@foteviken.de>
Subject: nftables: Using variables in named sets
Date: Mon, 29 Aug 2016 13:37:20 +0200
Message-ID: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xrVvMgV1HXvtqiO9heHQidBclRtxPsAM5"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xrVvMgV1HXvtqiO9heHQidBclRtxPsAM5
Content-Type: multipart/mixed; boundary="KPUKN3Tl7oNm8eqUMkJe71OdtLA0ILkWt"
From: Andreas Hainke <andreas.hainke@foteviken.de>
To: netfilter@vger.kernel.org
Message-ID: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
Subject: nftables: Using variables in named sets

--KPUKN3Tl7oNm8eqUMkJe71OdtLA0ILkWt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have a question regarding the definition of variables in nft. I have
created two files rules.nft and definitions.nft. The file rules.nft=20
contains a ruleset as follows:


include "/opt/firewall/filter/definitions.nft"
table inet forward {
*        set s-ext-2-int {**
**                type ipv4_addr . inet_service**
**                elements =3D  { $s-ext-2-int }**
**        }*

        chain segments {
                type filter hook forward priority 0; policy drop;
                ct state established, related accept

                ip saddr $g_n_int ip daddr $n_dmz ct state new jump
int-2-dmz
                ip saddr $n_dmz ip daddr $g_n_int ct state new jump
dmz-2-int
                ip saddr $g_n_int ip daddr $n_ext ct state new jump
int-2-ext
                ip saddr $n_ext ip daddr $g_n_int ct state new jump
ext-2-int
                ip saddr $n_dmz ip daddr $n_ext ct state new jump dmz-2-e=
xt
                ip saddr $n_ext ip daddr $n_dmz ct state new jump ext-2-d=
mz

                ip6 saddr $g6_n_int ip6 daddr $n6_dmz ct state new jump
int-2-dmz
                ip6 saddr $n6_dmz ip6 daddr $g6_n_int ct state new jump
dmz-2-int
                ip6 saddr $g6_n_int ip6 daddr $n6_ext ct state new jump
int-2-ext
                ip6 saddr $n6_ext ip6 daddr $g6_n_int ct state new jump
ext-2-int
                ip6 saddr $n6_dmz ip6 daddr $n6_ext ct state new jump
dmz-2-ext
                ip6 saddr $n6_ext ip6 daddr $n6_dmz ct state new jump
ext-2-dmz
        }
        chain int-2-dmz {
                ip protocol icmp accept
                ip6 nexthdr ipv6-icmp accept
                ip saddr $g_h_int_DNS ip daddr $g_h_dmz_DNS udp dport 53
accept
               #...
        }
    #...
}


The file rules.nft contains all variable definitions:

#########################
# Interface definitions #
#########################
define i_local =3D lo
define i_int =3D eth1
define i_dmz =3D eth2
define i_ext =3D eth0

*define s-ext-2-int =3D 10.10.10.10 . 25*

#######################
# Network definitions #
#######################
# Internal segments
define n_int =3D 10.10.10.0/24
define n_int_cluster =3D 10.10.20.0/24
#...


I can use the variables as expected, except for named sets. Using only
one element in s-ext-2-int is working properly, but as soon as I add a
second element to the variable definition like this:*
*

*define s-ext-2-int =3D 10.10.10.10 . 25, 10.10.10.10 . 143*

I receive the following error while loading the rules using nft -f:


In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
/opt/firewall/filter/rules.nft:9:38-38: Error: syntax error, unexpected
comma, expecting newline or semicolon
n_int tcp dport 22 ct state new accept
                                     ^
In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
/opt/firewall/filter/rules.nft:19:32-42: Error: unknown identifier
's-ext-2-int'
        elements =3D  { $s-ext-2-int }
                               ^^^^^^^^^^^

Is it possible to use variables for named sets, maps, etc. or is this
currently not possible?

Kind regards,

Andreas






--KPUKN3Tl7oNm8eqUMkJe71OdtLA0ILkWt--

--xrVvMgV1HXvtqiO9heHQidBclRtxPsAM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJXxB50AAoJENMia1VtPcvYTtwP/inp62XzVznTGT6FSIgVv/59
cBhMvagD9gDbHh6xuDy5AJ7szL1zAhMlgrsVA/EoJllfqwzT9nwDU39yl9SnoBpW
Z72AMaQPvpmPxNuxZoPV+0YT56+MNuPGp9R7DPo+qm8DaaW7vyy39DY3qTQzIfDS
BfM0R1PoHbjCe+09UZMFE+Y9Wt93g2BzIccKnraoSoycR50x43ETiireEIh1L+/b
L5RD4TLF1L33RoXPvXAAl+lmN7d79UZ83S24OE60fyR28gyNUFrdmmAgRMKa7/J5
b/2BZnPZRSp3RgeDla7UK46zdLw56D33HoOUCpbUtrOmVlAnkMkRXLEZTD1rLqyk
PwyX98QKrG9CCyLm7SR92yazhk6Gl8UEkmyRvXsNmkgWZngxi8f40Arx/qPXSXAl
S5/ECZvYZVB59jT7Xd1OjDs3Yx1l7yFkxBbe54+tmCKvqJna0HnzoMcVaTrxPQ1S
PxCxw6k1PzlHLv4N9TrbboHM7e+MAnZixjj4JIGJ+f3+EJUD1Lm+AduyWaiKXEze
mYMhif62CVJhTtc+U1J4DloRzje1Psv69xXtzKZUErs3a0Kx6mxwj1+AJTKDgH6H
jhEfO0EeAEYlZ20ZrpOEZeRWw7S4p0FnHCyBOSL5Y6yBsnxAv8XzFvUnmmDu0mJG
rHPQrMtx04BgQOsmEWzz
=Vq3+
-----END PGP SIGNATURE-----

--xrVvMgV1HXvtqiO9heHQidBclRtxPsAM5--
