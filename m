From: =?iso-8859-1?q?Gr=E9goire_Leroy?= <gregoire.leroy@hyperthese.net>
Subject: Re: Fair queuing with htb
Date: Sat, 25 Dec 2010 21:40:00 +0100
Message-ID: <201012252140.06600.gregoire.leroy@hyperthese.net>
References: <201012230226.31297.gregoire.leroy@hyperthese.net> <201012250452.01340.gregoire.leroy@hyperthese.net> <4D15E3AC.5000909@treenet.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2406059.tk5P0myJoh";
  protocol="application/pgp-signature";
  micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D15E3AC.5000909@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Antoine Souques <corum@via.ecp.fr>, Andrew Beverley <andy@andybev.com>, Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org

--nextPart2406059.tk5P0myJoh
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> There are three ways to do that:
>=20
> 1) Delay_pools in Squid capping the Server bandwidth speeds based on any
> client info desired.
>=20

I noticed that Delay_pools permit us to balance rate according to user ip,=
=20
with a class 3 Delay_pool. However, it seems to be a simple limitation. I=20
don't want that the traffic is limited for one user, I want that each users=
=20
have a guaranted rate, and if the rate is not used, then he is equally=20
balanced between users who need the traffic. Exactly what cbq and htb do. I=
t=20
seems Delay_pools is not able to do this.

> 2) QoS between the clients and Squid using qos_flows. They mark traffic
> destined to the clients separated into flows based on the data source
> type; cache, sibling peer, parent peer, direct origin.

It seems it's exactly what I need. I have just tested it and it works. I wi=
ll=20
test it furthermore next week.

Thanks for your help.

Gr=E9goire Leroy



--nextPart2406059.tk5P0myJoh
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EABEIAAYFAk0WVqAACgkQB3Y8MwGKx1dVgwD+KfaeLybcXw8GObgasWMLgd8+
DxFZs6bP07eSupmqpiYA/3zRYNLOoCu6cgPcWorb3hnvJEe0MvV9v7KmPByhAacp
=HX1O
-----END PGP SIGNATURE-----

--nextPart2406059.tk5P0myJoh--
