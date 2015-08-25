From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: ip6tables reject targets
Date: Wed, 26 Aug 2015 07:31:47 +1000
Message-ID: <1440538307.28787.18.camel@lusan.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eGaf7lBz6Dx4ps9/TTGI"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


--=-eGaf7lBz6Dx4ps9/TTGI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have been doing some more IPv6 related work of late. I attempted to
use "--reject-with" on an ip6tables REJECT - it failed. When I ran
"ip6tables -L" to see what was in there the REJECT target had
automatically added the equivalent of IPv4=20
"REJECT --reject-with icmp-port-unreachable".

Does anyone know what valid options there are for the ip6tables reject
target?

--=20
Nikolai Lusan <nikolai@lusan.id.au>
--=-eGaf7lBz6Dx4ps9/TTGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJV3N7DAAoJEJOjmtAqHQSLDHcP/Rk+6Q3uuUs6OGRBufE5MJ6g
AK+4Q6Wo2r7IKVxshmjbsP7mfgINIHfwBRCSt6xQRUkDsbBd2da9g4YtMx4M94MT
anqzFss2yYwDrrvkV4NEPSbEnb2WoNL/naRwu+CpUfCwV95839gi+DdupGH8lxdu
CAv4SiVtsh5IdHGTL+4+TZBwLK1JJ/S4er7lAGBzomaXf8UeT4K1KoCLOOy/sYWP
CeCaYPBbZSx0YHvpoe+V/JIbHQsyYwe0dMkHz8cGPBrw+anbBulCIRN6/cBXWrN9
qXd0mPdhwlJ/gNW0AX8jRJhfHR2vyJX2IzTHoXv0NNI5ebhq5At/kg0nZfE+xye5
ZhePyeE38ULMQjzve1z+JkGsdwF0MlOyDku+pZidYKB4nLB2R7t6MJ1fejH/hbdO
ZqO5XdbJ5TOJm26mmRtv/h1pjdCt3e5AIHhGQAMA/z8y/76qOlB6P6h5KbgaE30e
k60ILcRdnOQ4oXp1h+77pIo76H1BpfGiNeiFt61/2aiOl2/M14yLCNaXKWci0cya
gUawSJtoujRkGHPVOLmqHSBYjCzmi0tkwBYHix1ptqPcna7XiEYpRQiRmDq214Kx
HVWtX8LrwSTPPvWccNtve2AwDeddbKy3ZegN4tEDBDSpSxa3/vtbPj5xFXAerjZk
xd2DQOZ/KkB+2bVbOBJQ
=IJsA
-----END PGP SIGNATURE-----

--=-eGaf7lBz6Dx4ps9/TTGI--

