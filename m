From: star fire <starfire20002010@yahoo.com>
Subject: Wired routing problem
Date: Fri, 14 Nov 2003 13:18:46 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031114211846.84359.qmail@web42003.mail.yahoo.com>
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
To: iptables iptables <netfilter@lists.netfilter.org>

Dear group,

I intend to use iptables in order to limit access
trafic from our head office network(HON). The config
is as follows.

Firewall/Router

eth0
----
IP       10.2.248.1
MASK     255.255.248.0
B'CAST   10.2.255.255
Network  10.2.248.0

eth1
----
IP       172.16.1.1
MASK     255.255.0.0
B'CAST   172.16.255.255
Network  172.16.0.0


Client A
--------
IP       10.2.255.254
MASK     255.255.248.0
Gateway  10.2.248.1

Client B
--------
IP       172.16.1.3
MASK     255.255.0.0
Gateway  172.16.1.1

The firewall/router is a Redhat Linux 2.4.18
The situation where there are no iptables
running(stopped the service) and packet forwarding is
enables via sysctl.conf. As long as there are two(2)
machines as client A and B they connect to each other.
But then again when there is a CISCO route taken in as
a client, client A/B it does not ping to the router
from the other side. Could someone help me on this
issue.

Thanks sna regards

__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

