From: al clethero <aclethero@ihug.co.nz>
Subject: Newbie - problem with PREROUTING on nat - I'm missing something
	obvious?
Date: 17 Mar 2004 13:49:07 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079484547.5206.18.camel@bluespi.orb.co.nz>
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

Folks

I'm having some issues with the nat table and redirection. I'm trying to
redirect traffic destined for port 80 to port
8080, so that there is no need to specify a proxy server in the browser
settings. I'm fairly new to netfilter, so it may be I'm missing
something obvious. If so, I apologise beforehand!

I set up a contrived scenario on my isolated test system as follows (so
the browser, squid etc are all running on the same box):

1/ I have nothing listening on port 80
2/ Squid is running, listening on port 8080
3/ Proxy options are turned off in the browser
4/ iptables has the following statement in the nat table (and this is
the only statement in my iptables while I test this out):

   iptables -t nat -A PREROUTING  -p tcp --dport 80 -j REDIRECT
--to-ports 8080

My understanding of this rule is that any tcp packets destined for port
80 on any interface will be redirected to port 8080.

5/ I try to connect to www.google.com from the browser and the following
should happen:

the request goes out to port 80
the rule in the nat table picks up the packet and forwards it to port
8080, where squid connects to google, retrieves the page and supplies it
to the browser.

However, this doesn't seem to happen, connections go straight through to
google from port 80 without being redirected. I have tested this by
shutting down squid and having no proxy servers configured in the
browser, yet I can still connect, whereas I would expect an error.

If I check the iptables status before and after doing this I get

Before

iptables -t nat -v -L
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         
    0     0 REDIRECT   tcp  --  any    any     anywhere            
anywhere
       tcp dpt:http redir ports 8080
 
Chain POSTROUTING (policy ACCEPT 10 packets, 600 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         
 
Chain OUTPUT (policy ACCEPT 10 packets, 600 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         
After

Chain PREROUTING (policy ACCEPT 43 packets, 3496 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         
    0     0 REDIRECT   tcp  --  any    any     anywhere            
anywhere
       tcp dpt:http redir ports 8080
 
Chain POSTROUTING (policy ACCEPT 209 packets, 13148 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         
 
Chain OUTPUT (policy ACCEPT 209 packets, 13148 bytes)
 pkts bytes target     prot opt in     out     source              
destination
         

Since the above seems to indicate packets going through the nat
prerouting chain but not being acted upon I suspect I am missing
something fairly obvious!

My version of Linux is Redhat 9.0 with a kernel of:
Linux r1 2.4.20-8 #1 Thu Mar 13 17:18:24 EST 2003 i686 athlon i386
GNU/Linux

A modprobe returns

/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/arp_tables.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/arptable_filter.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_conntrack.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_conntrack_irc.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_nat_ftp.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_nat_irc.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_nat_snmp_basic.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_queue.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_tables.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipchains.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipfwadm.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_DSCP.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_ECN.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_LOG.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_MARK.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_MIRROR.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_REDIRECT.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_REJECT.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_TCPMSS.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_TOS.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_ULOG.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_ah.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_conntrack.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_dscp.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_ecn.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_esp.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_helper.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_length.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_limit.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_mac.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_mark.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_multiport.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_owner.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_pkttype.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_state.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_tcpmss.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_tos.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_ttl.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_unclean.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/iptable_filter.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/iptable_mangle.o
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/iptable_nat.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6_tables.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_LOG.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_MARK.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_eui64.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_length.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_limit.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_mac.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_mark.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_multiport.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6t_owner.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6table_filter.o
/lib/modules/2.4.20-8/kernel/net/ipv6/netfilter/ip6table_mangle.o


any thoughts would be appreciated,

regards

al



