From: "Jee J.Z." <jz105@york.ac.uk>
Subject: network setup help
Date: Sat, 10 Apr 2004 19:54:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008301c41f2d$4be932e0$68892090@grouse>
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

Dear all,

I am trying to setup three PCs and do some simple filter+nat jobs. I'm a
green hand on netfilter and linux and seem to always get something wrong. I
apologize that my current problem has not reached the range of netfilter;
instead, it's about network configuration. But I believe people on this list
are very experienced on it. The situation is specified below:

1.PC1 has one NIC with a global IP connected to a Switch;
2.PC2 has two NICs, eth0 with a global IP connected to the Switch and eth1
with an internal IP (192.168.0.1/24) directly connected to PC3's eth1;
3.PC3 has two NICs, eth0 with a global IP connected to the Switch and eth1
with an internal IP (192.168.0.2/24) directly connected to PC2's eth1.

              Internet
                 |        +--------+----+
              +------+<-->+PC2/eth0|eth1+
+--------+    +      +    +--------+--+-+
+PC1/eth0+<-->+Switch+                |
+--------+    +      +    +--------+--+-+
              +------+<-->+PC3/eth0|eth1+
                          +--------+----+

I am trying to send packets from PC1 to PC3, via PC1/eth0(global
IP)-->PC2/eth0(global IP)-->PC2/eth1(192.168.0.1)-->PC3/eth1(192.168.0.2).
Actually, PC3/eth0 is not in used in the case.

Problems:
Currently I fail to ping from PC3 to PC2/eth1(192.168.0.1). Actually I don't
know which NIC PC3 is using to send the ping packets. I try disconnecting
PC3/eth0, but it still does not work. Could anyone throw some light on it
and warn me what I should pay attention to? Many many thanks!

Regards,
Jee


