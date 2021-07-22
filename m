From: Stephen Satchell <list@satchell.net>
Subject: Criticism welcome: nftables rp_filtering in and out
Date: Wed, 21 Jul 2021 19:42:28 -0700
Message-ID: <29f40838-4371-2768-fcae-59becd824f4f@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

Goal: to block the transfer of packets with bogus source addresses, in 
and out.  Also, block non-unicast packets out to the Internet.  "enp1s0" 
is the Internet uplink interface, "enp2s0" is the LAN interface.table

raw/PREROUTING is the first table/chain an incoming packet takes from 
the Internet or from the LAN.  The mangle/POSTROUTING is the first 
table/chain hit from either forwarding or from locally generated packets.

If the system in which this nftables implementation were living had 
uncontrolled users, I'd also put in some fences in raw/OUTPUT.  Not the 
case, in this instance.


> inet raw {
> 	chain PREROUTING {
> 		type filter hook prerouting priority mangle; policy accept;
> 		
> 		iifname "enp1s0" fib saddr type != unicast drop
> 		fib saddr oif 0 drop
> 	}
> 
> 	chain INPUT {
> 		type filter hook input priority mangle; policy accept;
> 	}
> 
> 	chain FORWARD {
> 		type filter hook forward priority mangle; policy accept;
> 	}
> 
> 	chain OUTPUT {
> 		type route hook output priority mangle; policy accept;
> 	}
> 
> 	chain POSTROUTING {
> 		type filter hook postrouting priority mangle; policy accept;
> 	}
> }
> table inet mangle {
> 	chain PREROUTING {
> 		type filter hook prerouting priority mangle; policy accept;
> 	}
> 
> 	chain INPUT {
> 		type filter hook input priority mangle; policy accept;
> 	}
> 
> 	chain FORWARD {
> 		type filter hook forward priority mangle; policy accept;
> 	}
> 
> 	chain OUTPUT {
> 		type route hook output priority mangle; policy accept;
> 	}
> 
> 	chain POSTROUTING {
> 		type filter hook postrouting priority mangle; policy accept;
> 		
> 		oifname "enp1s0" fib saddr type != unicast drop
> 		fib saddr oif 0 drop
> 	}
> }
