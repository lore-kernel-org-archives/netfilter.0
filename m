From: Rakotomandimby Mihamina <rktmb.list@wanadoo.fr>
Subject: What modules to load and what order ?
Date: Fri, 25 Jun 2004 09:35:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DBD5CE.1010209@wanadoo.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,
I have a dedicated server running debian (initially woody, dist-upgraded 
to testing)

It runs iptables 1.2.9

I bassically know how to manage it when all the netfilter stuff is 
included into the kernel, but i dont know what to do when they're as 
modules.

I would be gratefull if you would help me to see what of these modules i 
should load, if my rules are what i show at the bottom of this letter.

I really thank any help, i'll be very scared till you answer me because 
my server is running without any FWall for the moment....

==========================================================================
[root@localhost]# find /lib/modules/2.4.26-grsec -name '*.o' | grep 
netfilter

/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/arpt_mangle.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/arp_tables.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/arptable_filter.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ip_tables.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_DSCP.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_ECN.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_LOG.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_MARK.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_REJECT.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_TCPMSS.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_TOS.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_ULOG.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_ah.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_dscp.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_ecn.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_esp.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_length.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_limit.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_mac.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_mark.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_multiport.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_pkttype.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_recent.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_stealth.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_tcpmss.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_tos.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/ipt_ttl.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/iptable_filter.o
/lib/modules/2.4.26-grsec/kernel/net/ipv4/netfilter/iptable_mangle.o
/lib/modules/2.4.26-grsec/kernel/net/ipv6/netfilter/ip6_tables.o

=====================================================================

These are my rules :

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -A INPUT -i ppp0 -m unclean -j LOG  --log-level debug 
--log-prefix 'unclean_: '
iptables -A INPUT -i ppp0 -m unclean -j DROP
iptables -A INPUT -p tcp --syn -m limit --limit 5/s -j ACCEPT
iptables -A INPUT -p tcp --syn -j LOG --log-level debug --log-prefix 
'syn-flood_: '
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit 
--limit 5/s -j ACCEPT
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j LOG 
--log-level debug --log-prefix 'p_scan_: '
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s 
-j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j LOG --log-level 
debug --log-prefix 'p_o_d: '
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 31 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 2401 -j ACCEPT
iptables -A OUTPUT -p udp --dport 2401 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --syn --dport 113 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --syn --dport 113 -j ACCEPT
iptables -A INPUT -j LOG --log-level debug --log-prefix "droped_input_: "
iptables -A OUTPUT -j LOG --log-level debug --log-prefix "droped_output_: "
====================================================================

-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://www.rktmb.org/site_principal/Members/mihamina

