From: "Steven Y. Ko" <sko@uiuc.edu>
Subject: One interface forwarding (wireless ad-hoc
 mode)?
Date: Sun, 30 Jan 2005 20:41:22 -0600
Message-ID: <eedd11cb.c7105adb.b6e9c00@expms5.cites.uiuc.edu>
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

Hi,

I'm wondering whether my problem can be solved with 
netfilter/iptables or there's any simple solution. This 
problem looks very simple, but I couldn't find a solution 
yet.

I'm configuring an wireless ad-hoc network with three 
laptops;

A ---- B ---- C

where A and C can only talk to B, and B can talk to both A 
and C. A and C cannot talk to each other. I'd like to 
configure B so that A can talk to C via B (and vice versa). 
The addresses are,
A: 192.168.0.1
B: 192.168.0.2
C: 192.168.0.3

Since this is an wireless ad-hoc network, every machine has 
only one (wireless) interface, so B should receive a packet 
through its interface eth0 and forward it through eth0 
again. Currently, A, B, and C only have the same basic 
routing table;

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric 
Ref    Use Iface
192.168.0.0   *               255.255.255.0   U     0      
0        0 eth0
169.254.0.0     *               255.255.0.0     U     0      
0        0 eth0
127.0.0.0       *               255.0.0.0       U     0      
0        0 lo

B cannot forward packets with this routing table. Can I use 
netfilter/iptables to make this network work? or is there 
any solution?

Thanks,
Steve

