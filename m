From: Eric Leblond <eric@inl.fr>
Subject: Re: libnetfilter_conntrack.so and C++
Date: Mon, 25 Sep 2006 14:39:45 +0200
Message-ID: <1159187985.13157.7.camel@localhost.localdomain>
References: <2b76460a0609250151m51778379u34b0e89aecfbf219@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-QYi6jQv+PzXcLzSLOPJZ"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2b76460a0609250151m51778379u34b0e89aecfbf219@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: denis stauffer <denis.stauffer@gmail.com>
Cc: netfilter@lists.netfilter.org


--=-QYi6jQv+PzXcLzSLOPJZ
Content-Type: multipart/mixed; boundary="=-0ntKzccq5rDyoR8MZ7XT"


--=-0ntKzccq5rDyoR8MZ7XT
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 25 septembre 2006 =E0 10:51 +0200, denis stauffer a =E9crit :
> Hi everybody,
>=20
> I'm trying to develop a C++ programm wich uses
> libnetfilter_conntrack.so library. I've encountered a problem when
> linking the library : the called funtions in libnetfilter_contrack are
> not recognized.
> If some one has succeeded to use the libnetfilter_conntrack library
> with g++, please can you gve me some information about how to do it.
>=20
> Thank's in advance,
> Denis

Coud you try the following patch ?

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 39, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-0ntKzccq5rDyoR8MZ7XT
Content-Disposition: attachment; filename=libnetfilter_conntrack_g++.diff
Content-Type: text/x-patch; name=libnetfilter_conntrack_g++.diff;
	charset=iso-8859-15
Content-Transfer-Encoding: base64

SW5kZXg6IGluY2x1ZGUvbGlibmV0ZmlsdGVyX2Nvbm50cmFjay9saWJuZXRmaWx0ZXJfY29ubnRy
YWNrLmgNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCi0tLSBpbmNsdWRlL2xpYm5ldGZpbHRlcl9jb25udHJhY2svbGli
bmV0ZmlsdGVyX2Nvbm50cmFjay5oCShyZXZpc2lvbiA2NjcwKQ0KKysrIGluY2x1ZGUvbGlibmV0
ZmlsdGVyX2Nvbm50cmFjay9saWJuZXRmaWx0ZXJfY29ubnRyYWNrLmgJKHdvcmtpbmcgY29weSkN
CkBAIC04LDYgKzgsMTggQEANCiAjaWZuZGVmIF9MSUJORVRGSUxURVJfQ09OTlRSQUNLX0hfDQog
I2RlZmluZSBfTElCTkVURklMVEVSX0NPTk5UUkFDS19IXw0KIA0KKw0KKy8qIERpc2FibGUgaW5s
aW5lIGtleXdvcmQgd2hlbiBjb21waWxpbmcgaW4gc3RyaWN0IEFOU0kgY29uZm9ybWFuY2UgKi8N
CisjaWYgZGVmaW5lZChfX1NUUklDVF9BTlNJX18pICYmICFkZWZpbmVkKF9fY3BsdXNwbHVzKQ0K
KyMgIGRlZmluZSBpbmxpbmUNCisjZW5kaWYNCisNCisjaWZkZWYgX19jcGx1c3BsdXMNCitleHRl
cm4gIkMiIHsNCisjZW5kaWYNCisNCisNCisNCiAjaW5jbHVkZSA8bmV0aW5ldC9pbi5oPg0KICNp
bmNsdWRlIDxsaWJuZm5ldGxpbmsvbGludXhfbmZuZXRsaW5rLmg+DQogI2luY2x1ZGUgPGxpYm5m
bmV0bGluay9saWJuZm5ldGxpbmsuaD4NCkBAIC0zMzIsNiArMzQ0LDggQEANCiBleHRlcm4gdm9p
ZCBuZmN0X2J1aWxkX3R1cGxlKHN0cnVjdCBuZm5saGRyICpyZXEsIGludCBzaXplLCANCiAJCQkg
ICAgIHN0cnVjdCBuZmN0X3R1cGxlICp0LCBpbnQgdHlwZSk7DQogDQorI2lmZGVmIF9fY3BsdXNw
bHVzDQorfQ0KKyNlbmRpZg0KIA0KLQ0KICNlbmRpZgkvKiBfTElCTkVURklMVEVSX0NPTk5UUkFD
S19IXyAqLw0K


--=-0ntKzccq5rDyoR8MZ7XT--

--=-QYi6jQv+PzXcLzSLOPJZ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBFF84RnxA7CdMWjzIRAhvlAJ9QgsC2EplEtCnS7urSxQwjcLVFWwCdHyNV
AWkv+2sHwTIbH4Fhi3vbHUs=
=2q8N
-----END PGP SIGNATURE-----

--=-QYi6jQv+PzXcLzSLOPJZ--


