From: Dax Kelson <dax@gurulabs.com>
Subject: DNATd server behind fw with two ISPs
Date: Mon, 11 Nov 2002 18:33:53 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211111815010.1971-100000@mooru.gurulabs.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Consider the following:
                 ________
(ISP1)=====eth0:| 2.4.18 |
		|Firewall|:eth2=====(WWW/DNS server @ 10.3.2.1)
(ISP2)=====eth1:|__NAT___|

On the firewall there are these DNAT rules:

iptables -t nat -A PREROUTING -i eth0 -p tcp -d REAL.IP.FROM.ISP1 --dport
25 -j DNAT --to 10.3.2.1:25

iptables -t nat -A PREROUTING -i eth1 -p tcp -d REAL.IP.FROM.ISP2 --dport
25 -j DNAT --to 10.3.2.1:25

Question:

What sort of SNAT and/or policy routing can I do so that the responses
from the internal 10.3.2.1 server are SNATed to and leave the appropriate
external interface on the firewall (the appropriate interface would be the 
external interface that the oonnection orginated from).

TIA,
Dax


