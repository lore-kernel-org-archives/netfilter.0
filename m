From: Igor Bogomazov <bi@hl.ru>
Subject: INVALID connections and SNAT
Date: Mon, 12 Apr 2010 20:30:37 +0400
Message-ID: <20100412203037.25956ce2@admin.hl.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/qPHDy9VriRGso5J/3TBF=CL"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/qPHDy9VriRGso5J/3TBF=CL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

Just noticed few packets which pass SNAT in POSTROUTING without
altering their SRC. The problem has been obscured by the fact, that all
works in general, no one complain.

After I add REJECT rule for "-m state --state INVALID" connections,
unmodified (not NATed) packets have disappeared. All right now.

Why INVALID connections pass thru NAT instead of dropping them? It
seems like a security risk, when hacker can listen not-NATed packets
behind the router and learn a network topology.

--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,

Igor Bogomazov

--Sig_/qPHDy9VriRGso5J/3TBF=CL
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvDSq0ACgkQUAcYRD1tT0Si/QCgmaY9lPCdeOW01jvN+j84sJSp
VrMAoJoItOOcNUAkjSh9xqCMf4/PjcNm
=KuSl
-----END PGP SIGNATURE-----

--Sig_/qPHDy9VriRGso5J/3TBF=CL--
