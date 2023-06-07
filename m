From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nftables: How to stop further chain traversal after accept
 verdict
Date: Wed, 7 Jun 2023 22:09:51 +0200
Message-ID: <8a37614c-87c2-1f2d-29dc-a2d1dfa064c7@thelounge.net>
References: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
 <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch>
 <CABQpAL50eaRfRsdNON3r3hNqEafJE7KdRYC8z3YM4LPu7NHc2g@mail.gmail.com>
 <a9b8cd69-bbb8-4466-7bfc-61d1263442ee@thelounge.net>
 <CABQpAL51Scodx0kS8oxUD7AC8fjNT5BY8ZxWetwmsc23++6JDg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CABQpAL51Scodx0kS8oxUD7AC8fjNT5BY8ZxWetwmsc23++6JDg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Tushar Shinde <mtk.tushar@gmail.com>
Cc: netfilter@vger.kernel.org, seentr@at.encryp.ch



Am 07.06.23 um 17:49 schrieb Tushar Shinde:
> What I am supposed to do in the chain where i can jump? How can I make 
> it final verdict - same problem as current chain.
> Jump will come back and continue next line.
> Goto will not.

the other chains are for marking/drop/reject

>  >> that's the whole point of chains at all
> This means unless rule is not in final high priority table chain we 
> cannot expect it to be accepted. This also means I cannot have multiple 
> tables for each team/ project?

no and it doesn't make sense at all that every "team" can make final 
accept decisions on a firewall which is global by definition

that's really not what iptables/nftables is for

> On Wed, 7 Jun 2023 at 6:27 PM, Reindl Harald <h.reindl@thelounge.net 
> <mailto:h.reindl@thelounge.net>> wrote:
> 
> 
> 
>     Am 07.06.23 um 13:15 schrieb Tushar Shinde:
>      > What is use of table chains if they are not decision makers in
>     accept case?
>      > We mostly know what to accept and deny everything else. Is this
>     cannot
>      > be done with nftables?
> 
>     exactly the same as in iptables for example PREROUTING it don't matter
>     if you have a ACCEPT rule or nothing matches which would DROP a
>     packet -
>     default policy is ACCEPT
> 
>     but just because it passed PREROUTING/MANGLE/RAW by ACCEPT it there
>     don't mean you want to accept the package in FORWARD/INPUT chains
> 
>     that's the whole point of chains at all
> 
>     Chain PREROUTING (policy ACCEPT 64M packets, 4408M bytes)
>     num   pkts bytes target     prot opt in     out     source
>     destination
>     1     799M  827G ACCEPT     all  --  *      * 0.0.0.0/0
>     <http://0.0.0.0/0>
>     0.0.0.0/0 <http://0.0.0.0/0>            ctstate RELATED,ESTABLISHED
>     2      44M 2500M INBOUND    all  --  wan    * 0.0.0.0/0
>     <http://0.0.0.0/0>
>     0.0.0.0/0 <http://0.0.0.0/0>            ! match-set EXCLUDES_IPV4 src
> 
>      > On Tue, Jun 6, 2023 at 9:29 PM <seentr@at.encryp.ch
>     <mailto:seentr@at.encryp.ch>> wrote:
>      >>
>      >> You can try to set mark as well as accept them. This way you
>     will be able to determine in the following chains that some of
>     previous ones had accepted it.
>      >>
>      >> 2023-06-06T15:40:03Z Tushar Shinde <mtk.tushar@gmail.com
>     <mailto:mtk.tushar@gmail.com>>:
>      >>
>      >>> Hi,
>      >>>
>      >>> I have asked the same question to super users. But I looks like
>     I need
>      >>> help from experts.
>      >>>
>      >>>
>     https://superuser.com/questions/1787416/nftables-how-to-stop-further-chain-traversal-after-accept-verdict <https://superuser.com/questions/1787416/nftables-how-to-stop-further-chain-traversal-after-accept-verdict>
>      >>>
>      >>> Question is, If there are multiple tables (possibly owned by
>     multiple
>      >>> teams/projects ), if a rule is accepted by one of the tables in the
>      >>> chain, how to stop looking into the next high priority chain. Right
>      >>> now my observation is ACCEPT just stops processing the current
>     chain
>      >>> and jump to next table. If this is last table then only ACCEPT will
>      >>> work, otherwise this ACCEPT is useless.
>      >>> Logs are on SU post.
>      >>>
>      >>> Kindly correct me if I am wrong
