From: Robert Sander <r.sander@heinlein-support.de>
Subject: Re: nft icmp type all?
Date: Sun, 26 Jan 2020 18:35:07 +0100
Message-ID: <01c0f25b-862b-cb00-3b5c-f8ac5852f37c@heinlein-support.de>
References: <a0fa4c0b-d8d8-752b-6926-753720a00796@heinlein-support.de>
 <ea408bc8-2171-d329-5606-62dbebbe428c@plushkava.net>
 <7f7b3f05-f0cf-1694-b61e-ab627fa4e176@street-artists.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9dMLcGVRBq4Nit57z46SxcFd1EEJhlsJo"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7f7b3f05-f0cf-1694-b61e-ab627fa4e176@street-artists.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9dMLcGVRBq4Nit57z46SxcFd1EEJhlsJo
Content-Type: multipart/mixed; boundary="pPRdNfeKOyuOhPZuHkFRMPBZQarRk6ymx"

--pPRdNfeKOyuOhPZuHkFRMPBZQarRk6ymx
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 26.01.20 um 03:24 schrieb Daniel Lakeland:

> I think this also works:
>=20
> nft add rule ip filter input ip protocol icmp accept

Ah thanks. I overread the "protocol" keyword on the wiki page.

So you have to add protocol before "icmp" if you do not want to specify
an icmp type (or tcp/udp port).

Is there any motivation for that?

Regards
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


--pPRdNfeKOyuOhPZuHkFRMPBZQarRk6ymx--

--9dMLcGVRBq4Nit57z46SxcFd1EEJhlsJo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAl4tzcsACgkQ8LuRWCPe
WygbpQ/+PxY5lc4OjQSh3i8y6hgdsb+2ADnqfzodeiUy8O4nsl3Ra6gQ7btwb5il
gXqSNVMIs+v1Gy1tdDc1pY94NM6aVWIJKh0BvwsMzviUa59XanNJwAfPP4UZ8Pf+
Nrf6z/8boUrIKDHMttGIpqp7gbUzL0bQEVALwd7fEwkiq1O/M4FSxgBTHq/6H2Pz
OHOHWza6MistBDQEPiZgpUDY96OZr8i6MiIEtFbgo+0umyEl1JmNlIwTxjKI6ya6
OXNaiOhFtFVAE+NbwDWpJHVgg7cjvyO/N6AqYj1rg9rwguNfyS5lg3WdcASYfb3W
ANPar558b3AeeNj5UWBtQ5YXFAV5lPZGloULzXfoyhqK6Lgtmxp2rxz850M626YH
oRK/UiO4dAWhCYzEXE7Ij8zmp7SvRBd4YH0H/gc58D0yfQHfFAn7wh0Ep39RK+/Z
joXw2zKCtRYCm5W8j8knyfQYOqxIy+uXu1f41Ly7QHeHEPpx6IGFaZBkRsrBdJsA
OnjIxtMIm20FxN7+BwzOzeUlB/Q+q4uooo+2nl4nS/SnWZWydEAzpl0Pd7PnR4wH
pJs64Ukp1rG8/OLxVAhTwWcIToiNomfF8FDyf6G0vZGkyJnV0K/GnZWgCpx8NAvL
6vCXeGzwiqXB/Baom1MMmrVl5fGLmqaTISSDrvj26wc8s9bkwfI=
=LJkS
-----END PGP SIGNATURE-----

--9dMLcGVRBq4Nit57z46SxcFd1EEJhlsJo--
