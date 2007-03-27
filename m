From: Ray Leach <spoons@rchq.co.za>
Subject: Multi ISP router/firewall ...
Date: Tue, 27 Mar 2007 14:52:21 +0200
Message-ID: <1174999941.21066.22.camel@rayw.internal>
Reply-To: spoons@rchq.co.za
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi All

I've been trying to configure a router/firewall with 5 zones (2 of which
are ISP links) unsuccessfully.

So far I've managed to patch the kernel with the ROUTE target, and I've
got rules as follows:

FORWARD chain filter table:
ACCEPT     0    --  ethxx0 eth4    10.0.0.0/24    0.0.0.0/0           
ACCEPT     0    --  eth4   ethxx0  0.0.0.0/0      10.0.0.0/24

FORWARD chain mangle table:
ROUTE      tcp  --  *      *       10.0.0.67    !192.168.1.0/24      tcp
dpts:80:90 ROUTE oif:eth4 continue


POSTROUTING chain nat table:
SNAT       0    --  *      eth4    0.0.0.0/0    0.0.0.0/0  to:10.1.0.2


ethxx0 is my internal LAN
eth4 is my 2nd ISP connection
10.0.0.67 is my workstation
10.1.0.2 is the ip bound to eth4

The other ISP link is working, we host around 12 websites on servers in
our DMZ, we have outgoing web browsing, email, MSN, etc. using various
nat rules for that interface, they all work.

I can see using tcpdump that the packets are leaving my workstation,
being mangles to change the route, going out the 2nd ISP link, coming
back into the 2nd ISP link, but then they disappear.

My forwarding rules as shown above do not show any traffic.

This has me stumped.

As I've stated, I have nat (both SNAT and DNAT) working on the other ISP
interface on the same machine.

Where should I start looking?

Regards

Ray
-- 
Raymond Leach
RCHQ Hobbies (http://www.rchq.co.za/)
(T)+27-82-575-6975 (F)+27-86-652-2773


