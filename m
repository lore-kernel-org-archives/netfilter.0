From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: iptbles and multiple ipset matces
Date: Mon, 09 Jul 2012 14:53:33 +1000
Message-ID: <1341809613.5850.13.camel@donetsk.home.lusan.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2jGgNw2PMF3PgCQsL7oK"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-2jGgNw2PMF3PgCQsL7oK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings

I'm putting together a new firewall, using ipsets to simplify the
overall rules. I would like to know if I can use multiple sets in a
single rule. For example would the following be possible:

ipset create incoming_ports bitmap:port
ipset add incoming_ports 53
ipset add incoming_ports 25
ipset add incoming_ports 80
ipset add incoming_ports 143

ipset create local_addresses bitmap:ip
ipset add local_addresses 192.168.0.1
ipset add local_addresses 150.250.150.253

iptables -A -p tcp -m set --set local_addresses src\
--set incoming_ports dst -j ACCEPT


Or should I match on one thing first and push the result into a chain to
match with the second set?


--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-2jGgNw2PMF3PgCQsL7oK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABCgAGBQJP+mPOAAoJEJOjmtAqHQSLPBoP/Rnx3LwPDv7iyHv0qPM0CEZI
Non6Tmn1YKJg9yMM14CpMiCYkaadtlHPSeTxHBFDi8X5Q4bqMaCA2TfqnmXCyB6K
o14ssBERTuUCQYGLq7u5q349E2ud26JAioUQjJG/LvS1PpdVop4HW9owVdGPrjhF
LABjap5WU+YR63hpi1BVN5NoiazX5zQv/QgDnNcs9XzVMp1jkNucVimZbQI2dFbg
6emTn9rJdiOr1icimVbmq4oLE7+XTt2ZnDveYKGdPAhFDixmsS4MrfEytg7a8YFD
sZKqgoYVbsFHKWmLbdDvQMXuKovWHxc0EPv3c0/g05eoyDmta0TvaayU0KXDVMa+
4YUpsuwnvR16eeD8QzmtvT3L2Sk2+yRChndnum8uo3o9srH1v8T50RYE7/YZrCwX
nZA0aDH4q58gLkSHkTXAxWzSF5bKzFhXZXd2KF2mI7ziz8u47GF7vflQ4YKS76+w
ZllccxCxqRJJg4BWA12IqnvlPf3cUAO9Rmsa3vD+du5MVWI0PBhZEoHFzeK7T3wx
d0PqPrEld1h8NA7gSHZ2Cw+jzBPpyTSitHi6Xbd9wkE6DYi4mTDVCFUmwETAVGD5
pqLPqvmpXbFSaur7jXGxpbaSZ+QjSJrdPdTBcQHFmqcxipYu4zJqHvJsWsUxnLsJ
Mz1AaHaPYlyDp8BQvGGl
=QTm/
-----END PGP SIGNATURE-----

--=-2jGgNw2PMF3PgCQsL7oK--

