From: Phil Stoneman <pws@corefiling.com>
Subject: TTL Exceeded packets coming from the original packet destination
Date: Tue, 24 May 2011 16:44:51 +0100
Message-ID: <4DDBD273.3070405@corefiling.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all

I've been searching google and these archives, and not found a useful 
answer to this, so I wonder here if someone can help me?

We have a range of public IPs allocated to us by our ISP. Our linux 
router sits on one of those, and another of those is NATed through to a 
host in our DMZ. Traceroutes from the outside world which get dropped by 
the linux router have the TTL exceeded packet generated with the source 
set to the original UDP packet destination - not set to an interface 
address of the linux router.

This gives us something like this:

pws@externalhost:~$ traceroute -n 90.155.100.39
traceroute to 90.155.100.39 (90.155.100.39), 30 hops max, 40 byte packets
<snip>
  4  195.66.224.223  1.236 ms  1.249 ms  1.275 ms
  5  213.229.97.181  2.328 ms  2.327 ms  2.304 ms
  6  90.155.100.39  5.476 ms  5.050 ms  5.087 ms
  7  90.155.100.39  5.266 ms  5.381 ms  5.406 ms

Which isn't as I'd expect (I'd expect hop 6 to be the interface address 
of the linux router).


Network details (monospace font):

InsideHost<----->Linux Router<----->Outside world
          |       |          |       |
10.0.250.2       |          |       |
         10.0.250.1          |       |
                90.155.100.198       |
                        90.155.100.193

Relevant iptables rules:
iptables.eth-ext:-A PREROUTING -i vlan90 -j preroutingaa
iptables.eth-ext:-A preroutingaa -d 90.155.100.39    -j DNAT 
--to-destination 10.0.250.2
iptables.eth-ext:-A POSTROUTING -j sourcenat
iptables.eth-ext:-A sourcenat -s 10.0.250.2 -o vlan90 -j SNAT 
--to-source 90.155.100.39

I'm on a Debian 6.0.1 system, with kernel 2.6.32-5-686 in case that's 
relevant.


I don't know if this is being caused by the conntrack stuff doing some 
undesired NAT on the ICMP responses, or if it's related to this posting 
I found on google: http://www.spinics.net/lists/lartc/msg18454.html

Anyway, could someone help me work out what I need to do to make 
traceroutes happen properly please?


Thanks!

Phil
