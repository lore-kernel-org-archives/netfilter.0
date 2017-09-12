From: Louis Sautier <sautier.louis@gmail.com>
Subject: Re: nftables: difference between "meta l4proto tcp" and "ip protocol
 tcp"
Date: Tue, 12 Sep 2017 09:35:30 +0200
Message-ID: <936e7a0c-59e7-6a88-1ed4-f9227b906f4e@gmail.com>
References: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
 <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="r1UFv3xqu2E9JFhC6fsKMGcnfxPkiBDTf"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=Bjzaf2uEWWH95rdT1CsnxBhkYrIA0mGWyBjU+5MqwiQ=;
        b=ew58bnMRXfnLC/51pB/bMAeR3xR9YKurGL0Vs80+wTwJHLcS14XlV4t7cAXmOL4zFi
         52gFX9o9haFN4Ul7K/UViIiEjDAv+olaXG43LEhZlHXDJhlubo2/ELZ6d5ixS8RrfQSC
         BuE6p/c/0+gEH9uhNcyAiMxjD/S8UVHOgP+u0lO7ShCGI1BDiPQZU9dYKxTkT2PY57aN
         P9oHGPI5ut4ngJj/ypGAtp9mQlJUS/qqQgwpMhKa1jesBUIF+uK4AuhJxiGZJrq49kp6
         WkxmMtlO0u1xrD8CBPDhWbaG17y0wL+7u7BJUoa50JZEEnP+brl5dbPuRBVA2e8JtKB5
         sGeQ==
In-Reply-To: <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r1UFv3xqu2E9JFhC6fsKMGcnfxPkiBDTf
Content-Type: multipart/mixed; boundary="e4mKPj0tOTR60TQrxvNewWUsCXKbFStJr";
 protected-headers="v1"
From: Louis Sautier <sautier.louis@gmail.com>
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>
Message-ID: <936e7a0c-59e7-6a88-1ed4-f9227b906f4e@gmail.com>
Subject: Re: nftables: difference between "meta l4proto tcp" and "ip protocol
 tcp"
References: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
 <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com>
In-Reply-To: <CAOkSjBhb3X7y+Vu39Z9rhSV7y5s7kFJCh33bxkEb5x-x4vscog@mail.gmail.com>

--e4mKPj0tOTR60TQrxvNewWUsCXKbFStJr
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12/09/17 08:32, Arturo Borrero Gonzalez wrote:
> On 11 September 2017 at 23:10, Louis Sautier <sautier.louis@gmail.com> =
wrote:
>> Hello,
>>
>> I noticed that I can not use "ip protocol tcp" for IPv6, I assume that=

>> this is due to IPv6 packets not having a protocol field.
>> However, I also noticed that "meta l4proto tcp" works for IPv4 and it
>> seems to match exactly the same packets as "ip protocol tcp".
>>
>> The only relevant piece of information that I could gather is a messag=
e
>> (https://patchwork.ozlabs.org/patch/593221/) stating that (for "meta
>> l4proto" and "ip protocol") "However, the two statements are
>> redundants... the second implies the first".
>>
>>
>> If those expressions are different, what exactly do they use to match
>> packets? Is one more efficient?
>>
>=20
>=20
> Both are similar in term os efficiency.
>=20
> ip protocol tcp checks the IPv4 header looking for the l4 protocol numb=
er.
> meta l4proto tcp checks packet meta information (not header) to know
> about the l4 protocol, regardless of l3 protocol.
>=20
> Obviously, meta l4proto tcp can be used in IPv4/IPv6 while the first
> only makes sense in IPv4.
> You should read 'ip protocol tcp' as if it was explicit about l3
> protocol, like 'ipv4 protocol tcp': this wont match any IPv6 packet.
>=20
Thanks for the reply.
So if I understand correctly, "ip protocol" refers to an actual IPv4
packet field whereas "meta" refers to metadata that does not necessarily
have an associated packet field (such as all the unqualified meta
expressions like "skuid").
I guess in the case of IPv4, "meta l4proto" is obtained from the
protocol field whereas in the case of IPv6 it is obtained from the "next
header" field. But it doesn't matter to us because we use this "meta"
abstraction, is that right?


--e4mKPj0tOTR60TQrxvNewWUsCXKbFStJr--

--r1UFv3xqu2E9JFhC6fsKMGcnfxPkiBDTf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIaYtDDqHEijHS173LN9/2oYrKfsFAlm3jkIACgkQLN9/2oYr
KftYDwgArCnys+wh+lF5hkgTdEvZVBFU8QImu+3qIl6qBK9jcPzKzGYWmRX3NXf5
msIOFapKaXQoo0dSzGvKBrSqznOb5hNcR5LbARlg5Bn6xiPaBvEPp0kBuJZxadF9
tcMk6L2UKNRDzMvUPYpyiva2G/HB+DxqlCLJLMZFxutBbC5OX0L5TUlO042f35W2
rK0J49nP1//UcMIeo1rpmDnA4CaAMS4i9vW2hNH49a4M9BKmCeamOfwRIwcsmR2q
H7TY1UfUcUDx85nr1oP6qLUOL+qeZUBYO+1EkzIXc2tpJ299fyfgdbrL7LzgPFld
7FumN7sb3cfWvVkebAelV1Nnj8Xelw==
=HB2j
-----END PGP SIGNATURE-----

--r1UFv3xqu2E9JFhC6fsKMGcnfxPkiBDTf--
