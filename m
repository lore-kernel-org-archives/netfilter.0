From: Mike Philip <mikephilipx@yahoo.com>
Subject: Netfilter locks up after disconnecting Xover cable
Date: Mon, 3 Nov 2003 14:33:48 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031103223348.35872.qmail@web20420.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a DL360 with 2 Tigon gig NICs(eth0 & eth1) and
1 Fast Ethernet Quad CARD (E100).  I'm using the 2
Tigons and the second port(eth3) of the Quad Card. 
These 3 are connected to switches and have been up and
running for 5 weeks.

I have a standalone PC (Dell GX1) which I put into the
first NIC(eth2) of the Quad Card.  I was able to ping
from the Netfilter Server to the standalone PC.  When
I pulled the Xover cable out of the Quad Card(gently).
The Netfilter Server's desktop locked up and routing
between the established LANs stopped.

I had to depress the power buttom to recover the
system.

Before putting this system in Production I tested each
NIC by connecting two laptops via Xover cables to
separate NICs on the Server.  Then I ping'd across the
Netfilter Server successfully.


Software:

Redhat 9.0 (Shrike)
iptables-1.2.8-9.1
fwbuilder-1.0.11-1

Hardware:

HP DL360 G2 1.4 GHz P3
NC7780 Gigabit Server NICs embedded
NC3134/NC3135 Fast Ethernet Quad Port 10/100 TX PCI

TIA


__________________________________
Do you Yahoo!?
Exclusive Video Premiere - Britney Spears
http://launch.yahoo.com/promos/britneyspears/

