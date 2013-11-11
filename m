From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Multiple mangling
Date: Tue, 12 Nov 2013 06:45:54 +1000
Message-ID: <1384202754.19072.44.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4rCDk4RwBwBPrwbKKAvv"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-4rCDk4RwBwBPrwbKKAvv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings all,

I am at the point in writing my "new and improved"(tm) firewall where I
am adding QoS. I am marking the packets in the MANGLE table with DSCP
values, but I also want to mark packets again so that my iproute2 qdiscs
can have an easier time handling them. This requires that I mark the
packets twice (i.e. once with "-j DSCP --set-dscp-class AF32", and again
with "-j MARK --set-mark 6").=20

The question is: can I do this with consecutive rules in the MANGLE
table? What is the behaviour once a packet has matched a rule in one of
the MANGLE table chains? Does it continue to drop through? Does it
effect a RETURN?=20


Thanks in advance.
--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-4rCDk4RwBwBPrwbKKAvv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAABCgAGBQJSgUICAAoJEJOjmtAqHQSLN8EQAIBlqbIWjmIP7+oSbMOCjJB6
2jqrOb7KuPPmV8rreLtw3Dgb0bMVBG6XXT7A3JCIfaiJ/TT7lDf57G3CG8jp/uYK
pnmDPYJ0FWQmZVcJjaymRz96V7FN2KqSEC3vhGpZWfZAfvGbT8oU8bLhwmReqd8D
dclNoUEr6xMcr5J+517tdhkFlqNGZLNdlYeLz/+B73TMGNlMN/3e0wtqerdqR5hk
xgFXlzRQS9twzPqI12QKgrX/A2sQE/98bSCoxzzMnL4tHMemytQtFOfYfXcagQ5e
BF0qoNx88ANJzQsa7mLMpHFecO7EJekMvKQqhAqkPaRSkPaEK/ztU9uSZF9X4FK/
xqI/7M3QPAMHa/Ivo9vYpQdfBvKtXP22nvO4wqalGIOPkw6gIdRMUXxEnU5jpy8M
4VzGWl0SYfd1RX6Fn5LKK4xXLMCgqDSniS8BXnp1/75XAUeiyLMQOi2gAWN2HxiK
xfhbi0SihJaJYA+h7LxO5AdeyPSVTIj1VNM6/XUEtMDEuyxvMIlXJ174IAibL0zh
OkL5fLrI4tK3FNOHwGyuI2yYbjwD+znRmozq3hktSgsx5CMfwZXoJaxqmhtT63Kk
AtJXt1f2NNUudJ+bOsSRc3fM3QKUbtXa/UUkJ+uSzXm2KfamviVT/+XRj769/3j1
LKW4mwcUtn9UaDkzU6qM
=5pNu
-----END PGP SIGNATURE-----

--=-4rCDk4RwBwBPrwbKKAvv--

