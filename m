From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 19:13:12 +0100
Message-ID: <20141126181312.GA25447@salvia>
References: <5474BC91.6060108@c-s.fr>
 <20141126130042.GA1533@salvia>
 <54760ABA.4040900@c-s.fr>
 <20141126174721.GA3815@salvia>
 <5476152E.8010400@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5476152E.8010400@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: netfilter@vger.kernel.org

On Wed, Nov 26, 2014 at 07:00:14PM +0100, leroy christophe wrote:
>=20
> Le 26/11/2014 18:47, Pablo Neira Ayuso a =E9crit :
> >Use 'nft -f file' to load your ruleset instead of scripts.
> >Otherwise the rule-set is not loaded atomically, and it will also
> >take longer to load your ruleset. Please, help spread the word,
> >people should use nft -f.
>=20
> I wanted to use 'nft -f' at the begining but I faced some issues.
>=20
> How is 'nft -f' to be used ? Does it takes as input the output of
> 'nft list table filter' ?

Yes.

> I tried it, it adds rules but doesn't remove the previous ones. How
> can I replace previous rules in one go with 'nft -f' ?

You have to prepend:

 flush table filter

to the output of 'nft list table filter'.

Since 3.18, you can also use:

 flush ruleset

that removes everything, including the existing table and chain
configuration.

http://wiki.nftables.org/wiki-nftables/index.php/Operations_at_ruleset_=
level

> How can it interpret the below output which seems buggy ?
>=20
> root@vgoip:~# nft list table filter
> table ip filter {
>         chain input {
>                  type filter hook input priority 0;
>                  oifname "lo" accept
>                  ip protocol icmp accept
>                  ct state 8 unknown unknown 0x16 [invalid type] accep=
t
>                  ct state { 4, 2} accept
>                  reject with icmp type 10
>         }

What is the original ruleset you loaded? This should not happen. Any
relevant information regarding your testbed?

>         chain forward {
>                  type filter hook forward priority 0;
>                  drop
>         }
> }
>=20
> Looks like it dumps using numeric values, but crashes when trying to
> use those numeric values
>=20
> root@vgoip:~# nft add rule filter input ct state { 4, 2} accept
> Segmentation fault (core dumped)
>=20
> https://wiki.archlinux.org/index.php/nftables says that "nft -f" is
> not atomic. Is it wrong ?

Yes, I just fixed that and made a quick review to that wiki page.
Please, better look at the nftables wiki page:

http://wiki.nftables.org
