From: Marcin Kaminski <maxiu@man.poznan.pl>
Subject: filtreing problems
Date: Wed, 26 Mar 2003 11:06:51 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44.0303261038550.1817-100000@rose.man.poznan.pl>
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

Hi
I've got 2 questions:

1. When I was using ipchains, the following:
ipchains -I input -p udp -d 0.0.0.0/0 161 -j REDIRECT 1160
means that any udp directed to port 161 I want on 1160. Then I could
read original destination address of packets using recvmsg + IP_PKTINFO
from struct in_pktinfo.
Now I use iptables, and the following:
iptables -I PREROUTING -t nat -p udp --destination-port 161 \
 -j REDIRECT --to-ports 1160
works different, address in in_pktinfo is not original destination
address, but 'default' address of incoming interface.
How can I read original address of udp packets when using REDIRECT?

2. I want to block all ICMPv6 packets outgoing from my machine with some
source addresses. My interface has addresses
2001:808:0:1::11-2001:808:0:1::15, for simplicity I use
2001:808:0:1::0/120. When I use:
ip6tables -A OUTPUT -s 2001:808:0:1::0/120 -p icmp -j DROP
these addresses are still responding.
When pinging from other machine, tcpdump shows:
10:51:57.078594 2001:808:0:1:210:4bff:feb8:4da9 > 2001:808:0:1::11: icmp6:
echo request
10:51:57.078594 2001:808:0:1::11 > 2001:808:0:1:210:4bff:feb8:4da9: icmp6:
echo reply
When I block everything:
ip6tables -A OUTPUT -s 2001:808:0:1::/120 -j DROP
echo replies stop.
It looks like -p icmp match nothing, on INPUT chains it is the same.
What is wrong?

I use 2.2.19, iptables v1.2.7a

With regards



