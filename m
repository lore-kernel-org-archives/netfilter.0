From: chrispatch@intrstar.net
Subject: All traffice should not be NAT ed
Date: Mon, 15 Mar 2004 14:06:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86A0DA300AA5A447BA587B1715BDF7F9605154@exchange.nt.intrstar.net>
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


>>Even if it's not completely clear to me why: the offending rule was
>>
>>$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source 
>>$INET_IP
>>

Try adding a line above this one in the post routing table
$IPTABLES -t nat -A POSTROUTING -d  $DESTNET -j SNAT -j ACCEPT

Where $DESTNET = the lan on the other side of the tunnel ?





