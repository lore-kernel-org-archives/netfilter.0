From: Stephen Satchell <list@satchell.net>
Subject: iif versus meta fib iif
Date: Sun, 24 May 2020 15:06:47 -0700
Message-ID: <f464fa81-93c2-62f4-9703-e84e35fb3d54@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

I'm trying to understand why the nft(8) responds the way it does, and 
perhaps try to understand the underlying operation of a netfilter firewall.

What is the difference between these selectors?

1. iif eth0
2. meta fib saddr iif eth0
3. meta fib daddr iif eth0

4. oif eth0
5. meta fib saddr oif eth0
6. meta fib daddr oif eth0

(1) tests what interface came from, irrespective of the source and 
destination address

(2) uses the routing table to find out where the packet would return

(3) uses the routing table to find out where the packet will be routed

(4) tests the interface associated with the routing decision that has 
been performed in the packet flow.  In theory. (3), (4) and (6) would 
return the same result.

(5) uses the routing table to find out where the packet would return

(6) uses the routing table to find out where the packet would be routed. 
  In theory, (4) and (6) would return the same result.

===
https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks

So here is the big question:  how can I determine the FIB's 
classification of the source address in rules in the output and 
postrouting tables?  In other words, how can I test that the source 
address denotes a uni-cast address that would return to this router?

The documentation is silent about restrictions on using the routing 
selectors.

I can understand why "oif eth0" is not permitted in ingress, prerouting 
and input tables, because the output routing decision hasn't been made yet.

The packet routing decision *has* been made in the forward, output, and 
postrouting table, so "oif eth0" should be allowed.


