From: Eugene Crosser <crosser@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Thu, 19 Aug 2021 15:47:55 +0200
Message-ID: <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0Lf6pUKghisvHfQzqVVX4J2fkuP0yxC3I"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1629380883; bh=BAkuOLUiiD39XWFFGM7qJVsmr21tLHNFKuUh09n/a50=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=Slfv3iaAJwcH410Kg+KluSuZO7c/BO8IRPfGXnsSu2QqvdHv6x3KI2KqphPNgjrxi
         cCnQ6MiiBJhJvenk9qSAUtKwQsXTiuUqAiCm7knhzFmPqe9VlXgMeleJYKGNGJBRp+
         HpgUfr+0P/d6qWyED30a1CvEbZwBuOtpHUnruB84=
In-Reply-To: <20210819090905.GT607@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0Lf6pUKghisvHfQzqVVX4J2fkuP0yxC3I
Content-Type: multipart/mixed; boundary="l2a7Rno7g3i9xF5rJm98Fgvm3TPLgSlAy";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Message-ID: <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc>
In-Reply-To: <20210819090905.GT607@breakpoint.cc>

--l2a7Rno7g3i9xF5rJm98Fgvm3TPLgSlAy
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19/08/2021 11:09, Florian Westphal wrote:
> Eugene Crosser <crosser@average.org> wrote:
>> On 18/08/2021 18:13, Florian Westphal wrote:
>>> Eugene Crosser <crosser@average.org> wrote:
>>>> My use case is to set up a stateful firewall allowing any outgoing c=
onnection
>>>> from a host, and restricting incoming, which obviously requires conn=
tracking.
>>>> The twist is that there exists a rather high probability of DoS-like=
 incoming
>>>> traffic, that easily overflows conntrack table with unconfirmed entr=
ies, even
>>>> though their lifetime is very short.
>>>
>>> Create a rule that drops NEW packets in prerouting hook. For iptables=
,
>>> mangle will work (raw is too early).  For nftables, youl need to choo=
se
>>> a hook prioriy of -199 or higher (-198, ... to anything below 2**31).=

>>>
>>> Such packets will create a new connection entry, but because packet g=
ets
>>> dropped before confirmation the entry will not be committed to the ta=
ble.
>>
>> Unfortunately this approach does not work for my case.
>> I cannot drop packets before I know that they are going to the INPUT p=
ath.
>> The point of the exercise is to route transit traffic without conntrac=
king it
>> (because tracking will overflow the table), but conntrack traffic to/f=
rom the
>> host itself.
>=20
> Confirmation  (=3D=3D commit of NEW to contnrack table) occurs at end o=
f INPUT
> (incoming case) or POSTROUTING (for locally originating and forwarded t=
raffic)
>=20
>> Maybe I'd be able to determine which traffic is transit on prerouting =
stage (by
>> IP addresses or interfaces) and set "notrack" selectively...
>=20
> You might have to clarify what you are looking for.

Yes, I oversimplified our case and omitted the part that turned to be imp=
ortant.
This is a host for multiple VMs. We want VM traffic to go through unfilte=
red and
_untracked_ because tracking _this_ traffic overflows the table.

Traffic to the host itself (management and configuration) needs to be fil=
tered,
and to do it effectively we need stateful firewall, hence it should be tr=
acked.
Flooding of the table by traffic that ends up in the INPUT path is not re=
ally a
concern, and we would drop bad traffic anyway, preventing ct entries from=
 being
committed (as far as I understood your explanation).

So the problem, as far as I understand it, is that decision to track or n=
ot
track has to be taken _before_ the decision between FORWARD and INPUT. We=
 want
FORWARD to go (ahem) forward without modifying the table, and INPUT to be=

processed against the table to be able to decide if it belongs to an exis=
ting
outgoing connection.

That _could_ be achieved if the "track/notrack" switch had a third positi=
on:
"try to track, but if there was no existing entry, pretend that it's notr=
ack".

> And you don't want to track forwarded traffic (but still want to track
> locally originating traffic).
>=20
> Only choice in that case is to NOTRACK in raw/PREROUTING based on incom=
ing
> interface.

Yeah, I guess we'd have to settle on something like that (or based on the=

destination IP address being "in our management network" maybe). That's b=
e more
fragile w.r.t. possible future changes of interfaces / addresses.

>> Yet I am surprised that a flag meaning "conntrack, but only to confirm=
 exiting
>> entries" does not exist. Would not it be useful to have?..
>=20
> How would that even work?
>
> To know if a given packet is a reply there needs to be a record in the
> state table.

I was guessing this piece of code

=3D=3D=3D=3D=3D
        /* look for tuple match */
        zone =3D nf_ct_zone_tmpl(tmpl, skb, &tmp);
        hash =3D hash_conntrack_raw(&tuple, state->net);
        h =3D __nf_conntrack_find_get(state->net, zone, &tuple, hash);
        if (!h) {
                h =3D init_conntrack(state->net, tmpl, &tuple,
                                   skb, dataoff, hash);
                if (!h)
                        return 0;
                if (IS_ERR(h))
                        return PTR_ERR(h);
        }
        ct =3D nf_ct_tuplehash_to_ctrack(h);
=3D=3D=3D=3D=3D

could _not_ call `init_conntrack()` depending on the (hypothetical) "trac=
k only
when entry exists" flag, and return early otherwise?.. But my understandi=
ng of
the workings of netfilter is really poor, it is very likely that I am mis=
sing
something crucial.

> If you are only looking for 'remote' vs 'locally generated' traffic, yo=
u might
> want to have a look at the socket match, which could be used to detect
> if an incoming packet would match a local socket.
>=20
> There is also the 'addrtype' match, which could be used to detect
> (at prerouting) if the routing table says that the daddr is local (or n=
ot).
>=20
> But depending on wheter you are using NAT this might not work.

Oh, this is a very good hint! I'll need to check if that can be used for =
our
case. We need NAT, but in the paths between specific interfaces, where we=
 can
enable conntrack separately. So it might work!

While I am here, may I ask: is there a "correct" way to re-enable conntra=
ck that
was disabled in someone else's chain that happened to run before mine?

Thanks once again,

Eugene


--l2a7Rno7g3i9xF5rJm98Fgvm3TPLgSlAy--

--0Lf6pUKghisvHfQzqVVX4J2fkuP0yxC3I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmEeYQsACgkQfKQHw5Gd
RYyT6QgAt0z/974oCCJAtC/oPLCFh2btdUxEe8wvlGM5BwPFBu3cELRIVM8p4w+i
v6t1Uhu4E6XhN2rxN0UaKCcqn9OhW5ZKXdOB7mpbhX/tZBDUhqwfgWKPNU24NYd7
9D5D1pIt7mfMnX+1htiyPoPUKRFkRR8PHKMliOd9E4Ew7oXKANCBipPoydc4jy7P
X9Kr+CYqCubYDrZOXiMoi2uN3BTnAdMzXc33HuQvFnybPsbb77rbqwNw3Plkugw/
uvor5SaLi9Un8s9J6VDZxSZ4G3k1zD3GFbRTIVtIF4lC9mr3cUHnsjCogzpvA3zu
gfoY7L0ZuOPXndxIZB1VTDO4f5O51A==
=mX1G
-----END PGP SIGNATURE-----

--0Lf6pUKghisvHfQzqVVX4J2fkuP0yxC3I--
