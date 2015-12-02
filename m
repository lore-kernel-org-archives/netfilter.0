From: Robert Sander <r.sander@heinlein-support.de>
Subject: nftables rate limit logging and then drop
Date: Wed, 2 Dec 2015 23:43:01 +0100
Message-ID: <565F73F5.3090004@heinlein-support.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ksr1mnufBjIHTG3vvlXg8UP0Xj8Lk3BQN"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ksr1mnufBjIHTG3vvlXg8UP0Xj8Lk3BQN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

How do I implement something like this in nftables:

iptables -A INPUT -m conntrack --ctstate INVALID -m limit --limit 3/m --l=
imit-burst 5 -j LOG --log-level debug --log-prefix "INVALID DROP: "
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

Kindest Regards
--=20
Robert Sander
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

http://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Zwangsangaben lt. =C2=A735a GmbHG:=20
HRB 93818 B / Amtsgericht Berlin-Charlottenburg,
Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein -- Sitz: Berlin


--ksr1mnufBjIHTG3vvlXg8UP0Xj8Lk3BQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWX3P1AAoJEPC7kVgj3lso48oQAK3E0M0zNbOMJy6H1kye64kV
wXiKCpJbnptm+kFtzs7CbCm7nWra23FXFKSr4Y7MmK4+QKNmss5WZNreUCEJy85c
TDkUsuHN5Cbi5KnDtTGTkR775CUS56lRwRfVbDJOMeIxnz89OnjgKbk22yGeJItG
ZzuWZ9v5+Xp3W0bemJNZyptx5J0pq2jSQnz23nFgMA4rv5la9shFmvdmF7DYa4/i
mNUSiPmO3bm5SfIxJPYseB1Y27wx+Q5Rj5t8Cfc3fI6T63FOPG6FMGIQGRB64M8d
f3dxQKYSO4OHtD8Y8umbeSUNCEqsOlN6A8s/iHLyScC6CYw7bNy+Z5SvzQ+4mQP+
xQ1IUDiyLu197Fr65UOhQmIEzgCfFZcbHwIsOnL0Hnh630SiyxUcRrcH0xv3E0K/
jqMl6F8GvjZgZnYIUuujxMCvzCrvMxy+T+PRp9mWVp/QzXyY5GfVIt2jO1n4f1bt
v0I80CUKLbEcRxXgYuCrAOMODC1yKi6bBDpJewF31PTvaIydIQk/xYHHeQ5LoyNe
+WF7OWPwkOWNQyXANMd3Nvy4DIQqaWgCgjPUyFJlGeesfn0p5VOhetAGh/Qwve3H
rPU2DMfWLAOwb9PIEeEfh/m3+A4rcefaSIC2C6SPTtBZs1UUB6spjgrQtPWPJVYw
L0JhT8LqQrlUwVLcKPZ7
=sLUh
-----END PGP SIGNATURE-----

--ksr1mnufBjIHTG3vvlXg8UP0Xj8Lk3BQN--
