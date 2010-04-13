From: Igor Bogomazov <bi@hl.ru>
Subject: Fw: INVALID connections and SNAT
Date: Tue, 13 Apr 2010 11:36:19 +0400
Message-ID: <20100413113619.65adedf0@admin.hl.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/FEDSiHdYj6BrjSTRohv79h8"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/FEDSiHdYj6BrjSTRohv79h8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Which are your rules in the nat table (POSTROUTING)?

Briefly, what I have:

*nat
-A POSTROUTING -s 192.168.1.0/24 ! -d 192.168.0.0/16 \
	-j SNAT --to-source 22.33.44.55
*filter
-A FORWARD -s 192.168.0.0/24 \
	-m comment --comment "admin-subnet" -j ACCEPT
-A FORWARD -d 192.168.1.0/24 \
	-m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -d 192.168.1.0/24 \
	-j REJECT --reject-with icmp-host-unreachable
-A FORWARD -s 192.168.1.0/24 \
	-j ACCEPT

how to test:

tcpdump -i eth0 -ne 'net 192.168.1.0/24'

here eth0 (22.33.44.55): internet interface

as example, what test outputs _sometimes_ (rarely):

IP 192.168.1.4.50226 > 74.125.77.19.443: F 253979169:253979169(0) ack
	3081852170 win 16445
IP 192.168.1.4.50226 > 74.125.77.19.443: F 0:0(0)
	ack 1 win 16445
IP 192.168.1.4.50226 > 74.125.77.19.443: F 0:0(0) ack 1
	win 16445
IP 192.168.1.4.50226 > 74.125.77.19.443: F 0:0(0) ack 1 win
	16445
IP 192.168.1.4.50226 > 74.125.77.19.443: F 0:0(0) ack 1 win 16445
IP 192.168.1.4.50226 > 74.125.77.19.443: F 0:0(0) ack 1 win 16445
IP 192.168.1.4.50226 > 74.125.77.19.443: R 1:1(0) ack 1 win 0=20

Also:

1. flushing connections with 'conntrack -F' considerably increases the
	rate of these unNATed packets
2. after
	iptables -A FORWARD -s 192.168.0.0/16 \! -d 192.168.0.0/16 \
	-m state --state INVALID -j DROP
   all works properly (no strange packets)

>=20
> Jorge D=C3=A1vila.
>=20
> Jorge Isaac Davila Lopez
> Nicaragua Open Source
> +505-8430-5462
> davila@nicaraguaopensource.com
>=20
> En Abr 12, 2010, Igor Bogomazov <bi@hl.ru> escribi=C3=B3:
> Hello,
>=20
> Just noticed few packets which pass SNAT in POSTROUTING without
> altering their SRC. The problem has been obscured by the fact, that
> all works in general, no one complain.
>=20
> After I add REJECT rule for "-m state --state INVALID" connections,
> unmodified (not NATed) packets have disappeared. All right now.
>=20
> Why INVALID connections pass thru NAT instead of dropping them? It
> seems like a security risk, when hacker can listen not-NATed packets
> behind the router and learn a network topology.
>=20

--
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,

Igor Bogomazov

--Sig_/FEDSiHdYj6BrjSTRohv79h8
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvEHvMACgkQUAcYRD1tT0TMvACghWKwekGFYjAefnsV1ZYosI/s
ePsAn3lyLinIIU+NwU+IDNLeb0COzM2O
=cKns
-----END PGP SIGNATURE-----

--Sig_/FEDSiHdYj6BrjSTRohv79h8--
