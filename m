From: Paul Evans <paul@mxtelecom.com>
Subject: Re: "new not syn" packets.. false positive?
Date: Thu, 4 Jun 2009 13:36:24 +0100
Message-ID: <20090604133624.752ae9ae@nacelle.mxtelecom.com>
References: <200906032319.36957.support@bluenorthernsoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/IU86+BYE2LYxLqkUfxQNoTd"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200906032319.36957.support@bluenorthernsoftware.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Technical Support <support@bluenorthernsoftware.com>
Cc: netfilter@vger.kernel.org

--Sig_/IU86+BYE2LYxLqkUfxQNoTd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

'not syn' packets are any TCP packets that don't contain the SYN flag.

"NEW" packets are ones for which conntrack cannot find an existing
entry in the conntrack table.

Asymmetric routing, routing changes, timeouts, evictions from the table
caused by large amounts of traffic.. All of these could be reasons why
an entry doesn't exist in the table for a non-SYN packet.

--=20
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com

--Sig_/IU86+BYE2LYxLqkUfxQNoTd
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkonv8gACgkQcGehlx3Gqx49NwCeLGZR/R7TeIMxcybXavq1lbiO
pDkAn06Q2v2mrBfi4EHdsXKlLuKHma+y
=kwgI
-----END PGP SIGNATURE-----

--Sig_/IU86+BYE2LYxLqkUfxQNoTd--
