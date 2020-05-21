From: Stephen Satchell <list@satchell.net>
Subject: FIB filtering (comments, please) (reformatted)
Date: Thu, 21 May 2020 13:16:44 -0700
Message-ID: <74901dd8-0b12-b22d-4447-16ad9991298b@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

I'm taking a stab at answering my own question about using the FIB to 
filter unwanted packets, as suggested by BCP-38.

Assumption: the FIB (routing table) has entries for all inside networks 
with proper gateway entries.  For many edge routers, the FIB gains 
information from the network interfaces configurations.  One of those 
network interfaces is the WAN, or uplink, interface.

Assumption: Non-routed netblocks are in the FIB as "black hole". Ditto 
netblocks that are administratively blocked.

Section 3 of BCP-38 talks about restricting forged traffic.

* edge router MUST NOT send any packet with a source address
   not in the router itself or in the inside network.
* edge router MUST NOT send broadcast packets upstream
* edge router MAY drop received upstream broadcast packet

So my attempt at blocking bad traffic looks something like this:

> define wan0 = enp1s0
> table inet filter {
>     chain wan_prerouting {
>         fib saddr . mark oif $wan0       counter drop # no in-n-out
>         fib daddr . iif type broadcast   counter drop # no non-unicast
>         fib daddr . iif type anycast     counter drop
>         fib daddr . iif type multicast   counter drop
>         fib daddr . iif type blackhole   counter drop
>         fib daddr . iif type unreachable counter drop
>         fib daddr . iif type prohibit    counter drop
>         }
> 
>     chain wan_output {
>         fib saddr . iif type broadcast   counter drop # no non-unicast
>        #fib saddr . iif type anycast     counter drop (unicast)
>         fib saddr . iif type multicast   counter drop
>         fib saddr . iif type blackhole   counter drop
>         fib saddr . iif type unreachable counter drop
>         fib saddr . iif type prohibit    counter dro
>         }
> 
>     chain prerouting {
>         type filter hook prerouting priority 0; policy accept;
> 
>         iifname $wan0 jump wan_prerouting
>         }
> 
>     chain output {
>         type filter hook output priority 0; policy accept;
> 
>         iifname $wan0 jump wan_output
>         }

For those edge routers with full BGP tables, this netfilter code should 
block packets from being sent to subnet broadcast addresses.
