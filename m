From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Diagnosing "Error: NAT is only supported for IPv4/IPv6"
Date: Mon, 21 Aug 2017 14:42:25 -0700
Message-ID: <5156c091-4b06-9efd-fd33-9a117f526572@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Objectives:

* Get DNAT working for IPv4 on "if_external"

* Get SNAT working for IPv4 on "if_external"

* Be able to easily draft, manage, and read rule execution "around" NAT
   (some rules before NAT, others after,
    with one "pair" for inbound and another pair for outbound packets)


TL;DR:

Ruleset parses and works as expected without NAT statements.

Adding simple NAT statements results in "meaningless" reference in error 
message:

     In file included from nftables.conf:114:5-45:
     ./blackhole_check_internal.nft:6:54-57: Error: NAT is only 
supported for IPv4/IPv6
     nal_allowed_net {
^^^^

That's a non-sequetor, nowhere near any NAT-related statement.

The NAT-related statements are in an "inet" table.

The NAT-related statements are all "protected" with "ip version 4" now,
and the problem still persists.

How do I locate the problem?




nftables.conf (excerpts):


       1 #!/usr/sbin/nft -f
       2
       3 flush ruleset
       4
       5 table inet global {
       6
       7     define if_external = eth1
       8     define if_internal = eth0

[...]

     101     #
     102
     103     include "./nat_rules_inbound_ipv4.nft"
     104     include "./nat_rules_outbound_ipv4.nft"
     105
     106     #
     107
     108     include "./postrouting_ext_int.nft"
     109     include "./postrouting_int_ext.nft"
     110
     111     #
     112
     113     include "./blackhole_check_external.nft"
     114     include "./blackhole_check_internal.nft"
     115
     116     #

[...]

     123     chain prerouting {
     124         type filter hook prerouting priority 0
     125         policy drop

[...]

     273     chain postrouting {
     274         type filter hook postrouting priority 0
     275         policy drop

[...]


Yes, I'm aware that I'm revealing the testing IPs and nets here

Yes, I've already run into what appears to be a 32-character limit on 
chain names and changed the names as a result
(No thanks to "Numerical result out of range" and "No such file or 
directory" error messages in finding *that* problem)

blackhole_check_internal.nft

       1 define if_internal_ip = { 10.10.10.131, 10.10.10.255 }
       2
       3 set if_internal_allowed_net {
       4     type ipv4_addr
       5     flags interval
       6     elements = { 10.10.10.0/24 }
       7 }
       8
       9
      10 chain blackhole_check_internal_pre {
      11
      12     ip saddr != @if_internal_allowed_net jump blackhole_src
      13
      14     ip daddr != $if_internal_ip jump blackhole_dst
      15
      16     return
      17 }
      18
      19
      20 chain blackhole_check_internal_post {
      21
      22     ip saddr != $if_internal_ip jump blackhole_src
      23
      24     ip daddr != @if_internal_allowed_net jump blackhole_dst
      25
      26     return
      27 }


The reference to

./blackhole_check_internal.nft:6:54-57

appears to be a complete non-sequetor, at least as far as NAT goes.
(The ruleset, without the NAT includes and jumps parses, compiles, and 
works as expected)



nat_rules_inbound_ipv4.nft:

       1 chain nat_rules_inbound_ipv4 {
       2
       3     iifname != $if_external return
       4
       5     ip version 4 tcp dport @forwarded_ports_wildside dnat $wildside
       6
       7     return

       8 }

nat_rules_outbound_ipv4.nft

       1 chain nat_rules_outbound_ipv4 {
       2
       3     oifname != $if_external return
       4
       5     ip version 4 snat $wildside
       6
       7     return
       8 }


$wildside is an IPv4 address literal in dotted-quad notation

@forwarded_ports_wildside is of "type inet_service" and is non-empty


Both the dnat and snat expressions, themselves, are restricted to IPv4, 
as a futile attempt to convince nft that it is only NAT-ing IPv4

In prerouting chain:

     iifname $if_external jump nat_rules_inbound_ipv4

In postrouting chain:

     oifname $if_external jump nat_rules_outbound_ipv4

(this approach allows me to have rules before and after the NAT in the 
prerouting and postrouting chains)


How do I go about deducing what the real problem here is?

Thanks,


Jeff




