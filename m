From: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Subject: Forward rules
Date: Fri, 28 Nov 2003 16:18:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008301c3b5e4$640b9f00$0200a8c0@ale>
Reply-To: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Hello !!!

I'm building my FORWARD table rules, and I want to implement this: "Drop all
FORWARD packets by default and then accept only packets coming from LAN
(192.168.0.0/24) with the related and established condition and leaving my
external interface ($INET_IFACE)".

Is the next ruleset according to what I want or can I change the order ???

$IPTABLES -P FORWARD DROP
$IPTABLES -A FORWARD -s 192.168.0.0/24 -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I suppose with this implementation I'm discarding packet forwarding coming
from 127.0.0.0/24, 10.0.0.0/8 and 172.16.0.0/12 (because my default policy
is DROP by default)....is it OK ???

Thousands of thanks :)

Alejandro


