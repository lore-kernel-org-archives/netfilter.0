From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft named set address types
Date: Mon, 15 Nov 2021 20:47:06 +0100
Message-ID: <YZK5OsnQjzhbBOD3@salvia>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
 <YYGeTgBAZfM76k4h@salvia>
 <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, Nov 15, 2021 at 11:40:43AM -0600, Matt Zagrabelny wrote:
> Hello Pablo and others,
> 
> I'm attempting to have a similar ICMP{4,6} ruleset as I have for TCP -
> thanks Pablo for the vmap hint.
> 
> On Tue, Nov 2, 2021 at 3:23 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> > Better split your ruleset in a tree using verdict maps:
> >
> > table inet filter {
> >     chain input_ip4 {
> >         ip saddr 127.0.0.1 accept
> >     }
> >
> >     chain input_ip6 {
> >         ip6 saddr ::1 accept
> >     }
> >
> >     chain input {
> >         type filter hook input priority filter; policy drop;
> >         ct state vmap { established : accept, related : accept, invalid : drop }
> >         # implicit match on 'ct state new,untracked'
> >         tcp dport 22 meta protocol vmap { ip : jump input_ip4, ip6 : jump input_ip6 }
> >     }
> > }
> 
> I see there is an icmpx for reject packets. Is there something
> equivalent for destination packets?
> 
> I've tried:
> 
> table inet filter {
>     chain icmp_ipv4 {
>         ip  saddr $icmp_networks_ipv4 accept
>     }
> 
>     chain icmp_ipv6 {
>         ip6 saddr $icmp_networks_ipv6 accept
>     }
> 
>     chain input {
>         meta protocol {icmp, icmpv6} vmap {
>             icmp: jump icmp_ipv4,
>             icmpv6: jump icmp_ipv6,
>         }
>     }
> }
> 
> Nov 15 11:39:05 watchtower nft[3709857]: In file included from
> /etc/nftables.conf.d/100-include.nft:5:1-48:
> Nov 15 11:39:05 watchtower nft[3709857]:                  from
> /etc/nftables.conf:3:1-37:
> Nov 15 11:39:05 watchtower nft[3709857]:
> /etc/nftables.conf.d/600-host.d/100-icmp.nft:11:38-41: Error: syntax
> error, unexpected vmap, expecting newline or semicolon
> Nov 15 11:39:05 watchtower nft[3709857]:         meta protocol {icmp,
> icmpv6} vmap {
> 
> Is there no vmap for icmp?

instead of:

         meta protocol {icmp, icmpv6} vmap {
             icmp: jump icmp_ipv4,
             icmpv6: jump icmp_ipv6,
         }

this should be:

         meta protocol vmap {
             icmp: jump icmp_ipv4,
             icmpv6: jump icmp_ipv6,
         }
