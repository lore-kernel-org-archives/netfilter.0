From: "Guilherme Cox" <cox@sinistro.net>
Subject: Multicast routing question...
Date: Thu, 28 Aug 2003 22:36:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MCEJJKCAIMHFOKODABEIGEDCHNAA.cox@sinistro.net>
Reply-To: <cox@ieee.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'd like to know if I can use iptables to solve one problem.

My network is:
<----Local Network/NAT (192.168.7.x)              -- eth0
<----Internet link/Cisco router                   -- eth1
<----ViaSat router/A Satelite link(10.254.103.x)  -- eth2

My default gateway is the Cisco router IP.
I have static routes to networks connected using eth2.

My /sbin/route  is:
cox@earth:~$ /sbin/route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
xxx.xxx.xxx.128  0.0.0.0         255.255.255.192 U     0      0        0
eth1
192.168.7.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.149.0   10.254.103.1    255.255.255.0   UG    0      0        0 eth2
yyy.yyy.yyy.0   10.254.103.1    255.255.255.0   UG    0      0        0 eth2
10.254.103.0    0.0.0.0         255.255.255.0   U     0      0        0 eth2
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
224.0.0.0       0.0.0.0         240.0.0.0       U     0      0        0 eth0
0.0.0.0         xxx.xxx.xx.129  0.0.0.0         UG    1      0        0 eth1

--x--
Using this model the Multicast packets came from eth2 aren't routed to my
Local Network (eth0).
If I connect the VaiSat router on my switch and use ip-aliases, I can
receive the IGMP. However, it is unsafe. I need to mantain my network but
the multicast packets must be routed to eth0.

Do you know how can I do? Any ideias? Did anybody have the same problem?

If you want more information about my network, please contact me.

Thanks and sorry my english mistakes.

cox


