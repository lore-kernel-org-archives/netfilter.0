From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: shaping vlans - revisited
Date: Fri, 4 Feb 2011 12:05:33 -0200
Message-ID: <20110204120533.7f470bab@pulsar.inexo.com.br>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
	<1296759048.7587.3.camel@andybev>
	<20110203180118.62970fb1@pulsar.inexo.com.br>
	<1296788356.7587.70.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296788356.7587.70.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 04 Feb 2011 02:59:16 +0000
Andrew Beverley <andy@andybev.com> wrote:


> Stupid question - can you not just attach your qdisc to the vlan
> interface and mark the traffic on the vlan interface as well, as if it
> was eth1?  

You mean "tc qdisc add dev vlanX ..." + "iptables ... -j IPMARK ..." ??

No. This must not be done. I have now 6 vlans (3 for IPv4 and 3 for IPv6)
each pair to one ISP. The only way I know (if you guys know another way,
please advise) to shape *_global_* aggregated traffic for each client is to attach to eth1 an not to individual vlans. 

> 
> Alternatively, if the root qdisc is seeing all the packets but it's the
> marking that's not working, then can you not just mark on the vlan
> interface rather than eth1?  

# iptables -L POSTROUTING -t mangle -v
Chain POSTROUTING (policy ACCEPT 3868M packets, 1901G bytes)
 pkts bytes target     prot opt in     out     source               destination         
 2257  404K IPMARK     all  --  any    eth0    anywhere             anywhere            mark match !0x0 IPMARK dst ip and 0xffff or 0x20000
58092   46M IPMARK     all  --  any    eth0    anywhere             anywhere            mark match 0x0 IPMARK dst ip and 0xffff or 0x0
  997  117K IPMARK     all  --  any    vlan+   anywhere             anywhere            mark match !0x2 IPMARK src ip and 0xffff or 0x0
43665 6668K IPMARK     all  --  any    vlan+   anywhere
anywhere            mark match 0x2 IPMARK src ip and 0xffff or 0x40000

But...

# tc -s filter sh dev eth1|grep success
  mark 0x2101 0xffff (success 0)
  mark 0x2e03 0xffff (success 0)
  mark 0x2288 0xffff (success 0)
  mark 0x2012 0xffff (success 0)
  mark 0x2645 0xffff (success 0)
  mark 0x2108 0xfff8 (success 0)
(Very long list follows)

I am pretty sure that or the marking or filtering  (or both!) is not
working.
I can see traffic through root class and through default htb class
(2:ffff).
All traffic is through default class telling me marking/filtering is not
ok.

class htb 2:1 root rate 102400Kbit ceil 102400Kbit burst 52992b cburst 52992b 
 Sent 92926111 bytes 500251 pkt (dropped 0, overlimits 0 requeues 0) 

class htb 2:ffff parent 2:1 leaf ffff: prio 7 rate 5145Kbit ceil 5145Kbit burst 4181b cburst 4181b 
 Sent 93253253 bytes 500253 pkt (dropped 1037, overlimits 0 requeues 0) 


Ethy
