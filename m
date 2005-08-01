From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Fun with the mangle table + LARTC
Date: Mon, 1 Aug 2005 09:16:37 +0100
Message-ID: <200508010916.37911.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi - this is one of those "not sure if it's netfilter or LARTC" issues, so 
here we go. I have a LAN on eth0 two Internet connections on eth1 and eth2. I 
have the default route pointing at eth1 but would like HTTP requests from the 
LAN to go out eth2.

When beginning, I have the following rules in the nat table.

-A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth1 -j MASQUERADE
-A POSTROUTING -s 10.0.0.0/255.255.255.0 -o eth2 -j MASQUERADE

and the default route is via the ISP gateway on eth1 -  Hurrah - normal net 
access works.

However if I now add this to the mangle table:

-A PREROUTING -i eth0 -p tcp --dport 80 -j MARK --set-mark 0x50
and populate table 0x50 (80 decimal) with:

ip rule add fwmark 80 table 43
ip route add default via 80.X.X.1 table 43

using tcpdump I can see the outgoing and reply packets on eth2 with the 
correct source address (i.e. the one the ISP on eth2 gives me) set, but 
tcpdump on eth0 shows only the packets from the MASQ'd host - the replies 
from the Internet host are not passed through.

Of course, remove the PREROUTING rule in mangle  and all is well again...

Any ideas would be warmly welcomed, this is Debian sarge, kernel 2.6.8, 
iptables 1.2.11 if it makes a difference. :)

Cheers,
Gavin.

