From: "???" <safecode@naver.com>
Subject: delete NAT conntrack entry.
Date: Thu, 10 May 2007 16:10:08 +0900
Message-ID: <000a01c792d2$3e07e240$8f0ba8c0@swparkt1>
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


Hello

We have some problems with nat.
We want to relay "udp packet" from a host to other host using SNAT, DNAT.

iptables -t nat -A PREROUTING -p udp -d PACKET.RELAY.HOST.IP --dport 10000
-j DNAT --to-destination TO.OTHER.HOST.IP:10000 
iptables -t nat -A POSTROUTING -p udp -d TO.OTHER.HOST.IP --dport 10000 -j
SNAT --to-source PACKET.RELAY.HOST.IP:10000

It works well. But after removing the rules, packet still transferred. I can
find the conntrack entry in /proc/net/stat/ip_conntrack.
We know libnfnetlink & libnetfilter_conntrack with kernel 2.6 can delete
conntrack entries from userspace. But we use Redhat linux 2.4.21-32.EL.
How can I delete specified conntrack entry in kernel 2.4 without kernel code
??

Cheers,
Seongwoo Park






