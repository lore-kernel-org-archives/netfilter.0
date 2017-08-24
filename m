From: Jeff Kletsky <netfilter@allycomm.com>
Subject: Re: NFTABLES - Can we do filtering based on SRC address before doing
 DNAT
Date: Thu, 24 Aug 2017 07:18:59 -0700
Message-ID: <69227d2c-3f6a-7b24-9224-7886979af84c@allycomm.com>
References: <645e0d25-9505-b703-023c-75c5a5878494@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <645e0d25-9505-b703-023c-75c5a5878494@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: khawar shehzad <shehzad.khawar@gmail.com>, netfilter@vger.kernel.org

I can't speak for iptables, but my initial testing of netfilter using 
its trace feature suggests that you can split a given "phase" up into 
pre-nat, nat, and post-nat chains with different priorities and have 
them execute sequentially.

I have not found any documentation that indicates if the nftables 
priority system interacts with the netfilter priority system, so I am 
planning to use priorities within nftables that intermesh with those of 
netfilter. This *hopefully* will mean that IPv4 defragmentation and 
conntrack happen at the "right" time, relative to nftables chain execution.

Potential gotchas in this include:

* nat chains are required for both prerouring and postrouting
* nat chains *must* be in ip or ipv6 tables, not inet tables
* accept-ing a packet in one chain does not bypass future chains in the 
same phase
* I have not found documentation on the interactions of netfilter and 
nftables priorities

The netfilter priorities are described on 
<https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains> 
or /usr/include/linux/netfilter_ipv4.h


I'm still working through my ruleset here, but my plan is as follows:

# PREROUTING
#
# pre-NAT       -175    After CONNTRACK, before MANGLE
# NAT            -75    After MANGLE and NAT_DST, before FILTER
# post-NAT       -50    After NAT_DST, before FILTER


# INPUT
#
# filter         -50    After NAT_DST, before FILTER

# FORWARD
#
# filter         -50    After NAT_DST, before FILTER

# OUTPUT
#
# filter         -50    After NAT_DST, before FILTER

# POSTROUTING
#
# pre-NAT        -50    After NAT_DST, before FILTER
# NAT            125    After NAT_SRC, before SELINUX_LAST
# post-NAT       175    After NAT_SRC, before SELINUX_LAST

I'm far from a netfilter or nftables expert, but this at least feels 
safer than ignoring the netfilter priorities. I have yet to find any 
documentation of how the nftables priorities interact with those of 
netfilter.


Here's the rule set I used to see if I could control the execution of 
NAT relative to the execution of tests in pre- and post-NAT chains. This 
poke-with-a-stick rule set DNATs telnet to a different IP configured on 
the same host, 10.11.12.13. It does *not* use the priorities I outlined 
above. (No intentional reason why the trace statement for postrouting 
isn't in the earliest chain to run.)

#!/usr/sbin/nft -f
flush ruleset
table ip global {
     chain prerouting_m1000 {
         type filter hook prerouting priority -1000
         tcp dport telnet meta nftrace set 1
         continue
     }
     chain prerouting_0 {
         type filter hook prerouting priority 0
         iif lo accept
         continue
     }
     chain nat_in_10{
         type nat hook prerouting priority 10
         tcp dport telnet meta nftrace set 1
         tcp dport telnet dnat 10.11.12.13
         continue
     }
     chain prerouting_1000 {
         type filter hook prerouting priority 1000
         accept
     }
     #####
     chain output_m1000 {
         type filter hook output priority -1000
         tcp sport telnet meta nftrace set 1
         continue
     }
     chain output_0 {
         type filter hook output  priority 0
         oif lo accept
         continue
     }
     chain output_1000 {
         type filter hook output  priority 1000
         accept
     }
     ####
     chain postrouting_m1000 {
         type filter hook postrouting priority -1000
         continue
     }
     chain nat_out_m100 {
         type nat hook postrouting priority -100
         tcp dport telnet meta nftrace set 1
         continue
     }
     chain postrouting_0 {
         type filter hook postrouting priority 0
         accept
     }
     chain postrouting_1000 {
         type filter hook postrouting priority 1000
         accept
     }
}


On 8/24/17 2:23 AM, khawar shehzad wrote:
> Hi all,
>
> I hope all is well.
>
> Can we do filtering based on the source address before doing DNAT in 
> nftables?
>
> If so are there any directions for them OR is there something that I 
> need to know.
>
> I heard that it can be done in iptables using raw table. But what 
> about nftables? I need to do it with nftables because I want to make 
> use of latest features e.g. verdict maps.
>
> Cheers,
>
> Khawar
>
> Infoginx.com
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

