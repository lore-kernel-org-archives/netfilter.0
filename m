From: Patrick van der Smagt <smagt@dlr.de>
Subject: giving a real IP to a ppp-connected host
Date: Thu, 31 Oct 2002 08:37:50 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.40.0210310807130.12649-100000@amazonas.robotic.dlr.de>
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

I posted this a few days ago, but either everyone is dazzled by my problem
(unlikely!) or else bored by the same---nonetheless I desparately need
this thing solved, and I'm too dumb to do so.

My problem is the following.  I have a SuSE Linux 8.0 machine with a real
IP on interface 0, say 12.12.12.2.  I've also given it a secondary IP
12.12.12.3 also on interface 0 (created by creating the file
/etc/sysconfig/net/ifcfg-eth0:1).

To my host a second machine is connected using a ppp connection, and it
has the local IP 10.1.0.100.  What I want to do is to give the remote
machine a permanent IP, viz. 12.12.12.3.

Ifconfig on my host 12.12.12.2 shows me (I removed/changed sensitive info):

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

I've set up iptables as follows to do what I want:
  iptables -t nat -D PREROUTING --dst 12.12.12.3 \
        -j DNAT --to-destination 10.1.0.100
  iptables -t nat -D POSTROUTING --dst 10.1.0.0/24 \
        -j DNAT --to-destination 12.12.12.3
  iptables -t nat -D OUTPUT --dst 12.12.12.3 \
        -j DNAT --to-destination 10.1.0.100
The first and second rule work fine, with those I can reach my machine
10.1.0.100 at address 12.12.12.3 from all hosts, except 12.12.12.2 (of
course). That's what the third rule is for.  However, rule 3 does not
do everything for me.  After setting up all of the above rules, when I
telnet to port 110 from .2 to .3, I find in /proc/net/ip_conntrack on .2:

tcp      6 118 SYN_SENT src=12.12.12.3 dst=12.12.12.3 sport=2996
dport=110 [UNREPLIED] src=10.1.0.100 dst=12.12.12.3 sport=110
dport=2996 use=1

or

tcp      6 57 SYN_RECV src=12.12.12.3 dst=12.12.12.3 sport=2996
dport=110 src=10.1.0.100 dst=12.12.12.3 sport=110
dport=2996 use=1

which, if I interpret it correctly, shows me that the connection comes
from .3 (the secondary IP of my host, which was intended for my
ppp-connected host)!  My theory: if the packet leaves my host as .3,
reaches 10.1.0.100, and a reply goes to .3, it is immediately routed
out to 10.1.0.100 again and will never reach .2.  Not sure if
this theory is correct, since I noticed no connection at all on
my ppp-connected machine.

Nonetheless I did not manage to change the iptables to get this going...

Please help!

Patrick
-- 
Dr Patrick van der Smagt                phone +49 8153 281152, fax -34
DLR/Institute of Robotics and Mechatronics                smagt@dlr.de
P.O.Box 1116, 82230 Wessling, Germany     http://www.robotic.de/Smagt/


