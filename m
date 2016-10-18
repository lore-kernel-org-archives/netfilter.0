From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 22:38:50 +0200
Message-ID: <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
 <20161018085957.GC29405@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WEeEGHN8FBHLeQcnbFQoTsRE3b06jXCek"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161018085957.GC29405@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WEeEGHN8FBHLeQcnbFQoTsRE3b06jXCek
Content-Type: multipart/mixed; boundary="MFIAwBRKDkqV96QTDm30dkCKmx09oaCTW";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>,
 netfilter@vger.kernel.org
Message-ID: <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
 <20161018085957.GC29405@breakpoint.cc>
In-Reply-To: <20161018085957.GC29405@breakpoint.cc>

--MFIAwBRKDkqV96QTDm30dkCKmx09oaCTW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.10.2016 10:59, Florian Westphal wrote:
> Noel Kuntze <noel@familie-kuntze.de> wrote:
>> > On 17.10.2016 22:27, Pablo Neira Ayuso wrote:
> [..]
>=20
>>> > > Allowing to match if the packet is protected/unprotected in a
>>> > > true/false fashion.
>> >
>> > Well, I am active in the strongSwan community, so I believe I've see=
n all the
>> > use cases there are and I've seen uses of every option, except "--ne=
xt" and "--strict".
>> > But I think there are probably use cases where they are used as well=
=2E
> Ok.  I still believe that 'meta secpath' makes sense as a more simple
> alternative, I think most users are just interested in 'was this packet=

> ipsec protected' rather than doing the full policy option dance.
>=20
> Wrt. -m policy in nftables, we have two different cases:
>=20
> 1. Check if a given daddr/saddr/spi etc is listed in *any* of the polic=
ies.
> 2. Check if a given policy contains the exact spi/daddr/saddr.
>=20
> As first rfc, what about the below syntax?
>=20
> It adds one expression (to load a given policy element into a register)=

> and one statement (to search policies for a given number/address).
>=20
> add rule filter input xfrm policy direction original 0 spi eq 1
>=20
> would take input policies, grab first one (policy[0]), get its spi and
> place it into a register (i.e., the 'eq 1' is not part of the xfrm
> expression, only 'spi' is passed as key so we know what to look for).
>=20
> Chaining these would allow the strict mode matching, but as you might
> imagine it would be quite bloated to do exact matching :-/
>=20
> Statement would look like this:
> add rule filter input xfrm policy direction original spi 1
>=20
> ... it would search all input policies for spi 1.
> (i.e., 1 is passed as immediate value to the xfrm expression).
>=20
> Thoughts?
> Does anyone see a -m policy case that we could not cover with this?
> [SNIP]

*if* we can have all the options and data we can get with -m policy
(except --strict and --next, obviously) in nftables, then yes,
I think all use cases would be covered.

> 1. Check if a given daddr/saddr/spi etc is listed in *any* of the polic=
ies.
Any in the SPD or any that matched?
> 2. Check if a given policy contains the exact spi/daddr/saddr.
The exact SPI/daddr/saddr of what? Of a set policy match (whatever that m=
ight be)
in nftables?


--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--MFIAwBRKDkqV96QTDm30dkCKmx09oaCTW--

--WEeEGHN8FBHLeQcnbFQoTsRE3b06jXCek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBohaFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYYwsP/29BYVSxs/wPD156pLeVtTLVcUN1C4O1yXS6rjEpfYyt5HqIEBVOZYEr
CC/Lekh6KQSD8Z9TJUIQmfQpYtOaCwA7p+Qk9oRUCIip2jYO3azNlOIiKZ44zvZo
fB5AEhL7iaGiyhO26BfC7B6eHQmHpZH7aW/I0M1Klsd2QMOlvI+LWRMHzfyeWoyQ
Uie8YKYUrivOYWevhZB+basnXYeoQYAyAZ6cuojrgDw4LH9P2nU71HahE4rSDJMH
381799lfIkL9WogJetu4mWL8ElgoF7FctCPG8VS0NUo318lfyKmpGiFUqdhT4Nj9
gGOmVRm2V+MNOifycgvgV6Ho0lA9GUuROFKRejkQvvSEQbcsV3pGAEOvP0tYOKZI
UrgGgSW0Moy8BASTlgvHHMMWJVnatXnGEkwfREPzu6uODKggnRSVcfVVINcPB60I
jd6xcnkzAJc8WMCpzg63P6GQQqgvH0YzAmZqUim4xZJDOwdZzdBmweBU0TRHUsFf
1byDEJ93fOte4O91JH1agcQci2eiDl+4AdyMExqwUnUVqpOQYp/k0t6AljRDkmAQ
9JQXTMSLa+ettUIRb5JbZyw15EG0EdHbwyk04eCq/a4aKVXS4e0hghEYJ5JVhm53
8r1SgXgIo+9BUnIUMIpnwBX23sSmXaeowgwuDSt+4K4Z2QriPcjC
=OHoj
-----END PGP SIGNATURE-----

--WEeEGHN8FBHLeQcnbFQoTsRE3b06jXCek--
