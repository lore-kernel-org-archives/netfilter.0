From: "Frank Eyermann" <Frank.Eyermann@unibw.de>
Subject: Bridge, NAT Problem, Packets are lost in the kernel
Date: Thu, 10 Aug 2006 16:20:10 +0200
Message-ID: <002301c6bc88$19918860$423fc189@informatik.unibwmuenchen.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello Netfilter-Community,

I have a Linux-machine, which has three interfaces. The machine runs a
firewall, separating a wireless network, connected to eth1 (with private
Ips), my "normal" internal network (with public Ips, eth0) and the Internet
(eth2). As the machine is virtualized with Xen, eth1 is in a bridge,
together with a virutal interface of the virtualized os (it's running also
Linux and a Radius-Server).

I want my wireless clients being able to access the Internet, therefore I
need to masquerade (SNAT) the traffic from the brigde, for outgoing
connections. 

The iptables rule I use is:

iptables -t nat -A POSTROUTING -s 192.168.101.0/24 -d ! 192.168.101.0/24 -j
MASQUERADE
(192.168.101.0/24 is the network with my wireless clients).

But then all packets are somewhere lost in the kernel. Without the rule,
(when doing simply routing), a ping to a machine in the network of eth0
works fine.

I have the following setup (eth2 not shown):

                      +--------+ +-------+
                      |FW      | |Radius |
Internet-Connection   |(Xen0)  | |(XenU) |
----------------------|        | |       |
                 eth0 | vif0.1 | |       |
                      |   |    | |       |
                      |+--+-------------+|
                   ----|bridge (xenbr0) ||
                 eth1 |+----------------+|
                      +--------+ +-------+

When I start xend, a bridge is set up (I'm using network-bridge and
vif-bridge), netdev is eth1. This means bridge xenbr0 is connected to eth1,
vif0.2 and vif1.0 (for the XenU-domain).

I did a lot of debuging, using ebtables to log the way of the packets
through the bridge-code. But without success. What is strange for me, that
the out-interface is the virtual one of Xen, not eth0. 

Aug 10 15:04:22 inst3gw kernel: eb-nat-POSTROUTING IN= OUT=vif0.2 MAC source
= 00:16:3e:27:5e:a1 MAC dest = 00:11:43:ce:7b:25 proto = 0x0800 IP
SRC=192.168.101.250 IP DST=<public-ip>, IP tos=0x00, IP proto=17 SPT=32768
DPT=53 Aug 10 15:04:22 inst3gw kernel: ip-LOG-POSTROUTING:IN= OUT=network192
PHYSIN=vif1.0 PHYSOUT=vif0.2 SRC=192.168.101.250 DST=<public-ip> LEN=74
TOS=0x00 PREC=0x00 TTL=64 ID=25382 DF PROTO=UDP SPT=32768 DPT=53 LEN=54

I even tried to influence the routing decision by dropping packets in the
BROUTING table (to force routing by the IP-Layer), but then I didn't see the
packets anymore.

I hope some can help me,

Many thanks in advance,

Best regards,

Frank

--
Dipl.-Inform. Frank Eyermann
Department of Computer Science
Systems Information Laboratory
University of the Federal Armed Forces, Munich, Germany


