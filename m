From: "Erik Ahlner" <whyz@home.se>
Subject: Iptables and kernel 2.6.4 on slackware 9.1
Date: Mon, 29 Mar 2004 15:53:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c41595$34b4a1a0$0200a8c0@whyzpc>
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
To: netfilter@lists.netfilter.org

hello!

I've recently reentered this mailinglist and thus i don't know if this
question has been asked before.. i hope i'm not alone with this problem!

Last week I bought a new harddrive for my box, and installed slackware 9.1
(had 8.0 earlier) and compiled kernel 2.6.4 (had 2.4.22 earlier). At first,
everything seems to be fine, iptables runs.
But after half an hour or so, iptables just stops working. It's only
iptables that does this (i suppose), the server/router still has connection
to the internet and the computers behind it.
(I.e i have a ventrilo server running on the router, and i can still talk to
users connecting to it from the internet, while i'm connected to it from
inside the lan).

After about 5 minutes of downtime iptables suddenly starts working again,
and the computers on the NAT has internet access again.

These are my rules:

IPTABLES=/usr/sbin/iptables
EXTIF="eth0"
INTIF="eth1"

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE


Nothing here has changes since i was running kernel 2.4.22.

What could be the problem?
Anyone else who has experienced this?


I'm using iptables v1.2.9


Regards
    Erik Ahlner



