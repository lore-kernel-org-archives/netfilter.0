From: Miroslav Rovis <miro.rovis@croatiafidelis.hr>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Sat, 26 Mar 2016 06:06:15 +0100
Message-ID: <20160326050615.GA21364@g0n>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Johannes Ernst <johannes.ernst@gmail.com>


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


The text in my previous mail
(
http://permalink.gmane.org/gmane.comp.security.firewalls.netfilter.general/48565
)

about the typo in Nftables Archlinux Wiki should have read (notice the
dport, twice):

https://wiki.archlinux.org/index.php/Nftables#Practical_examples

Different rules for different interfaces

is:

    tcp port http accept
    tcp port https accept

but there ought to be:

    tcp dport http accept
    tcp dport https accept

And then only the example works, as I showed in my Gentoo Forums topic:

A Firewalled Internet Access to Internal Subnet
https://forums.gentoo.org/viewtopic-t-1041028.html#7897320

as Neal P. Murphy pointed out to me in private email. Thanks, and sorry.

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW9hjHAAoJEOqYhIhPuvCu9XoP/0EIOVYNGrWqILJmy4HhoqEn
hj1x/0mcGgjGLnqP8R97k27yFhUrjlxucF58jR7yWjVHm2xcdUJzBojkp8ZpsWLR
sKM1+Q6aAV09CJWbvKQuOZHWexUq9AcO8zOqrz64wXNdeUonf7d+Z/w6PMWFTA7x
DRk3fq+5ABLbZnqLfgC2yBbFEXCerja0IYlgGwG7NTd56hO8ICbG60Fh2MMb/xH1
7wOJhXyjaXz4gl1ZEbq8dY2r1mRwn97wnVH2Zbg12cay80xjb1hRf73P5abXWdCw
wYZ+vGC0mAlGcVYEanUmgzoQcn6gV3NgLdAm4aRUpwbrGzwIodnsvu6eDDRfdv1p
yQHhGbHNwP5FFYg8TqOaVax6WR0c16SApKrmwy7xHSs1SimHyXGopIipVnZfQOMs
XLOB5P06tD9M2KiPqgeVRDEWZjjUqXxJPD59sHG9VLUAdmO+TYfdmoKND9qNk2DY
ExPNWcLfa4TWrxRNrkJ9PSaPSoJgjvQkun4xIVVpN/8W2AXFGvmw27OKPf0FqDgP
5blrCft0536KUeIluZzgA+rELBCICUli4MRpqF2syWGnl/sx32Mw8rN6fyTuSQDL
/TA9auL2ikFMa8HULEiI7eTW6s+iLDelV9uPN0l6TtPPAZ1OG5TDu1AygprO4jEU
PrlqA7JdvN1SA/dHq1Ap
=KLHz
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
