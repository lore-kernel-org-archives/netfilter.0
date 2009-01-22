From: Peter Volkov <pva@gentoo.org>
Subject: [patch] iptables fix for bug 568
Date: Thu, 22 Jan 2009 10:53:06 +0300
Message-ID: <1232610786.7782.16.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-HTYcFiUQxw3c9GkPlFpo"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-HTYcFiUQxw3c9GkPlFpo
Content-Type: multipart/mixed; boundary="=-+EFWO6UOE8f8aYMRNl0A"


--=-+EFWO6UOE8f8aYMRNl0A
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello, guys. Please, review attached patch. It should fix:

http://bugzilla.netfilter.org/show_bug.cgi?id=3D568

At least it did for me with testcase user provided in our bugzilla:

https://bugs.gentoo.org/show_bug.cgi?id=3D254496

--=20
Peter.

--=-+EFWO6UOE8f8aYMRNl0A
Content-Disposition: attachment; filename="iptables-1.4.2-hashlimit.patch"
Content-Type: text/x-patch; name="iptables-1.4.2-hashlimit.patch"; charset="UTF-8"
Content-Transfer-Encoding: base64

QXV0aG9yOiBwdmFAZ2VudG9vLm9yZw0KRml4ZXMgYnVnIGh0dHA6Ly9idWdzLmdlbnRvby5vcmcv
c2hvd19idWcuY2dpP2lkPTI1NDQ5Ng0KDQo9PT0gbW9kaWZpZWQgZmlsZSAnZXh0ZW5zaW9ucy9s
aWJ4dF9oYXNobGltaXQuYycNCi0tLSBleHRlbnNpb25zL2xpYnh0X2hhc2hsaW1pdC5jCTIwMDkt
MDEtMjEgMTg6MjM6MjIgKzAwMDANCisrKyBleHRlbnNpb25zL2xpYnh0X2hhc2hsaW1pdC5jCTIw
MDktMDEtMjEgMTg6MjM6MzIgKzAwMDANCkBAIC02MzYsNyArNjM2LDcgQEANCiAJaWYgKGluZm8t
PmNmZy5tYXggIT0gMCkNCiAJCXByaW50ZigiLS1oYXNobGltaXQtaHRhYmxlLW1heCAldSAiLCBp
bmZvLT5jZmcubWF4KTsNCiAJaWYgKGluZm8tPmNmZy5nY19pbnRlcnZhbCAhPSBYVF9IQVNITElN
SVRfR0NJTlRFUlZBTCkNCi0JCXByaW50ZigiLS1oYXNobGltaXQtaHRhYmxlLWdjaW50ZXJ2YWwg
JXUiLCBpbmZvLT5jZmcuZ2NfaW50ZXJ2YWwpOw0KKwkJcHJpbnRmKCItLWhhc2hsaW1pdC1odGFi
bGUtZ2NpbnRlcnZhbCAldSAiLCBpbmZvLT5jZmcuZ2NfaW50ZXJ2YWwpOw0KIAlpZiAoaW5mby0+
Y2ZnLmV4cGlyZSAhPSBYVF9IQVNITElNSVRfRVhQSVJFKQ0KIAkJcHJpbnRmKCItLWhhc2hsaW1p
dC1odGFibGUtZXhwaXJlICV1ICIsIGluZm8tPmNmZy5leHBpcmUpOw0KIA0KDQo=


--=-+EFWO6UOE8f8aYMRNl0A--

--=-HTYcFiUQxw3c9GkPlFpo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: =?UTF-8?Q?=D0=AD=D1=82=D0=B0?=
 =?UTF-8?Q?_=D1=87=D0=B0=D1=81=D1=82=D1=8C?=
 =?UTF-8?Q?_=D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D1=8F?=
 =?UTF-8?Q?_=D0=BF=D0=BE=D0=B4=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B0?=
 =?UTF-8?Q?_=D1=86=D0=B8=D1=84=D1=80=D0=BE=D0=B2=D0=BE=D0=B9?=
 =?UTF-8?Q?_=D0=BF=D0=BE=D0=B4=D0=BF=D0=B8=D1=81=D1=8C=D1=8E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkl4JeIACgkQz6tlgEWSarOgcQCdE1qr0IIBxQtae57m6Z55bgP6
NGgAnj+BPH4AI1R7wN+QYzz5CvpJcmFc
=NrvK
-----END PGP SIGNATURE-----

--=-HTYcFiUQxw3c9GkPlFpo--

