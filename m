From: "Hirantha Wijayawardena" <hirantha@crescat.com>
Subject: Need an advice
Date: Wed, 17 Nov 2004 11:16:19 +0600
Message-ID: <C97EC9D40F9B8E469B2187228615909102CC50@mail.crescat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

Dear Experts,

These days I'm following the iptables tutorial 1.1.19 to refresh my mind
with iptables. But I came across some confusions while reading the doc
(I thinks I'm having some misunderstands). The following are my
questions and please explain how these packets traverse.

# INPUT chain

$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
This match all TCP packets in the INPUT chain that comes in on the
$INET_IFACE interface, and send those to the tcp_packets

#
# TCP rules
#

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed


-A tcp_packets tells iptables in which chain to add the new rule, the
rule will be added to the end of the chain. -p TCP tells it to match TCP
packets and -s 0/0 matches all source addresses from 0.0.0.0 with
netmask 0.0.0.0, in other words all source addresses. If all the
criteria are matched, then the packet will be targeted for the allowed
chain. If it doesn't match any of the rules, they will be passed back to
the original chain that sent the packet to the tcp_packets chain.

1.) If the packet does not match, then it will return to the original
chain. So what is the chain? Is it:

$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets=20
or
$IPTABLES -P INPUT DROP

2.) If that is send to $IPTABLES -P INPUT DROP, do we have to create TCP
rules for each destination port?
3.) TCP rules set are for only we are running particular services on the
filerwall or should assign if we running services behind the firewall?

4.) What is the best method to sharing the internet for the LAN users?
Is it SNAT or MASUERADE?

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$INET_IP
or
$iptables -A POSTROUTING -t nat -o $INET_IP -s $LAN_IP_RANGE -d 0/0 -j
MASQUERADE

According to the tutorial -
It is still possible to use the MASQUERADE target instead of SNAT even
though you do have an static IP, however, it is not favorable since it
will add extra overhead, and there may be inconsistencies in the future
which will thwart your existing scripts and render them "unusable".

But I saw from the scratch, some firewall scripts are enabled with
MASQUERADE

Please advice & thanks in advance

- Hirantha

