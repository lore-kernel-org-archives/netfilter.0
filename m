From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: blocking dhcp on bridge
Date: Sun, 6 Feb 2005 16:01:54 -0500
Message-ID: <20050206210154.GA20344@mtholyoke.edu>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am running a dhcp server on a bridging firewall.  The dhcp server runs
on br0.  I have eth0 connected to my 'private' network, and eth1
connected to my 'public' network.

I only want this dhcp server to service dhcp requests from the private
network.  Any dhcp requests entering via eth1, or any dhcp replies being
sent via eth1 should be dropped.

(On the alternative solutions front... NAT'ing isn't really an option; I
have administrative staff on the private side of the bridge who need
access to an exchange server (ack, not mine!).  Stupid exchange mail
server needs to be able to initiate contact to the clients sometimes.
The whole setup is basically predicated on the need to treat
unregistered computers on the private side of the bridge differently
than unregistered computers on the public side.  I'd really rather not
add yet more hardware to this setup if possible..)

I have tried various combinations of physdev prerouting postrouting
input output etc. rules, but have yet to successfully prevent this box
from recieving and responding to dhcp requests from the public network.
In the set of rules I'm trying below, for example, you can see that I'm
dropping at least some packets with a bootpc source port (but not all,
see tcpdump output below).  None of the other rules are catching any
packets at all.

382# iptables -L -v -t nat
Chain PREROUTING (policy ACCEPT 4882K packets, 2316M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp dpt:bootps
    0     0 DROP       udp  --  eth1   any     anywhere             anywhere            udp spt:bootpc
   64 21106 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-in eth1 udp spt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-in --physdev-in eth1 udp dpt:bootps

Chain POSTROUTING (policy ACCEPT 1348K packets, 227M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp spt:bootps
    0     0 DROP       udp  --  any    eth1    anywhere             anywhere            udp dpt:bootpc
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 --physdev-is-bridged udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp spt:bootps
    0     0 DROP       udp  --  any    any     anywhere             anywhere            PHYSDEV match --physdev-is-out --physdev-out eth1 udp dpt:bootpc

You can see in the tcpdump output that follows that dhcp requests are
still being recieved and responded to (I can tell you from the mac
addresses involved that these requests are on the 'public' network.)
(fil49a is the dual-homed box I'm talking about).

15:50:23.264842 IP fil49a.mtholyoke.edu.bootps > n227-35.mtholyoke.edu.bootpc: BOOTP/DHCP, Reply, length: 300
15:50:23.265473 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 00:04:5a:58:24:5b, length: 300
15:50:28.463293 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 00:02:2d:7e:1a:5c, length: 300
15:50:28.463699 IP fil49a.mtholyoke.edu.bootps > n229-76.mtholyoke.edu.bootpc: BOOTP/DHCP, Reply, length: 300
15:50:33.269991 IP 0.0.0.0.bootpc > 255.255.255.255.bootps: BOOTP/DHCP, Request from 00:04:5a:58:24:5b, length: 300

I'm using iptables 1.2.9 on Ubuntu linux 2.6.8.1-4-686.

?

-- 
Ron Peterson
Network & Systems Manager
Mount Holyoke College
http://www.mtholyoke.edu/~rpeterso

