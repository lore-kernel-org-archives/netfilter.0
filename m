From: Eugene Crosser <crosser@average.org>
Subject: Re: Named sets/maps and atomic reload of the ruleset
Date: Fri, 11 Feb 2022 09:52:25 +0100
Message-ID: <ecedf5b0-a4c2-8902-187a-3339b5f0f779@average.org>
References: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
 <YgWcQrSbXh/rKfYJ@salvia> <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0rJ0GMQjIrFmE0e3vjefTwUK"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1644569552; bh=o+AZIbwpC7WGEPTGrgZDXhOnxzEDN6YqmU3m87gjB+o=;
        h=Date:From:To:Cc:References:Subject:In-Reply-To:From;
        b=Zn/CpFDwNK8f0EVB1zM9x5r+02S0u8XZBIlvIx9xUr/8fifk0crSHN8nmyJNz28sm
         06blY61UWgpAtyOWwF1w5enZV+sS11fDThLB7gUQ4OhKgryPIzo3v3UPca/C2qCsP0
         M/8rrIAxSP0KcYnbJ8RlZ2yQ7uk1u6zHnaq/wRWY=
Content-Language: en-US
In-Reply-To: <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0rJ0GMQjIrFmE0e3vjefTwUK
Content-Type: multipart/mixed; boundary="------------aw1Tfx1Ydjdsc2ZVD9YvzUGD";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Message-ID: <ecedf5b0-a4c2-8902-187a-3339b5f0f779@average.org>
Subject: Re: Named sets/maps and atomic reload of the ruleset
References: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
 <YgWcQrSbXh/rKfYJ@salvia> <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>
In-Reply-To: <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>

--------------aw1Tfx1Ydjdsc2ZVD9YvzUGD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2022 09:41, Eugene Crosser wrote:

> More like, potentially multiple chains changed / added / removed, but t=
he new
> chains continue to reference the same maps and sets (precisely because =
I want to
> preserve dynamically accumulated state).

To make the use case more clear: _because_ I can use named sets and maps,=
 I can
get away with constant and small collection of rules, and keep all dynami=
c
configuration in named maps and sets. As opposed to iptables where rules
themselves have to be dynamically added and removed, making maintenance r=
ather
more difficult.

Eugene

--------------aw1Tfx1Ydjdsc2ZVD9YvzUGD--

--------------0rJ0GMQjIrFmE0e3vjefTwUK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmIGI8kACgkQfKQHw5Gd
RYysegf7BzUSTYv+9qn++Gu+3HzmzwUalM/t1OmV3rbein+fs7WJV8uWf165eGEG
55DxduWzWAaxaKZVJyLDaFvsNOdF/+/lOqdGfYLA8XNDp3X2m4/mQu5NemBBxYJw
9eO+xOfyR/27uvPT+LgLBLUFL3ki66+Ljxnj/aKwa+u/2eIvTwpBoreF+AhEmQib
QnLjaeVmxiH4Gkgal5IkLlus4nyB/DCoGfITtwUeKiwUh1OmDN5hhu97x7/nk+6B
qcn4si33VbMTANXutZfZU2nBtwoGwpkVuaWoC/Wo//Lk6LB9uHx6iW67wwWaLKuJ
I9lNaS4VCJ/BTJfKYA2ROxqNZsFmmA==
=m5pi
-----END PGP SIGNATURE-----

--------------0rJ0GMQjIrFmE0e3vjefTwUK--
