From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 18:47:21 +0100
Message-ID: <20141126174721.GA3815@salvia>
References: <5474BC91.6060108@c-s.fr>
 <20141126130042.GA1533@salvia>
 <54760ABA.4040900@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54760ABA.4040900@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: netfilter@vger.kernel.org

On Wed, Nov 26, 2014 at 06:15:38PM +0100, leroy christophe wrote:
>=20
> Le 26/11/2014 14:00, Pablo Neira Ayuso a =E9crit :
> >On Tue, Nov 25, 2014 at 06:29:53PM +0100, leroy christophe wrote:
> >>Using nft, i'm trying to jump to another table from the end of a
> >>table and I get the following error.
> >>
> >>root@localhost:~# nft add rule filter input  goto accs
> >><cmdline>:1:1-31: Error: Could not process rule: Operation not supp=
orted
> >>add rule filter input goto accs
> >>^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>
> >>What could be the reason ?
> >>
> >>I'm using
> >>* nftables-20141121
> >>* gmp-4.3.2
> >>* libmnl-1.0.3
> >>* libnfnetlink-1.0.1
> >>* libnftnl-20141121
> >>* libnetfilter_conntrack-1.0.4
> >Kernel version?
> 3.17.4
> >
> >Could you run this command with strace:
> >
> >strace nft add rule ...
> See at the end
> >
> >Could you post the relevant part of your ruleset (table and chain
> >configuration)?
> root@vgoip:~# nft list table filter
> table ip filter {
>         chain forward {
>                  type filter hook forward priority 0;
>                  drop
>         }
> }
>=20
> root@vgoip:~# ./mynft.sh start

Use 'nft -f file' to load your ruleset instead of scripts.  Otherwise
the rule-set is not loaded atomically, and it will also take longer to
load your ruleset.

Please, help spread the word, people should use nft -f.

> + echo Starting NFTABLES test ...
> Starting NFTABLES test ...
> + Start
> + nft add chain ip filter rej { type filter hook input priority 20 ; =
}
> + nft add rule filter rej ip saddr 192.168.2.0/24 reject with icmp
> type host-prohibited
> + nft add rule filter rej drop
> + nft add chain ip filter test { type filter hook input priority 10 ;=
 }
> + nft add rule filter test meta oifname lo accept
> + nft add rule filter test icmp type echo-request ip saddr
> 192.168.2.1 accept
> + nft add rule filter test icmp type
> {echo-request,timestamp-request} goto rej
> <cmdline>:1:1-72: Error: Could not process rule: Operation not suppor=
ted
> add rule filter test icmp type {echo-request,timestamp-request} goto =
rej
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^

You cannot 'goto' a base chain, note that 'rej' is a base chain.

+ nft add chain ip filter rej { type filter hook input priority 20 ; }

I guess your intention was to define this as a non-base chain, ie.

 nft add chain ip filter rej

Note that non-base chain don't see any traffic unless there is a rule
that jumpto/goto it.
