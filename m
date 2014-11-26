From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 19:00:14 +0100
Message-ID: <5476152E.8010400@c-s.fr>
References: <5474BC91.6060108@c-s.fr> <20141126130042.GA1533@salvia> <54760ABA.4040900@c-s.fr> <20141126174721.GA3815@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141126174721.GA3815@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


Le 26/11/2014 18:47, Pablo Neira Ayuso a =E9crit :
> Use 'nft -f file' to load your ruleset instead of scripts. Otherwise=20
> the rule-set is not loaded atomically, and it will also take longer t=
o=20
> load your ruleset. Please, help spread the word, people should use nf=
t -f.

I wanted to use 'nft -f' at the begining but I faced some issues.

How is 'nft -f' to be used ? Does it takes as input the output of 'nft=20
list table filter' ?

I tried it, it adds rules but doesn't remove the previous ones. How can=
=20
I replace previous rules in one go with 'nft -f' ?

How can it interpret the below output which seems buggy ?

root@vgoip:~# nft list table filter
table ip filter {
         chain input {
                  type filter hook input priority 0;
                  oifname "lo" accept
                  ip protocol icmp accept
                  ct state 8 unknown unknown 0x16 [invalid type] accept
                  ct state { 4, 2} accept
                  reject with icmp type 10
         }

         chain forward {
                  type filter hook forward priority 0;
                  drop
         }
}

Looks like it dumps using numeric values, but crashes when trying to us=
e=20
those numeric values

root@vgoip:~# nft add rule filter input ct state { 4, 2} accept
Segmentation fault (core dumped)

https://wiki.archlinux.org/index.php/nftables says that "nft -f" is not=
=20
atomic. Is it wrong ?


