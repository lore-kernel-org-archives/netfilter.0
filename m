From: Eugene Crosser <crosser@average.org>
Subject: Named sets/maps and atomic reload of the ruleset
Date: Wed, 9 Feb 2022 22:50:44 +0100
Message-ID: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H0JBU8hYE2MpuSRUQR9Vht0H"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1644443452; bh=KXCchqirTnMfnjdtVqFIDJVKFUJqCTYBHy4rOHc+UNw=;
        h=Date:To:From:Subject:From;
        b=f1B7l8/3DrfZQLmKy2YZIpp0apo3yePkaYW9gMMf1p/IS0lBJmR7e6nOjp13rkSOV
         hjz3TpI8jxM+eTMVTAKwu5k5HlMMBaNn6KuoZoIPJjYgKsbgudc8q1W3yHHD2nC+EP
         wtiIk7bb2XyKFmz9RtR4DWF8ZX40cEhag6IqMlGs=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------H0JBU8hYE2MpuSRUQR9Vht0H
Content-Type: multipart/mixed; boundary="------------X2qxQ1RfNDVau31WSMmSB08V";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: netfilter@vger.kernel.org
Message-ID: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
Subject: Named sets/maps and atomic reload of the ruleset

--------------X2qxQ1RfNDVau31WSMmSB08V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello all,

Both the ability to flush the ruleset and replace it with the new one
atomically, without leaving an unprotected window, and the existence of n=
amed
sets and maps, that can be updated dynamically when e.g. interfaces or ro=
utes
are added and removed, are awesome features of nftables.

The problem is, though, how to make these two features play nice with one=

another. One use case that I have in mind is to replace the collection of=
 rules
in chains with a new improved version, while keeping (or dumping and late=
r
restoring) the contents of named maps and sets. Saving the data from maps=
 and
sets with a separate command before reload of the ruleset, and repopulati=
ng
after leaves a window during which dynamic updates may be lost, and a win=
dow
during which the set operates with unpopulated maps/sets.

What would be the recommended way to solve this problem?

Thanks,

Eugene

--------------X2qxQ1RfNDVau31WSMmSB08V--

--------------H0JBU8hYE2MpuSRUQR9Vht0H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmIENzQACgkQfKQHw5Gd
RYxggwgAyNukc4vW1OK5RBK9JWjrdC4YnFlrmdtIqRVSPyOMebz1ZMnqpsX4x4sD
kAb/TL6qpGxJcYqX1pUMhSxevAloRbpzWBNYakk3PkLWu1Q9h+bFpOxhotK1Il+t
C7gFspVQP7Kb6E+iQGOIUR2JQx5ys6ouj7Jr5OCL0wclHC2JQcSuhNVBEjOAtWWS
w7D8zszGyh7nqcBRnnD3YYj2u6XbtyxmgIiBtlVVLC1RgTyZkfn5eZ5EL68oTWLl
jpPtpi9msfHlFGhylrFWSY3Z759L663hDSC83teyAksUiyB0uFev9eVIVUOKtAN/
auXQdgh1Yin/4mkZ3oH3knGMxYnpTQ==
=jxJC
-----END PGP SIGNATURE-----

--------------H0JBU8hYE2MpuSRUQR9Vht0H--
