From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Remote X not working through IPTABLES
Date: Mon, 26 Nov 2007 08:12:53 -0600
Message-ID: <1196086373.14710.1.camel@grateful.d.umn.edu>
References: <898d8f300711251138w9f36e7cgcf8ef0eb5d9c739f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-VpwOWMc62hq5rBlIwOtO"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <898d8f300711251138w9f36e7cgcf8ef0eb5d9c739f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: ash sids <toashwinisidhu@googlemail.com>
Cc: netfilter@vger.kernel.org


--=-VpwOWMc62hq5rBlIwOtO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Sun, 2007-11-25 at 11:38 -0800, ash sids wrote:
> HI
>=20
> I have a debian system (192.168.200.4), the firewall on that as is shown =
...
> I am trying to run xclock from  192.168.200.2 using putty and  XMING
> ...strangley enough with the following set up; xclock fails to start .
> As soon I change the policy on INPUT chain to ACCEPT , xclock starts work=
ing...
>=20
> Anybody would have any idea why this is happening...

Perhaps do some logging. I am thinking after the ACCEPT rule in the
INPUT chain, this would (of course) be before the DROP policy. Then you
could see what is being dropped.

>=20
> # iptables -L
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     0    --  192.168.200.2        anywhere
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     0    --  192.168.200.4        anywhere
> ACCEPT     0    --  anywhere             anywhere            state
> RELATED,ESTABLISHED

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-VpwOWMc62hq5rBlIwOtO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHStRlU+eIf4TiLaIRApF8AKDqdaPGm+qMr/SBIXHXhZlIM/QqywCfTK+A
jXaZSWbOOBtmHnaBxup3thA=
=kzqN
-----END PGP SIGNATURE-----

--=-VpwOWMc62hq5rBlIwOtO--

