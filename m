From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 13:33:23 +0200
Message-ID: <54538071-a4d6-7f52-7cf6-74fc18872224@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <87k2d6ro6d.fsf@ilexius.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lSuBeN3P1XTClkjMRCbNPT5Bd6cHH0dWF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87k2d6ro6d.fsf@ilexius.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Thomas Bach <t.bach@ilexius.de>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lSuBeN3P1XTClkjMRCbNPT5Bd6cHH0dWF
Content-Type: multipart/mixed; boundary="Sss82WVIiTcfWIPEAbbBT7LRp740DETgo";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Thomas Bach <t.bach@ilexius.de>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Message-ID: <54538071-a4d6-7f52-7cf6-74fc18872224@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <87k2d6ro6d.fsf@ilexius.de>
In-Reply-To: <87k2d6ro6d.fsf@ilexius.de>

--Sss82WVIiTcfWIPEAbbBT7LRp740DETgo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.10.2016 11:39, Thomas Bach wrote:
> Hi there,
>=20
> Pablo Neira Ayuso <pablo@netfilter.org> writes:
>=20
>> > On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
>>> >> Hi,
>>> >>=20
>>> >> I have two hosts with public ip addresses running Ubuntu 16.04 wit=
h
>>> >> Kernel version 4.4.0.
>>> >>=20
>>> >> I want to interconnect two containers (systemd-nspawn) with veth
>>> >> interfaces running on these hosts in a server client setup.
>>> >>
>>> >> [=E2=80=A6]
>>> >>=20
>>> >> This works as expected and without any problems at all. Now IPSec
>>> >> enters the picture. As soon as I setup a policy to encrypt everyti=
ng
>>> >> between the two hosts the following happens:
>>> >> + I can still connect from the second host to the server in the
>>> >>   container without problems,
>>> >> + I can still /connect/ (i.e. establish a connection) from the
>>> >>   container on the second host to the server on the first host, bu=
t
>>> >> + in tcpdump listening on the interface of the container (on the
>>> >>   second host) I see lots of TCP Retransmissions and the TCP conne=
ction
>>> >>   is effectively broken.
>>> >>=20
>>> >> Can someone give me a hint what is going on here?
>> >
>> > Did you find the root cause for this problem?
> Actually not. I worked around the issue by switching from the
> "ipsec-tools" package (i.e. static rules and keying done by hand) to
> strongswan. Now the whole setup works as intended with the rules being
> more or less the ones cited in my original post.
>=20
> It would be nice to know what the differences are on the package level
> between strongswan configured ipsec and the ones configured via
> ipsec-tools.

You'll have to figure that out by yourself, I don't know what racoon conf=
igures.
If racoon actually uses XFRM, the differences should only be the configur=
ation
of the SAs.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--Sss82WVIiTcfWIPEAbbBT7LRp740DETgo--

--lSuBeN3P1XTClkjMRCbNPT5Bd6cHH0dWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBgiFFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYInYP+gPftzrom3OZfWc8oGq9Zn05QnvNLKeGngtze4ecRKk1ecWofDAZ/VKD
aTz7h1XwKKsFbfk00FrTfh5EAaquPV4IfSW11CYC2nToe4FhSg7KaQBpWU3Al7lr
R8r5o/Fn2kG5NERMXk80Ctmz9dEe5k3BpKiDWlw9GAUA2I1V4U5dpy2TssAgjRrG
2gJwfVgboRgWx1/RrVIxQ0quDFu4tix9b/couQ/XHanVThUcCWbcJhfGnKFW9stq
aiiOvQtSLDXHFqfHCfooDOpyvr5xYbQ0/w75d6BKGKqIHbyqQJo3aOMAbEHe/ZcK
7X1nb3yWGHQR/8/rFZnp9hT4povUS/Op0MMrRufJSLqp27etkHadDfuBDqhBpOn+
n+CK0Jbbo+6V703opgox50ztPZF1Y7IvvwRADI7s6xfvNPHPk37iXBcO1h8iazY3
wMjfOjs1K51mv3D1gVEuCCliNOUeZciNMnxBbvOooCK3CXrN3ySzoJi8gGzoroq4
k2Fcns1gYdksSps0ux86NKKofjXWj5k/vqK3+wk7EJkNo6GwBfVT8qL5deT1HzrZ
QZG/0HvbkbdSwzAjC4AxjuDE+/J8koseKFkfW7DexowTQTEmC5sLX69OzPHoLJjU
Nhjuq8rG0n+ru1+Cjc3979Nh6Xhx6uzkqxevvQ9x9rvqBqmAAGyz
=KrBX
-----END PGP SIGNATURE-----

--lSuBeN3P1XTClkjMRCbNPT5Bd6cHH0dWF--
