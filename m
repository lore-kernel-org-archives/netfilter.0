From: Lucas Fernando Vasconcelos de Arruda Amorim 
	<lf.amorim@yahoo.com.br>
Subject: BUG: iptables-save: getlong_opt missing one argument
Date: Thu, 21 Jan 2010 21:09:44 -0200
Message-ID: <1264115384.2640.12.camel@ibm-fernando>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-7cCCIe0zgCBf0rsJ5Xtt"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-7cCCIe0zgCBf0rsJ5Xtt
Content-Type: multipart/mixed; boundary="=-oVmK3DK9lEkL1rqto51B"


--=-oVmK3DK9lEkL1rqto51B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I saw that was missing an M on getlong_opt in iptables-save.c, therefore
I send this small patch to analyses.

Thanks, Lucas Fernando Amorim

--=-oVmK3DK9lEkL1rqto51B
Content-Disposition: attachment; filename="iptables-save_getopt_long.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="iptables-save_getopt_long.patch"; charset="UTF-8"

MTU1YzE1NQ0KPCAJd2hpbGUgKChjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgImJjZHQ6Iiwg
b3B0aW9ucywgTlVMTCkpICE9IC0xKSB7DQotLS0NCj4gCXdoaWxlICgoYyA9IGdldG9wdF9sb25n
KGFyZ2MsIGFyZ3YsICJiY2RNOnQ6Iiwgb3B0aW9ucywgTlVMTCkpICE9IC0xKSB7DQo=


--=-oVmK3DK9lEkL1rqto51B--

--=-7cCCIe0zgCBf0rsJ5Xtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Esta =?ISO-8859-1?Q?=E9?= uma parte de mensagem
 assinada digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktY3rcACgkQkdzOjPTLpnC2nQCeLVwvw2gsUafRUefUnHwJ4h5B
65gAniWmcFjrwVdLCteUrtCwfOaCMcKQ
=5kuX
-----END PGP SIGNATURE-----

--=-7cCCIe0zgCBf0rsJ5Xtt--


