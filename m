From: "Russ Kreigh" <kreigh@onlyinternet.net>
Subject: Firewall Help
Date: Tue, 11 Oct 2005 11:42:43 -0500
Message-ID: <00e501c5ce82$cd6cff30$e21e89ce@ssioi.com>
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

Hello -

When I applied the following rules below to my firewall my clients starting
having problems browsing webpages. When I did a tcpdump I could see the
request go to the DNS server, but never saw a reply. 

When I commented out the tcp rules, everything worked fine.

Do you think my limits are too low? I would estimate there are around 200
pcs coming through this.


Also, I am unclear if the rules are applied on a collective basis, or per ip
address. I assume it is ALL traffic, not per IP.



$IPTABLES -A INPUT -s X.X.30.0/24 -j ACCEPT  # Exclude Management subnet
from below rules
$IPTABLES -A INPUT -d X.X.30.0/24 -j ACCEPT
$IPTABLES -A FORWARD -s X.X.30.0/24 -j ACCEPT
$IPTABLES -A FORWARD -d X.X.30.0/24 -j ACCEPT

$IPTABLES -A INPUT -p tcp --syn -m limit --limit 500/s -j REJECT
$IPTABLES -A FORWARD -p tcp --syn -m limit --limit 500/s -j REJECT

$IPTABLES -A INPUT -p tcp -m limit --limit 2500/s -j REJECT
$IPTABLES -A FORWARD -p tcp -m limit --limit 2500/s -j REJECT

$IPTABLES -A INPUT -p icmp -m limit --limit 200/s -j REJECT
$IPTABLES -A FORWARD -p icmp -m limit --limit 200/s -j REJECT


Thanks,


Russ Kreigh
Network Engineer
OnlyInternet.Net Broadband & Wireless
Supernova Technologies
Office: (800) 363-0989
Direct: (260) 827-2486
Fax:    (260) 824-9624
kreigh@onlyinternet.net
http://www.oibw.net


