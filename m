From: Patrick van der Smagt <smagt@dlr.de>
Subject: DNAT problem from machine with 2 IP's
Date: Tue, 29 Oct 2002 07:11:42 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.40.0210290657180.12006-100000@amazonas.robotic.dlr.de>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm unable to solve the following problem.  I have a SuSE Linux 8.0
machine with a real IP, say 12.12.12.2, which has a secondary IP
12.12.12.3 (created by creating the file /etc/sysconfig/net/ifcfg-eth0:1).

This machine is also connected, using a VPN connection (ppp0) to a second
machine, which has a virtual IP.  Ifconfig excerpt:

eth0   Link encap:Ethernet
       inet addr:12.12.12.2  Bcast:12.12.12.255 Mask:255.255.255.0
       UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
       RX packets:501656 errors:0 dropped:0 overruns:0 frame:0
       TX packets:120131 errors:0 dropped:0 overruns:0 carrier:0
       collisions:0 txqueuelen:100
       RX bytes:39036759 (37.2 Mb)  TX bytes:16703664 (15.9 Mb)
       Interrupt:5 Base address:0xac00

eth0:1 Link encap:Ethernet
       inet addr:12.12.12.3  Bcast:12.12.12.255 Mask:255.255.255.0
       UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
       Interrupt:5 Base address:0xac00

ppp0   Link encap:Point-to-Point Protocol
       inet addr:10.1.0.1  P-t-P:10.1.0.100  Mask:255.255.255.255
       UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1000  Metric:1
       RX packets:36 errors:0 dropped:0 overruns:0 frame:0
       TX packets:56 errors:0 dropped:0 overruns:0 carrier:0
       collisions:0 txqueuelen:3
       RX bytes:2191 (2.1 Kb)  TX bytes:3261 (3.1 Kb)

Now, what I want to do is give the second (ppp0) machine a real IP, viz.
12.12.12.3.

I'm using iptables to do so:
  iptables -t nat -D PREROUTING --dst 12.12.12.3 \
	-j DNAT --to-destination 10.1.0.100
  iptables -t nat -D POSTROUTING --dst 10.1.0.0/24 \
        -j DNAT --to-destination 12.12.12.3
  iptables -t nat -D OUTPUT --dst 12.12.12.3 \
        -j DNAT --to-destination 10.1.0.100
The first and second rule work fine, with those I can reach my machine
10.1.0.100 at address 12.12.12.3. However, I cannot reach the machine from
12.12.12.2 itself.  When I telnet to port 110 from .2 to .3, I find in
/etc/net/ip_conntrack:

tcp      6 118 SYN_SENT src=12.12.12.3 dst=12.12.12.3 sport=2996
dport=110 [UNREPLIED] src=10.1.0.100 dst=12.12.12.3 sport=110
dport=2996 use=1

!! which shows me that the connection comes from .3 (the secondary IP of
my host)!  My theory: if it goes out as .3 and comes from 10.1.0.100 back
to .3, it is immediately routed out to 10.1.0.100 again and will never
reach .2.  Nonetheless I did not manage to change the iptables to get this
going...

Please help!

Patrick


