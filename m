From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Questions re iproute2, netfilter, and locally sourced packets
Date: Sat, 13 May 2006 18:04:00 +1200
Message-ID: <446576D0.2050407@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have the following setup:

[ internet ]---[ ADSL NAT modem ]---[ linux box ]----[Host A, Host B, Host C]

I have an ppp over ssh tunnel established from my linux box to a server at work, via the internet.  Packets entering the tunnel are masqueraded to the ppp interface's address. Default route is via the ADSL modem, which also performs NAT.

Now, here's where it gets tricky. Host A is allowed to route via ssh tunnel to work, but packets from Host B to the same destination must be sent out the default route.

So to achieve this, I set up another routing table, added a name for it into /etc/iproute2/rt_tables, added an "ip rule from [HostA] lookup vpn", and in the script that brings the tunnel up, routes are added for my work's netblocks via the ppp link to the vpn route table. This much all works.  

In the same script, I enable masquerading on the ppp interface. This appears not to work, because if I sniff from a machine on the other side of the tunnel (ie, at work), packets emerging from it still have their original IP addresses from my local subnet on them, and this obviously causes issues for the reply to get back. "iptables -v -t nat -L POSTROUTING" shows that packets are hitting the MASQUERADE rule and the out interface is ppp0, as expected, but nevertheless, source addresses are not being changed as demonstrated by the packet sniffing mentioned above.

To make things more complicated, not only is Host A allowed to route via the tunnel, but packets sourced from the linux router itself should also be allowed to go that way (or to put it another way, everything but host B and Host C should be allowed to use the tunnel).

The trouble is, while I can allow packets from the linux router by adding: "ip rule add prior 50 lookup vpn" (which obviously allows everything to use the tunnel), I can't figure out how to specifically allow locally generated packets without allowing everything unconditionally.

I considered that perhaps this would be better solved by going back to a single table, and using iptables to allow or deny packets headed to my work's netblock based on their source address. The drawback with that is that I can't say 'I want you to go this way, and you to go that way' with this approach - I can only say "you go this way, and I'll drop your packet entirely"

And finally, I have another "ip rule" which matches packets entering eth1 (the internet side) of the linux box from my linux server at work. The only way they can enter from that side is if they were destined to my modem's external address, so I have to send them back the same way, and that ip rule entry deals with that.

So, two problems need solving here - 

1. why isn't masquerading working (I read a posting that suggested that iptables and iproute2 don't play fair with each other and that may be the problem)

2. How can I identify to "ip rule" packets that are locally sourced ? (Possibly with a fwmark, but I'm not sure how to identify packets to add the mark to)






