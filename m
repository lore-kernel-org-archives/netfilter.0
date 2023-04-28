From: seentr@at.encryp.ch
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 08:03:16 +0000 (UTC)
Message-ID: <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com> <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch> <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1682669001;
        bh=WozXeu9i6hrSPG+I2R/Yvm5fk6c2wq5swQEu/9OnO3w=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject;
        b=EpjvDoAEi369vgKtN6LrI6fWmAxdoz3h3xmgcNrXQ6mcjX+JmZjYN1AzDHNl84iQX
         v5Z/QKFlyghtPalGLD26JgdAgr4xcSCAxhWLjCHWOO21YJgGCW/W1b1EuHDzBLAcjv
         kHDbYAB3xsSrK5CCbANa5HBf1+aUVDJ+6/qxtGWk=
In-Reply-To: <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

I think you need something like this:
> nft add rule x prerouting fib daddr . iif type local accept

Also, in the wiki I see following information:
> General syntax is: fib key data operator expression, where:
>
>=C2=A0=C2=A0=C2=A0=C2=A0 key: saddr, daddr, mark, iif, oif (use '.' for co=
ncatenations to represent tuples)
>=C2=A0=C2=A0=C2=A0=C2=A0 data: oif, oifname, (address) type
>=C2=A0=C2=A0=C2=A0=C2=A0 operator: eq, neq, vmap, map

Thus you may try something like this:
> nft add rule x prerouting fib daddr . iif oifname wan accept

I am currently away from PC and could not verify how it actually behaves bu=
t you can try and experiment with different parameters on your own.

2023-04-28T07:55:25Z Glen Huang <heyhgl@gmail.com>:

> Thanks for the quickly reply.
>=20
> Maybe I missed something, but it seems both nexthop and fib can only filt=
er packets that go out of a certain interface, but not ones that have wan I=
P as the destination?
>=20
>> On Apr 28, 2023, at 3:22 PM, seentr@at.encryp.ch wrote:
>>=20
>> Have you tried this: https://wiki.nftables.org/wiki-nftables/index.php/M=
atching_routing_information ?
>>=20
>> 2023-04-28T03:59:07Z Glen Huang <heyhgl@gmail.com>:
>>=20
>>> Hi,
>>>=20
>>> I use tproxy to redirect all traffic from the lan interface, but I want=
 to exemplify traffic whose destination IP belongs to the wan interface. I =
wonder if it=E2=80=99s possible to specify if ip daddr matches the wan inte=
rface IP in the prerouting chain?
>>>=20
>>> The only solution I can think of right now, is to create a set, and man=
ually update the set with wan IPs (also whenever they change), which is ver=
y cumbersome.
>>>=20
>>> I wonder if there is a direct way to that in nft?
>>>=20
>>> I use nft1.0.7 with kernel 5.15.108
