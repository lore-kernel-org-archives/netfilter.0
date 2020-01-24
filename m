From: Robert Sander <r.sander@heinlein-support.de>
Subject: nft icmp type all?
Date: Fri, 24 Jan 2020 22:16:43 +0100
Message-ID: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="zDIngKy6hrZhbdnExDjAeGunKmdjI7nC2"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zDIngKy6hrZhbdnExDjAeGunKmdjI7nC2
Content-Type: multipart/mixed; boundary="rFXPQlSfHSbFLbnun2XNfMHe6T33glvpF"

--rFXPQlSfHSbFLbnun2XNfMHe6T33glvpF
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

how do I specify a rule to match all ICMP packages?

nft add rule ip filter input icmp accept

does not work.

nft add rule ip filter input icmp type all accept

also does not work. any instead of all also no success.

Is it really necessary to have all possible ICMP types in a set with a
rule like this?

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


--rFXPQlSfHSbFLbnun2XNfMHe6T33glvpF--

--zDIngKy6hrZhbdnExDjAeGunKmdjI7nC2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAl4rXsMACgkQ8LuRWCPe
Wyi9TRAAtq7MygaDXw2IwoK5UyUgBUh5xcS60hh/5x/hrKNaoZdKce6KFtypfA5E
/MKQh4x6NR1hmB8VLOwUpLACQ1rdb0t37sHMlrF6ZLPqeU2GNkGtEaT8mwDYfMu9
rbTMku/Ak+0CZJzZTruAl8/akpQoSUH4jCvRs683gMtZCVuslfmgfHMHx0jtZAni
T0SOZse8ConhUhwbRa4zifbbdgenES5QPJ1JzACE/cSzNAMXDrZB26rWkuniGgnN
nmWjtyVolxVxKIp7SuMN0+lrwxDlRF1YjvB6v8Lm7pEVBYIimjBnla/s6cvoprPi
FqlM/ffudFujJydhTsbkm69koU2FwubEw0ujPNGwttP+nMYHUp/gy76OqdUQhnBH
olIvcN7DRwWo7Otz9Om809z0GSBo0Q4Ml0V6TR66T7yyis86WzzhxfzTKEZEaolh
soPggyC/2aqeCtkjb/9BcCf2DYM9PtNUXoiA611OCRv1QCXctOSHSKwE5pejZQek
6WJAH779xBQrTPOJLMmFZ3K0eNnPbpkEP4r9oq1dZOPBPeoy9+boxpltigVMd1lP
jWHa82kFh3wtY1MC4R8Ih5+bcUsTn1zHlzf0qvIjK6+XtAbKQsReJeFEdIOZbhOq
rjUya4v0jEMxAC5Njl+b8p3++kvvJs51HIzKHjxQw3d0A9g2w0Q=
=Gfyc
-----END PGP SIGNATURE-----

--zDIngKy6hrZhbdnExDjAeGunKmdjI7nC2--
