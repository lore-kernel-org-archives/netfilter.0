From: "Dennis O. Aliev" <daliev@etecom.com>
Subject: Multiple Source IP Addresses
Date: Thu, 10 Mar 2005 19:50:13 -0800
Message-ID: <20050310195013.0a8b8056.daliev@etecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: sergey@etecom.com, daliev@etecom.com

Good evening,

Is there a way to send traffic from host behind IPTables firewall using different external source IP addresses that are assigned to firewall on the external interface?

Host behind firewall has single IP address (192.168.1.94)  and making  http based requests to internet.

Firewall has following rules to make it work:
iptables -t filter -A forward -o eth0 -p tcp -s 192.168.1.94 --dport 80 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.94 -j SNAT --to-source some_external_ip

I was thinking of making http request from host to a different port and then based on that change source address to another external address and change the destination port to 80, but can't figure out how to do that.

Does anyone have any ideas? Perhaps there is a different approach?
-- 

Dennis O. Aliev 

