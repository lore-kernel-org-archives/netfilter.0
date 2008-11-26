From: Paul Evans <paul@mxtelecom.com>
Subject: Re: Allow client only 1 connect per 20 seconds
Date: Wed, 26 Nov 2008 10:55:46 +0000
Message-ID: <20081126105546.5d1591b1@nacelle.mxtelecom.com>
References: <gghgq9$33t$1@ger.gmane.org>
	<gghm16$qal$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lcseHz+lOp+sfUJf4c6og86";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gghm16$qal$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org

--Sig_/lcseHz+lOp+sfUJf4c6og86
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2008 21:07:13 +0100
"Adem" <for-gmane@alicewho.com> wrote:

> It works only if "-p tcp" is specified.
> Isn't that a bug in iptables?

Port numbers only make sense in some higher-level protocols built on
top of IP, such as TCP and UDP. What would the "port number" be of an
ICMP packet, or an AH or ESP IPsec header, or any of these other
ideas..?

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/lcseHz+lOp+sfUJf4c6og86
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkktKzIACgkQcGehlx3Gqx4awwCgun0mzl7cdCDBv/spH5Xl0LPO
nGIAmgPWfFTNHgHmujRZzEoteZnYqugI
=HXgC
-----END PGP SIGNATURE-----

--Sig_/lcseHz+lOp+sfUJf4c6og86--
