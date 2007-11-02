From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Use mangle to DROP/ACCEPT
Date: Fri, 02 Nov 2007 14:04:59 -0500
Message-ID: <1194030299.5142.35.camel@grateful.d.umn.edu>
References: <df1bdeb10711021154hf8db4baya3fa2861ef027e84@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RZvDPr/sKbcmHH0Q2lpv"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <df1bdeb10711021154hf8db4baya3fa2861ef027e84@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Srinivas Murthy <codevana@gmail.com>
Cc: netfilter@vger.kernel.org


--=-RZvDPr/sKbcmHH0Q2lpv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Fri, 2007-11-02 at 11:54 -0700, Srinivas Murthy wrote:
> Hi,
>  Is it ok to use the "mangle" table to insert rules that can
> DROP/ACCEPT pkts in the PREROUTE chain?

You could mark the packets in the mangle table and then DROP/ACCEPT
based on the markings in the filter table.

[...]

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-RZvDPr/sKbcmHH0Q2lpv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHK3TbU+eIf4TiLaIRAnWeAJ4sigwrwOsdzWg74uz0HIGxFDJXfwCg9Aq/
PRbVO6OyelOEXml4vFTXyXg=
=n+eh
-----END PGP SIGNATURE-----

--=-RZvDPr/sKbcmHH0Q2lpv--

