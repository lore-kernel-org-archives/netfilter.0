From: Eugene Crosser <crosser@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Mon, 23 Aug 2021 15:31:42 +0200
Message-ID: <ed802f99-a946-8f9c-2918-dbf989617d3f@average.org>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc>
 <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
 <20210819141802.GU607@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XtUssyJhJd5gvqc3d3s6WkXZMo6gOoygk"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1629725511; bh=pO7X5b3rUeyg0JiSaEW6YUIgbRTCBABxmgM1m9Ko09M=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=ES6BUgEVd+YgCBzxDb5xCV6uJFUxmPgQB60sunNS0uhy1J4wm10QHAELdFGkCFnTp
         Yx0UaAgq7xQDHzwOYJNAgMMwJ9GslggMTbkGrh3lAndP94D8mXUTnB3+Oo0WmCb8PT
         63eRHvwZjFeZw3m9UIit3i/31CvMMAtLD5OEiaUE=
In-Reply-To: <20210819141802.GU607@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XtUssyJhJd5gvqc3d3s6WkXZMo6gOoygk
Content-Type: multipart/mixed; boundary="oJFrH6hrBE5wVrLTFq0jTpj7rctB2E8rU";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Message-ID: <ed802f99-a946-8f9c-2918-dbf989617d3f@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc>
 <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
 <20210819141802.GU607@breakpoint.cc>
In-Reply-To: <20210819141802.GU607@breakpoint.cc>

--oJFrH6hrBE5wVrLTFq0jTpj7rctB2E8rU
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19/08/2021 16:18, Florian Westphal wrote:
> Eugene Crosser <crosser@average.org> wrote:
=2E..
>>>> Yet I am surprised that a flag meaning "conntrack, but only to confi=
rm exiting
>>>> entries" does not exist. Would not it be useful to have?..
>>>
>>> How would that even work?
>>>
>>> To know if a given packet is a reply there needs to be a record in th=
e
>>> state table.
>>
>> I was guessing this piece of code
>>
>> =3D=3D=3D=3D=3D
>>         /* look for tuple match */
>>         zone =3D nf_ct_zone_tmpl(tmpl, skb, &tmp);
>>         hash =3D hash_conntrack_raw(&tuple, state->net);
>>         h =3D __nf_conntrack_find_get(state->net, zone, &tuple, hash);=

>>         if (!h) {
>>                 h =3D init_conntrack(state->net, tmpl, &tuple,
>>                                    skb, dataoff, hash);
>>                 if (!h)
>>                         return 0;
>>                 if (IS_ERR(h))
>>                         return PTR_ERR(h);
>>         }
>>         ct =3D nf_ct_tuplehash_to_ctrack(h);
>> =3D=3D=3D=3D=3D
>>
>> could _not_ call `init_conntrack()` depending on the (hypothetical) "t=
rack only
>> when entry exists" flag, and return early otherwise?.. But my understa=
nding of
>> the workings of netfilter is really poor, it is very likely that I am =
missing
>> something crucial.
>=20
> I don't see how it can work, something does need to create entries, els=
e
> __nf_conntrack_find_get() never finds an entry, so init_conntrack() is
> never called, so table is always empty.

I was (probably incorrectly?) assuming that __nf_conntrack_find_get() loo=
ks up
in the "main" table, so there will be entries created by previous packets=
 that
went "in the opposite direction" and did not have the "track only when en=
try
exists" flag. In my case, packets that have traversed the OUTPUT chain.

By the way, another way to implement such feature would be a settable fla=
g in
the skb "do not commit to the main conntrack table"?..

I need to check how "fib daddr type local" will work in the presence of V=
RFs
that may be forwarding the same addresses that in the default VRF are goi=
ng to
INPUT. Basing decision on the input interface is kind of undesirable for =
us,
because there are so many, and some may be named differently on different=
 hardware.

>> While I am here, may I ask: is there a "correct" way to re-enable conn=
track that
>> was disabled in someone else's chain that happened to run before mine?=

>=20
> You mean, 'cancelling' earlier NOTRACK rule? I'm not aware of such a
> feature.

That's what I thought. That means that different entities that need to co=
ntrol
`notrack` cannot pile up "exceptions on top of exceptions" and have to co=
operate
very stringently. If I want to have a chain that ends with unconditional
catch-all "notrack", then everyone who needs to enable tracking for a spe=
cific
class of traffic must have rules in the same chain. But we can work with =
that.

Eugene


--oJFrH6hrBE5wVrLTFq0jTpj7rctB2E8rU--

--XtUssyJhJd5gvqc3d3s6WkXZMo6gOoygk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmEjoz4ACgkQfKQHw5Gd
RYwMTAf/cOlHIqEGk0f+Ohz4l/pi0q+MaLQnWLeNp4DqDN7syiXA/JnItNLEUje9
n4xTl+xPsjPFxppR8uY8zoY6svLjxRZMmzNh3qjLhfXymZ2IuB5VzpBlYzHtVYpV
UQevlv9rULDsALEYSDm6lAohmLr2HKyPb0r9ESPrFr/6wKGuOWBJyj/oImyT0Ks6
bxR8NMurc2vhzrFaO/OWI8xhdDyYdxLeNiikHk+ui+L0A6qn1TSkDTmGQ/AF/T2i
3VdzdWSEdkW/HmiwfRcmoXYgPfXAvrTuRF4X5tIwIYne5IF5ENLHDAm68VTueonj
iCcxGAwgT1U6aj9sPZ/tGfIAgNvn3g==
=5815
-----END PGP SIGNATURE-----

--XtUssyJhJd5gvqc3d3s6WkXZMo6gOoygk--
