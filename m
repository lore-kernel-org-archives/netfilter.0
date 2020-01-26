From: Robert Sander <r.sander@heinlein-support.de>
Subject: Re: nft icmp type all?
Date: Sun, 26 Jan 2020 18:30:18 +0100
Message-ID: <a0d11d7f-31d4-9701-a160-06f3e15fd06a@heinlein-support.de>
References: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
 <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="4JKEYaTdiJBnTnJVQAsHQ73fq152nTzFF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: kfm@plushkava.net, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4JKEYaTdiJBnTnJVQAsHQ73fq152nTzFF
Content-Type: multipart/mixed; boundary="SLYyf8pehnZk2rG81L7G5CVdyIqH3HbHi"

--SLYyf8pehnZk2rG81L7G5CVdyIqH3HbHi
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 24.01.20 um 22:29 schrieb kfm@plushkava.net:
> On 24/01/2020 21:16, Robert Sander wrote:
>> Hi,
>>
>> how do I specify a rule to match all ICMP packages?
>>
>> nft add rule ip filter input icmp accept
>>
>> does not work.
>=20
> nft add rule ip filter input meta l4proto icmp accept
>=20

So it's basically like

iptables -p icmp -m icmp --icmp-type xyz

         ^       ^
         |       +- icmp type xyz
         +- meta l4proto icmp

Thanks.
--=20
Robert Sander
Heinlein Support GmbH
Linux: Akademie - Support - Hosting
http://www.heinlein-support.de

Tel: 030-405051-43
Fax: 030-405051-19

Zwangsangaben lt. =C2=A735a GmbHG:
HRB 93818 B / Amtsgericht Berlin-Charlottenburg,
Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein  -- Sitz: Berlin


--SLYyf8pehnZk2rG81L7G5CVdyIqH3HbHi--

--4JKEYaTdiJBnTnJVQAsHQ73fq152nTzFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAl4tzK8ACgkQ8LuRWCPe
WyjvcxAAiwbxzk+Ltph3wtPRbVm32Eh1JnZIUzRvta31OMuzB8thvRf0mK2aFQEU
G7PK+CUO6lTsb35l5+OQ9o1l2PidN6EPLg8B88Gl1ubjIo4Q3Sq4sAC0l/m/A9JC
n6XduLIpVf0pgN8BpZev6rS4NpXn4bcsWKMVkbsVtq9KOugZ7hQtQtFo02xm/cwA
c+4p3qLXI5z7djUc0kexkSrFtMZEDhKbL0F1LoPuysqTyUoU44G2LvJ/RcDtA+ET
jNc/cpRJD9z8YwyXlSyK0AqV8IvPIHCJnpcUYezy+Wo5B4MZKW1kiqQJ3UmcFqzW
7NbbKcTl0sCHfB3KFQ28Qtu6/fLrG76LaALsV4wGeZqbxhxMpz9scEe8dCvwXj6G
SAyH/weU6LKK/ITxzAaJVDK7tAiakNy1azEDSdplmf14tbLxOUJPjZGzbMut1yuH
yWbwm2CFAiFNKXtKGk8aLG2+rxLG5KBpf/NmOuLK/hJsmSfa5jmlUZMWfIeasyl+
uJUB066Wqr3IYE6snN5fZ6tJuvrcrW1u6EMtxnfDvRcKGo3Yk9pnR1SGb1UVFct3
xbxbBTFO3s0mJlxkvij1YVwYz+9PpbqAFtEcWCQB4MWcbff1CAcoBMO+cQJqmoGh
QoQ8v/P5JaafvwdzJEY2AIov6E1TK+fVTQ3Ns1PLMRNIpWbNads=
=pUkb
-----END PGP SIGNATURE-----

--4JKEYaTdiJBnTnJVQAsHQ73fq152nTzFF--
