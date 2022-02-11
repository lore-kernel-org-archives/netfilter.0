From: Eugene Crosser <crosser@average.org>
Subject: Re: Named sets/maps and atomic reload of the ruleset
Date: Fri, 11 Feb 2022 09:41:15 +0100
Message-ID: <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>
References: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
 <YgWcQrSbXh/rKfYJ@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0VvtKCXfHJNrcqQjnk1XybOg"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1644568883; bh=N3zpfcK4FObyhT3kx2rbwpIuIcq7hew6iO312fsuEc8=;
        h=Date:To:References:From:Cc:Subject:In-Reply-To:From;
        b=DLZzHTZeYlOj/ZZFux4ntyuB60UDw397/Z9EivfeagI8XeEDVjpphEQIhx2oBCtMP
         8LXms4MTprHt+MqHeBsjAVbcWDP9YOiTwSn2ATiFK7ErubL67irWeJbtqczHMt0TJs
         +faauyXoasTWItMxqo26/Fw2D2pbojxG01THl5yk=
Content-Language: en-US
In-Reply-To: <YgWcQrSbXh/rKfYJ@salvia>
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0VvtKCXfHJNrcqQjnk1XybOg
Content-Type: multipart/mixed; boundary="------------epdp3OJeJMxCtJnbROXNBFGt";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Message-ID: <0841290b-07e8-df8d-12ea-b4de414e795c@average.org>
Subject: Re: Named sets/maps and atomic reload of the ruleset
References: <63da5cd7-9afe-431f-e3b9-f1c62c96f652@average.org>
 <YgWcQrSbXh/rKfYJ@salvia>
In-Reply-To: <YgWcQrSbXh/rKfYJ@salvia>

--------------epdp3OJeJMxCtJnbROXNBFGt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2022 00:14, Pablo Neira Ayuso wrote:

>> Both the ability to flush the ruleset and replace it with the new one
>> atomically, without leaving an unprotected window, and the existence o=
f named
>> sets and maps, that can be updated dynamically when e.g. interfaces or=
 routes
>> are added and removed, are awesome features of nftables.
>>
>> The problem is, though, how to make these two features play nice with =
one
>> another. One use case that I have in mind is to replace the collection=
 of rules
>> in chains with a new improved version, while keeping (or dumping and l=
ater
>> restoring) the contents of named maps and sets.
>=20
> So you would like to replace one chain and its rules by a new chain
> also containing new rules...

More like, potentially multiple chains changed / added / removed, but the=
 new
chains continue to reference the same maps and sets (precisely because I =
want to
preserve dynamically accumulated state).

>> Saving the data from maps and sets with a separate command before
>> reload of the ruleset, and repopulating after leaves a window during
>> which dynamic updates may be lost, and a window during which the set
>> operates with unpopulated maps/sets.
>=20
> ... and you would like that sets/maps remain in the kernel while this
> chain replacement operation happens.

yes, either that, or dumped "somewhere" and loaded back after reload, all=
 in the
same transaction.

>> What would be the recommended way to solve this problem?
>=20
> If what I describe above is accurate, then you could run a batch like t=
his:
>=20
> # nft -f update.nft
> flush chain x y
> chain x y {
>         ... # new rules here
> }

Yes, actually this should work! I can dump the ruleset, find all chains, =
and
construct a batch that flushes them all, and then loads the new configura=
tion on
top of remaining maps and sets. I little complicated, but should work.

What potentially could help for such use case is a command like

	flush chain * * *

i.e. flush all chains in the ruleset, but keep other named objects. I cou=
ld put
it in /etc/nftables.conf instead of `flush ruleset` and stop worrying :)

Thanks for the hint!

Eugene

--------------epdp3OJeJMxCtJnbROXNBFGt--

--------------0VvtKCXfHJNrcqQjnk1XybOg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmIGISsACgkQfKQHw5Gd
RYzitQf/aBwzxUFqOjRLFLRKNrTTNgnAciy8ADnzgCmCKctEuH5nmvFBy1pAtoAg
kY3mgo+P0EwfqnrjZCQXBFENGgSU2XDQgH8SjcVam+lHF2shWDTFWdT2TWzJxWqU
GkYTEfHKevzayD+fF1mc+QxT666aG6/C0DStAcIvBX7dxtz4Gvx4rpYo96cr7rKo
FTZcAhxxpuXaYnKzLFTuVOZaj2OPrluMF3MJyubBuR0WipvFVgNNiqc3mWsPzPpR
5iq/Nry7UXvwsl10wbMz/d6SmYd3tPNJRfuLq/asP+mrYySmcH+N8iKOugav/v3i
uNsJQVjfXiE2gVDU+1ggrfrkMQYF2Q==
=8WJf
-----END PGP SIGNATURE-----

--------------0VvtKCXfHJNrcqQjnk1XybOg--
