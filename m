From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables 1.0.6: snat with maps
Date: Wed, 2 Aug 2023 13:10:30 +0200
Message-ID: <20230802111030.GA27982@breakpoint.cc>
References: <2c9ac3368f42c585331d044a51f56e94@sieciuch.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2c9ac3368f42c585331d044a51f56e94@sieciuch.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mucha Marcin, Sieciuch.com" <m.mucha@sieciuch.com>
Cc: netfilter@vger.kernel.org

Mucha Marcin, Sieciuch.com <m.mucha@sieciuch.com> wrote:
> Hello,
> I'm having trouble with moving from these snat rules:
> 
> chain source-nat {
>        type nat hook postrouting priority 100; policy accept;
>        ct state invalid drop;
>        ip saddr 10.0.0.0/24 oif enp7s0 snat to 192.168.10.8 persistent;
>        ip saddr 10.1.0.0/24 oif enp7s0 snat to 192.168.10.9 persistent;
>        }
> to the one that uses maps based on https://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps
> :
> 
> chain source-nat {
>         type nat hook postrouting priority 100; policy accept;
>         ct state invalid drop;
>         oif enp7s0 ip saddr maps {10.0.0.0/24 : 192.168.10.8, 10.1.0.0/24 :
> 192.168.10.9};
> }
>
> My problem is - I'm getting syntax error after checking config with "nft -cf
> /etc/nftables.conf":
> "/etc/nftables.conf:43:83-83: Error: syntax error, unexpected newline
>     oif enp7s0 ip saddr maps {10.0.0.0/24 : 192.168.10.8, 10.1.0.0/24 :
> 192.168.10.9};
>            ^"
> Could I ask you for a help?

Did you mean
oif enp7s0 snat to ip saddr map {10.0.0.0/24 : 192.168.10.8, 10.1.0.0/24 : 192.168.10.9 }
?
