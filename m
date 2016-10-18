From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 23:50:51 +0200
Message-ID: <19c64580-f9da-f0de-5bc6-d6013b3bf800@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
 <20161018085957.GC29405@breakpoint.cc>
 <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
 <20161018205544.GA21308@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uhQOuTmM0QWqtnJj04acebMp2GqWo104e"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161018205544.GA21308@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uhQOuTmM0QWqtnJj04acebMp2GqWo104e
Content-Type: multipart/mixed; boundary="vC701LWnMlbGDo6LGVnpvRswR3WOwHnjM";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>,
 netfilter@vger.kernel.org
Message-ID: <19c64580-f9da-f0de-5bc6-d6013b3bf800@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
 <20161018085957.GC29405@breakpoint.cc>
 <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
 <20161018205544.GA21308@breakpoint.cc>
In-Reply-To: <20161018205544.GA21308@breakpoint.cc>

--vC701LWnMlbGDo6LGVnpvRswR3WOwHnjM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.10.2016 22:55, Florian Westphal wrote:
> Same as above, except that it would check sp->xvec[X], for a fixed (use=
r
> defined) value of X, rather then searching all of sp->xvec[].
>=20
> Or, putting it differently, in 1) user providides data (ip address,
> spi, ...) and sp->xvec is the haystack we will search in.
>=20
> I expect most users and use cases are covered by this, rather than 2).
>=20
> For 2), user gives a policy index and tells us if they want saddr,
> daddr, spi or reqid and we will then copy it to a register.
>=20
> (Where another nft expression, e.g. cmp, can evaluate it)
>=20
> So 2) is only needed when exact matching of the entire policies
> is requested (--strict) mode.
>=20
> If you think we can go without strict, then only 1) is needed.
>=20
> The drawback is that 1) is very un-nftables like, but alas, I don't
> think we can avoid it.


well, I think being able to search all policies would be a nifty thing to=
 have.
But sure, doing the first thing would be much better and more suitable as=
 a
replacement for -m policy in nftables.



--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--vC701LWnMlbGDo6LGVnpvRswR3WOwHnjM--

--uhQOuTmM0QWqtnJj04acebMp2GqWo104e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBpk7Fxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYxkQP/iwUxiYCjieZo838qF8CFzuG8J9c37S7Dw0N56tDMEQn1sw3hqKLm3AO
O4aTzANpY84WiyhffynQEbe66mR0DE7oqcGlkzhDQQlE9FNVTSDJGRv66bGxi9lx
nY/Kca4Ahdz9JJrbMBkO0iGo02Q9hmyXB+Xe6RKxC4hyyM5i7TI2nLK+GmR86Q6n
B4KOnwTCsEshHLQYItASW/7KBiygjQEVsDG1o73itxhXHDqiDkGhMsYKgkTvXZ5d
lN2v4Vqb6XIlhTb6B4Gm9JTga8YljcaYwFPlUlTq+0zXt6LUPKyGozc/Susa7KHQ
1flKQgOP34TNJkoFyuJndbp6h036sMvU0Lru2fLUgz3wQ3/mQeJbuMKTTxMYl1nt
ZvfM8uHRRo2fyX1VaKf8yu6KPt3JR8tcOUNmh3KM84KoXV7DFzs6Urip8naALGnc
jKERU5OxWrBceGjdqUSQxJLafCU7mHZ4KnDkDDCsXxZKYd+Ty1FSbqn1qGqDAnap
pEoJXu7Xx1o8TX+P9FI6YvsLOdNXUk2fe5DpUsg0KotZ1rPc29myG0xy/RSLFkp6
YlAVDyiTxeQSXofheqvMph3Oo/TdhtLI3pgDXwkuBe4evFqu/h8z7nNU3ucCrXEY
Ru9Sx5Z28agI/7FV66fnL5+RDGxdjwYq/ay254iHfxsOb0fSpFpB
=tRhl
-----END PGP SIGNATURE-----

--uhQOuTmM0QWqtnJj04acebMp2GqWo104e--
