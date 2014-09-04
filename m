From: Dale Mellor <dale@rdmp.org>
Subject: How to stop kernel TCP responses on a port
Date: Thu, 04 Sep 2014 16:17:47 +0100
Message-ID: <1409843867.3026.9.camel@l3>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-icVPjVTHI0MB4kT4nrDM"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-icVPjVTHI0MB4kT4nrDM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  I want to do TCP with raw sockets.  How can I filter away the kernel's
RST/ACK/SYN response messages when I want to do this myself?


--=-icVPjVTHI0MB4kT4nrDM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABEKAAYFAlQIgpsACgkQykcf1QFhiknhmQCfV49eHSWaE+shI2ey0DT5jrYF
i7gAn3WNwRMbqRSfOfZMxksVi8zymdR/
=BK0b
-----END PGP SIGNATURE-----

--=-icVPjVTHI0MB4kT4nrDM--

