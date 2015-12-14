From: Robert Sander <r.sander@heinlein-support.de>
Subject: iptables mangle PREROUTING on br0.17
Date: Mon, 14 Dec 2015 17:10:37 +0100
Message-ID: <566EE9FD.6020508@heinlein-support.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="lWUeJCItlNVUhr9ACeF6rvEqWL7LHxGu0"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lWUeJCItlNVUhr9ACeF6rvEqWL7LHxGu0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I need to add a connection mark on packets that enter the system on a
bridge interface with a VLAN tag.

The network setup looks like:

eth0-\
eth1--\                 /-br0.15
eth2----bond0--\       /--br0.16
eth2--/         --br0-----br0.17
         tap0--/       \--br0.18

The rule

iptables -t mangle -A PREROUTING -i br0.17 -j CONNMARK --set-xmark 0x11

does not match the packets incoming on br0.17, no connection mark is
applied. tcpdump -i br0.17 shows incoming packets.

Is it even possible to match which such a nested setup for the interfaces=
?

Regards
--=20
Robert Sander
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin
http://www.heinlein-support.de


--lWUeJCItlNVUhr9ACeF6rvEqWL7LHxGu0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWbun9AAoJEPC7kVgj3lsomqgQAII0HrAIhsSSRWJYCqQNPgdR
kM/Kv8YSOJ1YzK2cGuh/qAqs8GeJS7rz9AYKg+p5t6+VoVwGUKz0BAuHSMRfWLWY
id7ZxmDU1Gxa96N5BUC4SFFjJcxEt+0lFBS0Gcuaw9LKVuVeeuhKicPpqfFsOHhj
PDlr3A2YhuUyjSii6BZGhBYdVQgbi64pA59fsKVPnIKqnevB2Oc7Gsi0tcwlvjm3
t2P79g233jxcPFI2UmBdJeGB6Oz5VQE3OJVpPzwV9fvUSS+IE0is6XEYbmY1UIlM
5WZOZ1xT5dNH9ba/o0z//ZcbX/kEX1Yx6zYU3qwn14GR/8Ywx7tUBdqLbuzJ6Gaw
Vh8eNB06TBk1RRF2EnuHZwFndbB8uNtroCSTHCW2TfBtK3pSNsb7GrrHNDRbjNMH
u94L2nU4XVwx5QBfkK9lz7UOo27wi6m1dBAfrFfUnZxY+yJlXtSPVkCYCx8XNgbQ
v8zv8DiOQ0G2VNE/TNsMm8ZkD+ZPi2rrHbL8K98Cu2h5qLbCBFsse4LmsYxMbajJ
b4fMjNhntZcI7y6DHciLyBa2TKqKapk1agv0uSAo/aaw/s08PxMFBKKbcRPtCmlv
0MkoY3tVjLgr7NxjKmlbjgaApMHt1ggd27C/1UGnlzWHO0v3dG+cOwN+km8Or8Hf
Lcdo1nUmDDsd4zMRMkwk
=PVpi
-----END PGP SIGNATURE-----

--lWUeJCItlNVUhr9ACeF6rvEqWL7LHxGu0--
