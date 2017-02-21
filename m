From: Robert Sander <r.sander@heinlein-support.de>
Subject: CLUSTERIP for router?
Date: Tue, 21 Feb 2017 09:31:16 +0100
Message-ID: <defb364c-503b-7a83-7ca2-308e8ce81569@heinlein-support.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vJMKDCke0jGlQe6pG4rj3lT5LgjhLE1oe"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vJMKDCke0jGlQe6pG4rj3lT5LgjhLE1oe
Content-Type: multipart/mixed; boundary="sSvbwBj0hreecQ5UNup69W6wLl1o8gfBe";
 protected-headers="v1"
From: Robert Sander <r.sander@heinlein-support.de>
To: netfilter@vger.kernel.org
Message-ID: <defb364c-503b-7a83-7ca2-308e8ce81569@heinlein-support.de>
Subject: CLUSTERIP for router?

--sSvbwBj0hreecQ5UNup69W6wLl1o8gfBe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

is it possible to use the iptables CLUSTERIP target in a two node router
pair?

My testing experience shows that it works perfectly for connections to
the hosts but packets addressed to the multicast MAC address with other
IP destination addresses will not be picked up and forwarded.

I tried a CLUSTERIP target rule in the PREROUTING chain of the nat table
but that has no effect.

The goal would be to load balance outgoing traffic between the uplinks
connected to the routers.

Is that even possible?

Regards
--=20
Robert Sander
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

http://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Zwangsangaben lt. =C2=A735a GmbHG:
HRB 93818 B / Amtsgericht Berlin-Charlottenburg,
Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein -- Sitz: Berlin


--sSvbwBj0hreecQ5UNup69W6wLl1o8gfBe--

--vJMKDCke0jGlQe6pG4rj3lT5LgjhLE1oe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYq/rVAAoJEPC7kVgj3lsoSksP/RgOBuXMeShvyxI+SEorf0Le
i5XR9gsuYF0TG4IPkaNRfN9vy2q6nFYaM4fFJwbZ4gi+Uh6QBha5UdMpw40ykwKT
NP89J7p9EWkgYbV4kAuWSZ6qEf5xX06AO9h8HpmrbQ+dttUApp9vIXZfuBJWNIXW
RzYo3M4Dtn0rQ1cTTFk9eduxf9RLx0Aw5G3Q5pNG51kh58g9uNEjaCWcabxZVUlp
bT5Xz1ziibsikfqcBraBDma+I7sx8hWt3vEfer1vNehLQ86heqRQhY6jlkTHGdSy
BKomrgyQ0mNemJMPzjKxZAov5cT4j5jIDLxZwSNUVL4nCGdqo7Z+cvzh+JfePyRI
5kxA9kCUhldw+QLVaDc9FKugzY/IB6661degTTIc706sHSkp4vVUvr/sjOar9Sw+
VrpcbZJ2aSGQM4dB2rmWNmXajoxXfgO5eTJ8/Q6oZzbvmA8njZIBlbfEA8+uD7IA
0V9NzRjWvQ6ZJ0efVPevINXHkhThi1JBx3qT0CRagPW+Yptv/6Jg2g81Ii2U8YN6
7LFL9FQP1O1m7vUR6Q1qrG/nOUZ+gTClxDAdIhKlGbA0BbgbAPh4T7ul/wjFErv/
ewYuxiDyXm1CMnxeDUs0Hlx14HyHksiB2JQyA+PaPuZ884wX6zEBf9f0Iy2htNLe
/EdQux/NDcIJjUPjzhpI
=X8Bg
-----END PGP SIGNATURE-----

--vJMKDCke0jGlQe6pG4rj3lT5LgjhLE1oe--
