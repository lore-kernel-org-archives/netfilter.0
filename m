From: Eugene Crosser <crosser@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Wed, 18 Aug 2021 18:20:36 +0200
Message-ID: <3ebd9201-3cc2-7d8c-4313-2814250c6b01@average.org>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YU4QiPA9wZGy9gehOqStYx3qZ7htl5dKv"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1629303643; bh=pyz2qp+35vsJa0aAYV/XZJhLoGz1PxbfB/aRjLgOwok=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gN5orXUc2D5hrEmGcSNBr+FDkznW/5BESbZi7glEB9wJ5foH0WnWI+O9I6yHHmCFM
         bs9ydGUVgdIcRNRXU9pwKzXK/h8OmdwOgKByrgx0RVuebkCheGfFgq56CuDXH/4sx8
         df1UEMDJQArQ93wTLFsLG3ADH+b4Atz6KLNOKXxo=
In-Reply-To: <20210818161340.GR607@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YU4QiPA9wZGy9gehOqStYx3qZ7htl5dKv
Content-Type: multipart/mixed; boundary="rQALAXISQulpPqJUp1KYvty2fjiexlSRF";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Message-ID: <3ebd9201-3cc2-7d8c-4313-2814250c6b01@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
In-Reply-To: <20210818161340.GR607@breakpoint.cc>

--rQALAXISQulpPqJUp1KYvty2fjiexlSRF
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18/08/2021 18:13, Florian Westphal wrote:
> Eugene Crosser <crosser@average.org> wrote:
>> My use case is to set up a stateful firewall allowing any outgoing con=
nection
>> from a host, and restricting incoming, which obviously requires conntr=
acking.
>> The twist is that there exists a rather high probability of DoS-like i=
ncoming
>> traffic, that easily overflows conntrack table with unconfirmed entrie=
s, even
>> though their lifetime is very short.
>=20
> Create a rule that drops NEW packets in prerouting hook. For iptables,
> mangle will work (raw is too early).  For nftables, youl need to choose=

> a hook prioriy of -199 or higher (-198, ... to anything below 2**31).
>=20
> Such packets will create a new connection entry, but because packet get=
s
> dropped before confirmation the entry will not be committed to the tabl=
e.

Oh, cool trick!  I will try that, thank you very much!

Eugene


--rQALAXISQulpPqJUp1KYvty2fjiexlSRF--

--YU4QiPA9wZGy9gehOqStYx3qZ7htl5dKv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmEdM1QACgkQfKQHw5Gd
RYzcyAf/VtplbWavHNNviXqa5t4VhL9vVNba2j2rjIXzVQR85v4GQD2rb7G3pZ7u
NEI7o3G1aehZYIa0RnD8s0gyHDxoeJBQQzRHGbalnKMhO/s6S6WfGTwpIvDoJUTi
N5TodHnrt+INLn9hZ5K5oa2OFmjZVJDdKdukxSJL06K+SnLvpTGvZb9z6UZva/P4
mINqCfse9IYGajNUlcFG2U5ZtTl8qpik/ywGJr8cN3irmNc7Mc6YxFOzKmcdNf8o
v65JHEWTDypNWt0Ve3nD/gi8WpGKgdV6x2e9IEFzK+7kt2GzKn+Ccix+WMuz4AOy
HseOlGbJiO1MZWiYK//nublm1OIFtg==
=83SL
-----END PGP SIGNATURE-----

--YU4QiPA9wZGy9gehOqStYx3qZ7htl5dKv--
