From: Roeland Moors <roelandmoors@pandora.be>
Subject: change TTL value
Date: Thu, 8 Apr 2004 18:13:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040408161334.GA2396@home.be>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

I'm trying to change the value of the TTL field with this line:
$IPTABLES -t mangle -A PREROUTING -i $INET_IFACE -p igmp -j TTL --ttl-inc 1

But when I try to execute this I have this error:
iptables: No chain/target/match by that name

This seems to be the problem: -j TTL --ttl-inc 1
But I found it in the manpage:
iptables -j TTL --help:
...
 --ttl-inc value               Increment TTL by <value>
... 

What am I doing wrong?

uname -a:
Linux server 2.6.2 #1 Thu Apr 8 12:02:31 CEST 2004 i686 GNU/Linux

modprobe -l:
/lib/modules/2.6.2/kernel/net/ipv4/ipip.ko
/lib/modules/2.6.2/kernel/net/ipv4/ip_gre.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/iptable_nat.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/iptable_mangle.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/iptable_filter.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ttl.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_tos.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_tcpmss.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_state.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_recent.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_pkttype.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_owner.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_multiport.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_mark.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_mac.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_limit.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_length.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_iprange.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_helper.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_esp.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ecn.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_dscp.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_conntrack.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ah.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ULOG.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_TOS.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_TCPMSS.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_SAME.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_REJECT.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_REDIRECT.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_NETMAP.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_MASQUERADE.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_MARK.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_LOG.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_ECN.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_DSCP.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ipt_CLASSIFY.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_tables.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_nat_irc.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_nat_ftp.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_conntrack_irc.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_conntrack.ko
/lib/modules/2.6.2/kernel/net/ipv4/netfilter/ip_conntrack_ftp.ko


