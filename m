From: Florian Westphal <fw@strlen.de>
Subject: Re: Issue migrating "iptables -m socket --transparent" into nftables
Date: Mon, 17 Aug 2020 21:34:06 +0200
Message-ID: <20200817193406.GE15804@breakpoint.cc>
References: <30147982.tmreYhUOsE@deimos>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <30147982.tmreYhUOsE@deimos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Nirgal =?iso-8859-15?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Cc: netfilter@vger.kernel.org

Nirgal Vourgère <contact_vgernf@nirgal.com> wrote:
> 
>     ip rule add fwmark 1 lookup haproxy
>     ip route add local default dev lo table haproxy
> 
> My firewall rules have
> 
>     iptables -t mangle -A PREROUTING -m socket --transparent -j MARK --set-mark 1

[..]

> I tried this nft rule:
> 
>     table inet haproxy {
>         chain prerouting {
>             type filter hook prerouting priority -150; policy accept;
>             socket transparent 1 mark set 0x00000001
>         }
>     }
> 
> It does work, but all traffic is routed to the haproxy socket, including outbound masqueraded connection… I mean when a box on the lan side connects to a foreign https server, the connection is grabbed by haproxy, which is not what I want.

I don't understand how the iptables rule would not do exactly the same
thing, there is nothing that checks interface names or addresses.

Are you sure there is nothing in the iptables rule set that
makes the socket rule only handle those packets that should be redirected?
