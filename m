From: "Linda Zhu" <lindazhu@utstar.com>
Subject: remote telnet is blocked when internal ping is ongoing (re-submit)
Date: Tue, 29 Jun 2004 10:34:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LCENIFAENEHNMKDCGDGBAENECJAA.lindazhu@utstar.com>
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

Hi,

This is Linda from UTStarcom. I have problems with iptable configuration.

The problem happens on one card. The card has two ethernet interfaces:
One is 172.16.xx.xx, and another is 192.168.xx.xx. The 172.16.xx.xx
interface
is used for remotely acceccing the card. The 192.168.xx.xx interface
receives
and transmit traffic.

Part of our iptable configuration is attached below.

In normal case, user can remotely telnet into this card with no problme.
The problem occurs when we run ping from 196.168.xx.xx interface at a fast
rate.

e.g. ping -i 0.01 -s 1400 192.168.100.2, then the remote telnet to
172.168.xx.xx
interface is blocked.

In the iptable configuration, we have one rule:

$IPTABLES -A allowed_tcp -p TCP --syn -m limit --limit 1/second -j ACCEPT

If we change the limit from 1/second to 20/second, then with one ping
session,
the telnet will be successful. After that, if we run two ping sessions:
e.g.
ping -i 0.01 -s 1400 192.168.100.2
ping -i 0.01 -s 1400 192.168.100.3

then telnet is blocked again.

Then if we change the limit from 20/second to 100/second, remote telnet
success.
With the 100/second, even 4 ping sessions ongoing at same time, the remote
telnet is OK.

Basically, we don't setup any firewall for 192.168.xx.xx interface. My
question
is why the ping on 192.168.xx.xx interface will affect the remote telnet.
The two
interface are in different IP groups and on different hardware. Please
advice.

Thank you,
Linda

================== part of our iptable configuration =======================

###
# Create separate chains for TCP,UDP,ICMP to traverse
#
#

$IPTABLES -N allowed_tcp
$IPTABLES -N tcp_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets
#$IPTABLES -N allowed_ping

#
# Allowed chain
#

$IPTABLES -A allowed_tcp -p TCP --syn -m limit --limit 1/second -j ACCEPT
$IPTABLES -A allowed_tcp -p TCP -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPTABLES -A allowed_tcp -p TCP -j DROP

#
# TCP rules
#

### Telnet ###
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 23 -j allowed_tcp


#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 -m limit --limit
3/second --icmp-type 8
 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type pong -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type port-unreachable -j
ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT


