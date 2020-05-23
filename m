From: Stephen Satchell <list@satchell.net>
Subject: Is this a correct usage of the FIB facility of NFTABLES? (BCP-38)
Date: Sat, 23 May 2020 08:57:43 -0700
Message-ID: <782e0e4b-f471-9894-6569-a01d8cdeb6f8@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

I'm having quite a bit of difficulty wrapping my head around some of the 
syntax in nftables' nft utility.  So I'd like to concentrate my question 
on a set of similar statements that implement a specific idea.  This is 
part of my firewall implementation for BCP 38 using NFTABLES.

Question: what is incorrect about the following?

The goal for incoming WAN packets:
1.  Reject packets that will be routed right back out the WAN interface.
2.  Reject packets with destinations that are not unicast.
3.  Reject packets with sources that are not unicast
4.  Reject packets with sources not routed out the WAN interface

Assumptions: (1) the routing table will have all non-routable domains 
defined as black holes.  (ip route add blackhole 10.0.0.0/8 metric 999) 
(2) the routing table contains all internal netblocks not covered by 
local interface settings, with proper gateway addresses.

define wan0 = enp1s0
table inet filter {
     chain wan_prerouting {
         fib daddr oifname $wan0    counter drop # no in-n-out
         fib daddr type broadcast   counter drop # no non-unicast
         fib daddr type anycast     counter drop
         fib daddr type multicast   counter drop
         fib daddr type blackhole   counter drop
         fib daddr type unreachable counter drop
         fib daddr type prohibit    counter drop

         fib saddr type broadcast   counter drop # no non-unicast
        #fib saddr type anycast     counter drop
         fib saddr type multicast   counter drop
         fib saddr type blackhole   counter drop
         fib saddr type unreachable counter drop
         fib saddr type prohibit    counter drop

	fib saddr oifname $wan0    return
	counter drop
        }
     chain prerouting {
         type filter hook prerouting priority 0; policy accept;

         iifname $wan0 jump wan_prerouting
         }
     }

1.  The wan_prerouting chain will first test the destination address to 
see if it would be routed right back out the WAN interface, and if true 
drop it.

I know, I know, a packet that arrives at a router is supposed to have a 
destination address that relates in some way with that router.  A 
ne'er-do-well can contrive a way to send a packet with a "forged" 
destination address, so that the transaction involves *three* addresses: 
  the source address, the destination address, and an intermediate route 
address.

2-7.  Then the chain tests to see if the destination address defines 
something other than a unicast address, and if true drop it.  This 
blocks broadcast packets from the upstream -- in the current ISP model 
(and assuming no multicast) there is no reason for an ISP to send a 
broadcast packet to its client.

8-13.  Finally, the source address is tested to block anything other 
than sending response unicast packets upstream.  This is part of the 
requirements for BCP 38.  The reason that "anycast" test is commented 
out is because the router will convert anycast on output to the unicast. 
  Research will determine if this test should stand.

14-15.  This final check verifies the incoming WAN packet has a source 
address that would go out the WAN interface.  This blocks ne'er-do-wells 
from using the router from DDoSing an internal node.
