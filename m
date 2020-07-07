From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: masquerading not applied consistently
Date: Wed, 8 Jul 2020 01:10:34 +0200
Message-ID: <20200707231034.GC32005@breakpoint.cc>
References: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thilo-Alexander Ginkel <thilo@ginkel.com>
Cc: netfilter@vger.kernel.org

Thilo-Alexander Ginkel <thilo@ginkel.com> wrote:
> I have a somewhat complex VPN setup involving a Ubuntu-based VPN
> gateway ("vpn-gw") that terminates multiple VPNs based on WireGuard
> and OpenVPN. Also involved is a core router ("gw01") that performs
> routing among different VLANs comprising the LAN. One of the OpenVPN
> interfaces ("tun252")  requires masquerading, which I implemented
> through the following nftables config snippet:
> 
> table ip nat {
>     chain postrouting {
>         type nat hook postrouting priority 100; policy accept
> 
>         [...]
>         oifname "tun252" counter masquerade
>     }
> }
> 
> This works fine if traffic originates on the LAN. Things start acting
> weird (i.e., no masquerading is applied when the traffic is forwarded
> to tun252) when the traffic originates on one of the WireGuard
> interfaces. The path of the packets in this case is: vpn-gw[wireguard]
> -> vpn-gw[eth0.250] -> gw01[eth0.250] ->  gw01[eth0.252] ->
> vpn-gw[eth0.252] -> vpn-gw[tun252]

I.e., traffic passes vpn-gw twice?  If so, that won't work.

On first pass (wireguard decap), packet x is picked up by
connection tracking and then has NAT applied to it.
As no matching NAT rule exists, the connection gets a 'do nothing'
binding.    When packet comes back, it will match the existing
'do nothing' connection and the nat table is never consulted.

If thats the case, you will either need to turn off contrack for packets
coming from wireguard (use 'notrack' keyword in raw table) or, if you
need nat for this part as well, place the two rounds the packet takes in
different connection tracking zones, so that the packet coming back
from gw01/vlan252 is seen as a new flow, rather than an old packet
matching a known connection.
