From: Mailing List Reader <mlreader@lucomp.net>
Subject: broken SNAT with fixed external MTU
Date: Thu, 14 Oct 2004 18:15:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416EA61A.9030600@lucomp.net>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello everybody,

My DSL router (very bad firmwares) wants me to force the MTU
(buggy MTU auto-setting). The firewall has a public IP and mtu 1500:

---snip
#route to the router net
ip route add 192.168.1.0/24 dev eth1 mtu 1440
# default to the router (mtu not needed here)
ip route add default via 192.168.1.1 mtu 1440
--snip

the firewall itself NATs one client back-to-back connected
(cable checked!):

---snip
#mss clamping 1)
iptables -A FORWARD -d $net1 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--set-mss 1440
iptables -A FORWARD -s $net1 -p tcp --tcp-flags SYN,RST SYN -j TCPMSS 
--set-mss 1440

#snat 2)
iptables -t nat -A POSTROUTING -j SNAT -o $out -s $net1 --to-source <other 
public IP>
---snip

Now:
1) mss clamping because tcpdumping I saw DF 1500 MTU packets
from the client being sent to the router. This would not work, the
(buggy) router has MTU 1500, the DSL line can't handle it (see above)
but of course no "fragmentation  needed" would come, so I thought forcing
the mss both ways would do. It seems to, no more "1500" packets.

2) pure SNAT one-to-one (to another unused IP)
The firewall only has few single lower ports being filtered (on the basis
of its IP, not the NATted clients one).


To come to the problem: everything is OK in these cases:
-firewall-external servers/internet
-firewall-same network servers
-firewall and same network servers - client

but in this case:
-client-internet (SNAT)
everything OK for 30 to 60 secs, then like a buffer getting filled
then stuck, everyting stops for about 30 seconds (streams get
lost, sockets go in timeout) <only> to internet.
I see nothing in tcpdump (but silence) no traffic whatsoever
nor coming nor going to the client (from/to the internet)


I've tried disabling all filtering, changing interfaces, (client)
operating systems, the cable, many iptables tests. Nothing yet.
I won't  force a lower MTU on the internal net.

I'm not sure about my mss solution, but this does not look like an
MTU issue: (it happens on any connection, any size of packets).
With a working DSL router with good MTU self-clamping everything
is just <fine>, though!

I'm lost. Any suggestion? Should I mangle the SNAted packets in some
way I don't get?


Cheers, any idea much appreciated,

Luigi Corsello





