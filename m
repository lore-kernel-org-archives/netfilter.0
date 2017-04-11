From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Help/guidance with automatic CT helper assignment
Date: Tue, 11 Apr 2017 12:31:13 +0200
Message-ID: <0f597416-2d74-d98b-f969-f21391797b6a@familie-kuntze.de>
References: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QHpv71sGhPVMWn49cxRGqxWBj5nEQoobs"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mauro Santos <registo.mailling@gmail.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QHpv71sGhPVMWn49cxRGqxWBj5nEQoobs
Content-Type: multipart/mixed; boundary="siK95GUNBlTOO2etfO9uvu1o6Ufr864FR";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Mauro Santos <registo.mailling@gmail.com>, netfilter@vger.kernel.org
Message-ID: <0f597416-2d74-d98b-f969-f21391797b6a@familie-kuntze.de>
Subject: Re: Help/guidance with automatic CT helper assignment
References: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>
In-Reply-To: <4be4e306-a7e4-4aa9-feae-ec00de07b463@gmail.com>

--siK95GUNBlTOO2etfO9uvu1o6Ufr864FR
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hello Mauro,

On 10.04.2017 23:22, Mauro Santos wrote:
> Hello,
>=20
> I'm running linux 4.10.8 and I am aware that automatic connection
> tracker loading has been disabled by default for security reasons.
>=20
s/loading/assignment/

>=20
> What I would like some help/guidance with is finding out what is causin=
g
> this, that is, finding out which program would cause an automatic helpe=
r
> to be loaded if automatic loading was enabled.
>=20
Receiving of packets of protocols (or ports) for which helpers exist, but=
 aren't assigned.

> I have currently setup two helpers, one for ftp and one for pptp (which=

> pulls the gre helper if I'm not mistaken). These two helpers have been
> added with:
> iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
> iptables -t raw -A OUTPUT -p tcp --dport 1723 -j CT --helper pptp
=20

> I have tried monitoring incoming and outgoing connections with source
> and destination ports that the other helpers should work with (I've
> taken the list from here http://www.shorewall.net/Helpers.html) but the=

> timestamps of the messages (ports log and nf_conntrack message) are too=

> far for me to believe I'm catching what is causing this.

The helpers and what packets are not handled are obviously not the same!
The two groups also do not intersect! Receiving a GRE packet can cause th=
is message, too!

>=20
> Short of logging everything in bulk, is there anything else I can try t=
o
> catch the culprit? I'd like to avoid logging in bulk because I have not=

> found a way to trigger this on demand and sometimes I see the
> nf_conntrack message several hours after boot, which would make for hug=
e
> logs with normal machine usage (youtube, video calls, etc).

The list of conntrack helpers is limited. You don't need to log everythin=
g.
See this[1] blog article.

[1] https://home.regit.org/netfilter-en/secure-use-of-helpers/


--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--siK95GUNBlTOO2etfO9uvu1o6Ufr864FR--

--QHpv71sGhPVMWn49cxRGqxWBj5nEQoobs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAljssHIXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZli7zA//e3vLMON0CFMuZ5tIOIlhOt1A
e685wXlBnEblet7YRFYd6wKoCCXixwKAh+gYYiinh1eqSXl7cIX4YyZ4EtmZmV8L
SlFeSCurQ25YPF+UUUAs955oOdRiPhsfGl39zAOLYyTvtx+LlifcF2WvP6B/pjhy
T3/xIOYTe+ArO5A6v2VyHiuNBzEO2ZLAIZCfBuJm8ZUuPd6tFtK2gItN+zpP6j2A
bc77bsFLqBaSSchEdztvp/nTtcE1cD/sl9oHpYEmf4zf6AloxonQ4naUEpUMXwQG
NMdohK3ao54Zda+OcjsQ7Se7/76+7uB8zUdArh/xgZgCbtHMI5R4sAEUY0ja8CkH
1X6h9MEq6mrZo0/JMwnFXEAVlIKVLKj6zFc/STx/blBNe0VpGnt8qGeRzNMGvHDg
Jx4BpwDbgJit3lxjOrmKYxCGnj2NO1XVzL+yF4msSCO/B2mAnBLm90RqGBpwTBWM
jyNialXmEXuC/QwPeXaSlS9KJZW4+fGrvS1g0/exa1GFFaZPFmkaaAESZKBsLy90
TmExYOE+5WSkNfHbXlAvGEN0Iyv9VZVyRXNuaV0aakb9xuWR+SnPyyqxjeSLgk2K
OIal3vtoP+GH4FaKCdC3SK417XhqBeUFqT4BGhd7badoMgaD0jemGdTaaYvOnyYD
xjpsnVJZUvuDiY/DoYg=
=evK3
-----END PGP SIGNATURE-----

--QHpv71sGhPVMWn49cxRGqxWBj5nEQoobs--
