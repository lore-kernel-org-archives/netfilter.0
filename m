From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: miscellaneous netfilter questions
Date: Wed, 03 Mar 2010 17:57:27 +0100
Message-ID: <4B8E94F7.4080908@plouf.fr.eu.org>
References: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Christoph Anton Mitterer a =E9crit :
>=20
> 1) If I disable conntracking for packets using NOTRACK in raw what =20
> happens if I e.g. match the state later in filter? Does the rule =20
> simply not match for such packets or is it INVALID?

Packets processed with the NOTRACK target have the UNTRACKED state.

> 2) The addrtype module provides several address types. Where can I =20
> find which addreses are _exactly_ matched by a given type for a given=
 =20
> protocol (especially IP4/6).
> I'm especiylly (but not only) interested in what LOCAL actually means=
?
> Is it all addresses of a hosts network interfaces PLUS the ALL =20
> addresses on that networks (like a "localnets")?
> Or is it all the addresses which the kernel thinks the host has itsel=
f, e.g.

The latter, I guess.

> 3) --fragment
> a) It's quite clear what happens if one uses "-f" or "! -f" but what =
=20
> happens if neither of the tow is give? Does it mean "! -f" or is it =20
> like "match not fragmented packets AND fragmented packets (both the =20
> first AND further fragments).

The latter, obviously. All packets are matched regardless of fragmentat=
ion.

> b) Is it true, that when conntracking is used, that packets are =20
> automatically defragmented so one doesn't have to care on fragments a=
t =20
> all?

=46or IPv4, indeed when conntrack is enabled incoming fragmented datagr=
ams
are reassembled before the PREROUTING chains. Note that packets which
are to be delivered locally are reassembled by the stack (not by
conntrack) before the INPUT chains anyway, so you never see fragments i=
n
INPUT chains.

AFAIK things work a bit differently for IPv6 : fragmented datagrams are
"virtually" reassembled for conntrack (the reason being that an IPv6
router does not handle fragmentation/reassembly), but continue to exist
as fragments through the ip6tables chains and the IPv6 stack.

> In that case, what happens to packets for which conntracking was =20
> disabled (NOTRACK in raw)? Are they also defragmented or not?

Good question. I have no answer. This requires some code reading or a
bit of testing.
