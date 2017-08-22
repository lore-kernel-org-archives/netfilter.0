From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Create set and/or chain accessible across multiple tables
Date: Tue, 22 Aug 2017 14:08:20 -0700
Message-ID: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

In reworking my ruleset to get around the "NAT can't be in inet table" 
challenge, it is looking as though the accessible namespace for a table 
may be just that table itself.

If true, this would mean that if you're dual-stack and using NAT, you 
can't have a unified ruleset in inet, but have to replicate and maintain 
most everything in both ip and ip6 tables.

This was revealed in an attempt to manage a set containing the ports to 
be mapped in one place, then be able to access it from both IPv4 and 
IPv6 configuration (NAT, as well as traffic rules).  It isn't tidy or 
robust to have manage this "list of ports" for IPv4 NAT, potentially 
IPv6 NAT, IPv4 filtering, and IPv6 filtering (especially as 
add/remove(?) changes to multiple sets can't be easily done atomically).


I get the error

nftables.conf:21:32-47: Error: Set 'forwarded_ports' does not exist
         ip version 4 tcp dport @forwarded_ports dnat 192.168.1.2
                                ^^^^^^^^^^^^^^^^

when I try to declare @forwarded_ports in "table inet global"
I have the same problem if the table is "table ip global"


       1 #!/usr/sbin/nft -f
       2
       3 flush ruleset
       4
       5 table inet global {    # fails the same way with "table ip global"
       6
       7     set forwarded_ports {
       8         type inet_service
       9         elements = { 80, 443 }
      10     }
      11
      12 }
      13
      14 table ip nat_ip4 {
      15
      16     chain nat_rules_inbound_ipv4 {
      17         type nat hook prerouting priority 0
      18
      19         iifname != eth0 return
      20
      21         ip version 4 tcp dport @forwarded_ports dnat 192.168.1.2
      22
      23         return
      24
      25     }
      26
      27     chain nat_rules_outbound_ipv4 {
      28         type nat hook postrouting priority 100
      29
      30         return
      31     }
      32
      33 }


How can one define/access a single set to manage that can be accessed 
from multiple tables?

     define has a couple significant drawbacks:
       * It can't be dynamically modified
       * define = { } (empty set) is considered a syntax error


Thinking ahead about potential problems, how can one define/access a 
chain that can be accessed (jump/goto) from rules in another chain?


Thanks!

Jeff




