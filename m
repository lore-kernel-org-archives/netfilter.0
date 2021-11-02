From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Improvements to the Home Router Wiki page
Date: Tue, 2 Nov 2021 12:31:37 +0100
Message-ID: <YYEhmehrFUc8c1Ok@salvia>
References: <9EwLs4Z4lDrYS0hyZoApmQ2StFQlMHrKwhKRXtSsUCDf0G6p5_e5JCcrjz9T4vCV7TXVYZHX_egqjtKbSsPBoBMl2SAEODG-kOU1u8j-LgY=@protonmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9EwLs4Z4lDrYS0hyZoApmQ2StFQlMHrKwhKRXtSsUCDf0G6p5_e5JCcrjz9T4vCV7TXVYZHX_egqjtKbSsPBoBMl2SAEODG-kOU1u8j-LgY=@protonmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timothy Ham <timothyham@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Oct 30, 2021 at 09:39:07PM +0000, Timothy Ham wrote:
> Hello,
> 
> I have benefited from the wiki page "Simple ruleset for a home router" found here:
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_home_router
> 
> Still, it doesn't cover port forwarding and hairpin NAT. So after several hours of trying different things, I've finally figured out how to do them, and improved the example config. Could someone in charge please update the example on the wiki? Specifically the example config given in the section "Simple router using ppp interface". I've kept everything the same except the few lines I've added.
> 
> If my config can be improved further, please suggest more changes as well.

I'm assuming nftables 1.0.0 for the comments below.

> Thank you.
> 
> ==== begin ====
> flush ruleset
> 
> define DEV_PRIVATE = eth1
> define DEV_WORLD = ppp0
> define NET_PRIVATE = 192.168.0.0/16
> define IP_WAN = x.x.x.x
> define IP_ROUTER = 192.168.0.1
> define IP_SERVER = 192.168.0.10
> 
> table ip global {
>     chain prerouting {
>           type nat hook prerouting priority dstnat;
> 
>           # Hairpin NAT part 1/2. WAN IP address must be known
>           ip daddr $IP_WAN tcp dport 443 dnat to $IP_SERVER:8443
>           ip daddr $IP_WAN tcp dport 80 dnat to $IP_SERVER:8080

Consolidate this rule using a map:

            ip daddr $IP_WAN dnat to tcp dport map { 443 : $IP_SERVER . 8443, 80 : $IP_SERVER . 8080 }

>           # Port forwarding part 1/2
>           iifname $DEV_WORLD tcp dport 443 dnat to $IP_SERVER:8443
>           iifname $DEV_WORLD tcp dport 80 dnat to $IP_SERVER:8080

Is this rule is redundant? is $IP_WAN the IP address of $DEV_WORLD?

>     }
> 
>     chain inbound_world {
>         # accepting ping (icmp-echo-request) for diagnostic purposes.
>         # However, it also lets probes discover this host is alive.
>         # This sample accepts them within a certain rate limit:
>         #
>         # icmp type echo-request limit rate 5/second accept
> 
>         # allow SSH connections from some well-known internet host
>         ip saddr 81.209.165.42 tcp dport ssh accept
>     }
> 
>     chain inbound_private {
>         # accepting ping (icmp-echo-request) for diagnostic purposes.
>         icmp type echo-request limit rate 5/second accept
> 
>         # allow DHCP, DNS and SSH from the private network
>         ip protocol . th dport vmap { tcp . 22 : accept, udp . 53 : accept, tcp . 53 : accept, udp . 67 : accept}
>     }
> 
>     chain inbound {
>         type filter hook input priority 0; policy drop;
> 
>         # Allow traffic from established and related packets, drop invalid
>         ct state vmap { established : accept, related : accept, invalid : drop }
> 
>         # allow loopback traffic, anything else jump to chain for further evaluation
>         iifname vmap { lo : accept, $DEV_WORLD : jump inbound_world, $DEV_PRIVATE : jump inbound_private }
> 
>         # the rest is dropped by the above policy
>     }
> 
>     chain forward {
>         type filter hook forward priority 0; policy drop;

You could move these rules below the verdict map...

>         # port forwarding part 2/2
>         meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8443 ct state new accept
>         meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport 8080 ct state new accept
> 
>         # Allow traffic from established and related packets, drop invalid
>         ct state vmap { established : accept, related : accept, invalid : drop }

... 'ct state new,untracked' is implicitly assumed after vmap, so you
could move (and consolidate) this rule:

          meta iifname $DEV_WORLD ip daddr $IP_SERVER tcp dport { 8443, 8080 } accept

>         # connections from the internal net to the internet or to other
>         # internal nets are allowed
>         iifname $DEV_PRIVATE accept
> 
>         # the rest is dropped by the above policy
>     }
> 
>     chain postrouting {
>         type nat hook postrouting priority 100; policy accept;
> 
>         # hairpin part 2/2
>         ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8443 snat $ROUTER
>         ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport 8080 snat $ROUTER

Consolidate rule:

          ip saddr $NET_PRIVATE ip daddr $IP_SERVER tcp dport { 8080, 8443 } snat $ROUTER

however, if the routing table allows to reach your $IP_SERVER from
$NET_PRIVATE, then you do not need this NAT rule.

>         # masquerade private IP addresses
>         ip saddr $NET_PRIVATE oifname $DEV_WORLD masquerade
>     }
> }
> ==== end ====
> 
> 
