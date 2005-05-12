From: ro0ot <ro0ot@phreaker.net>
Subject: Transparent proxy to remote squid box
Date: Fri, 13 May 2005 00:08:33 +0800
Message-ID: <42837F81.6050305@phreaker.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@lists.netfilter.org>

Hi,

I have a working "transparent proxy to remote squid box" rules as below: -

$IPTABLES -t nat -A PREROUTING -i eth1 -s ! 10.59.2.4 -p tcp --dport 80 
-j DNAT --to 10.59.2.4:3128
$IPTABLES -t nat -A POSTROUTING -o eth1 -s 10.59.2.0/24 -d 10.59.2.4 -j 
SNAT --to 10.59.2.1
$IPTABLES -t filter -A FORWARD -s 10.59.2.0/24 -d 10.59.2.4 -i eth1 -o 
eth1 -p tcp --dport 3128 -j ACCEPT

How can I not route the following network "1.1.1.0/24" to the remote 
squid box using IPTABLES?

Regards,
ro0ot




