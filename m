From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables routing decision
Date: Wed, 5 Feb 2020 12:33:17 +0100
Message-ID: <20200205113317.GC26952@breakpoint.cc>
References: <DB8P191MB0633D8075A151338381BB3FABB000@DB8P191MB0633.EURP191.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB8P191MB0633D8075A151338381BB3FABB000@DB8P191MB0633.EURP191.PROD.OUTLOOK.COM>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0JjQstCw0L3QvtCyINCg0L7QvNCw0L0=?= <krey@irinium.ru>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Иванов Роман <krey@irinium.ru> wrote:
> How nftables make router decision about packet directed to input or 
> forward chains?

It doesn't, just like with iptables.  INPUT vs. FORWARD decision
depends on routing decision done in network stack.

> Please see my example
> We have router with nftables, private host and public host that redirect 
> traffic to private host through tunnel
> 
> Private host            Router                Public host
> [LAN 192.168.40.12] (5)=>    [WAN 95.0.0.1]    (1)=>  [WAN 96.0.0.1]   
>       (2)=!
> |<=(4)                [Tunnel 192.168.40.1]    <=(3)  [Tunnel 
> 192.168.40.2]      <=!
> 
> If i try to connect from private network to public host connection fails
> On step (5) when private host send answers back to 95.0.0.1, nftables on 
> router put packets in input chain but not forwarding chain.
> This behaviour apears regardless any packet marks.
> How i can change this behavior? May be some options on raw, mangle or 
> other chains that overrides routing decision and put packet directly in 
> forward chain?

There is no such thing.  Routing decision is only relevant factor.

You can set packet marks if you need policy routing ("ip rule"),
but that doesn't allow to override the routing table, it merely allows
(with "ip rule" in place) to select the routing table to use.

> By steps:
> 0. From other host in lan query 96.0.0.1, http get for example
> 1. Router make masq or snat. Src ip 95.0.0.1, Dst ip 96.0.0.1
> 2. Public host makes dnat, Src ip 95.0.0.1, Dst ip 192.168.40.12.
> 3. Packet sent via tunnel.
> 4. Router forward packet to 192.168.40.12 
> (net.ipv4.conf.tnl.accept_local must be 1). Src ip 95.0.0.1, Dst ip 
> 192.168.40.12.
> 5. Private host receive packet and send response. Src 192.168.40.12, Dst 
> ip 95.0.0.1
> 6. Nftables on router receive packet with Dst ip 95.0.0.1 and put it on 
> input chain. Initial host on step 0 never get response.

Yes, step6 looks correct because 95.0.0.1 is a local address after all,
"ip route get 95.0.0.1" on router will say its local address.

If you really want this config (I don't understand this snat), you need
to use policy routing to have the kernel consult a different routing
table for the packet.
