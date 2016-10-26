From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: iptables 'related' not working under linux kernel 4.8.3?
Date: Wed, 26 Oct 2016 20:20:06 +0200
Message-ID: <53afa8b4-f32e-0a2a-224c-801485edbde3@familie-kuntze.de>
References: <CAHGunUmgVPqiYTiAH3bQP5r_Ygj364EQhtz25Nr9aNDS0toR0g@mail.gmail.com>
 <CAHGunUk-HV6ELx0TqngV0Ghyu75Yp8NFgBnbhumJVt+V=hRWeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pJGVqQH8SSJnRrNr36HjU9wFkAi0VK4J6"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHGunUk-HV6ELx0TqngV0Ghyu75Yp8NFgBnbhumJVt+V=hRWeA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Michael Johnson - MJ <mj@revmj.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pJGVqQH8SSJnRrNr36HjU9wFkAi0VK4J6
Content-Type: multipart/mixed; boundary="oWJOUcU3L85O1Tx4xSc0H3VT9bnalfKoh";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Michael Johnson - MJ <mj@revmj.com>, netfilter@vger.kernel.org
Message-ID: <53afa8b4-f32e-0a2a-224c-801485edbde3@familie-kuntze.de>
Subject: Re: iptables 'related' not working under linux kernel 4.8.3?
References: <CAHGunUmgVPqiYTiAH3bQP5r_Ygj364EQhtz25Nr9aNDS0toR0g@mail.gmail.com>
 <CAHGunUk-HV6ELx0TqngV0Ghyu75Yp8NFgBnbhumJVt+V=hRWeA@mail.gmail.com>
In-Reply-To: <CAHGunUk-HV6ELx0TqngV0Ghyu75Yp8NFgBnbhumJVt+V=hRWeA@mail.gmail.com>

--oWJOUcU3L85O1Tx4xSc0H3VT9bnalfKoh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.10.2016 19:54, Michael Johnson - MJ wrote:
> Hm...
>=20
> Well, I don't know if the mailing list is working as my message still
> isn't showing up in the archives and I've not received any messages
> from the list since I joined.  But I figured out my problem and that
> is I needed to set net.netfilter.nf_conntrack_helper =3D 1 vial sysctl.=


Don't do that. manually assign helpers to the traffic.
https://home.regit.org/netfilter-en/secure-use-of-helpers/

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--oWJOUcU3L85O1Tx4xSc0H3VT9bnalfKoh--

--pJGVqQH8SSJnRrNr36HjU9wFkAi0VK4J6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYEPPYFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYxEsP/3wuCOCRlffuFcl1xn/0nus8zVXMMoM9sYIHr1F8aD1NC8jl3oK9iCKs
HMiNuVaGNg2JWRBikvtxpCX8r8WVpQv2yGgsCI3BTE9USPKYwxH50lSt2iuajned
pNhgLpxei6qq6PK4dEjitELINbSNj67g2ZFhvIES+ugicmwTBC8ZFPjXKgu5wc4a
MOSy3Yboz2loEoXswnETKpn8qxDlaxd6sYNNZU9YtRtovls0is/kfi22WE93GMIq
WxfqJ6QNG8gPJrj6yT8PCBrBP8fIZ1yWwhk90V4UlCqmxIc3HQDGULQflflfiTGG
kOfhbAfPBHf+IBgtQusByQ7UMcMqPNKWWzp9zFNeEd2cA7fmE4OjTvIpAAw99uHh
yPHHDePyRYCAMI3SMng/fQBWzU2UD6pS9KcKoOzSr0bH6BLiVVIvVRe9gFIkvii+
QMIn01cqnagzflJT72lSI4txsuEZjNhgBmQ67ZGLcyF67ISewyd7kzVWKx4wexXR
UEPGVfme/YzA/9qScWT1K9JaLgezYN1eLbKBaGrFDjLDmNpHft+l9pIazzE7/7SK
+uHbG8af6r4xaiFTZaId/mZFAFlakVGOxj44OfHvQhy8Y+JR2D4EKcn9vQQu7Kko
qQ1V0vI/7JlyNSDT10u36yKH/YL8uIFa6BjcL+kE2c4FO/UIvORY
=3KXZ
-----END PGP SIGNATURE-----

--pJGVqQH8SSJnRrNr36HjU9wFkAi0VK4J6--
