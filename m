From: sanoj mg <sanoj_mg@yahoo.com>
Subject: symbol ip_conntrack_find_get
Date: Thu, 11 Sep 2003 10:44:41 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911174441.57287.qmail@web14911.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-722276835-1063302281=:56915"
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
To: netfilter@lists.netfilter.org

--0-722276835-1063302281=:56915
Content-Type: text/plain; charset=us-ascii

hi all,
This may be silly question, & I don't know wether I can post to this list.
 
I tried to rewrite ipt_connlimit which uses  ip_conntrack_find_get(),  but when I try to insmod  the module i get the error, "unresolved symbol: ip_conntrack_find_get",
I insmod'ed all the modules in  
          /lib/modules/2.4.18-14/kernel/net/ipv4/netfilter/
ie, 
[root@sr4 netfilter]# pwd
/lib/modules/2.4.18-14/kernel/net/ipv4/netfilter
 
[root@sr4 netfilter]# ls
arptable_filter.o
arp_tables.o
ipchains.o
ip_conntrack_ftp.o
ip_conntrack_irc.o
ip_conntrack.o
ipfwadm.o
ip_nat_ftp.o
ip_nat_irc.o
ip_nat_snmp_basic.o
ip_queue.o
iptable_filter.o
iptable_mangle.o
iptable_nat.o
ip_tables.o
ipt_ah.o
ipt_esp.o
ipt_length.o
ipt_limit.o
ipt_LOG.o
ipt_mac.o
ipt_mark.o
ipt_MARK.o
ipt_MASQUERADE.o
ipt_MIRROR.o
ipt_multiport.o
ipt_owner.o
ipt_REDIRECT.o
ipt_REJECT.o
ipt_state.o
ipt_tcpmss.o
ipt_TCPMSS.o
ipt_tos.o
ipt_TOS.o
ipt_ttl.o
ipt_ULOG.o
ipt_unclean.o
 
           but it doesn't work. 
I don't see any  "ip_conntrack_core.o" in this directory, is that module needed to get this symbol? If so do I have to reconfigure the kernel. Any help will greatly be obliged.
Thanking you in advance.
sanoj
 
       


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-722276835-1063302281=:56915
Content-Type: text/html; charset=us-ascii

<DIV>hi all,</DIV>
<DIV>This may be silly question, &amp; I don't know wether I can post to this list.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I tried to rewrite&nbsp;ipt_connlimit which uses&nbsp; ip_conntrack_find_get(),&nbsp; but when I&nbsp;try to insmod&nbsp; the module i get the error, "unresolved symbol: ip_conntrack_find_get",</DIV>
<DIV>I insmod'ed all the modules in&nbsp; </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /lib/modules/2.4.18-14/kernel/net/ipv4/netfilter/</DIV>
<DIV>ie, </DIV>
<DIV>[root@sr4 netfilter]# pwd<BR>/lib/modules/2.4.18-14/kernel/net/ipv4/netfilter</DIV>
<DIV>&nbsp;</DIV>
<DIV>[root@sr4 netfilter]# ls</DIV>
<DIV>arptable_filter.o<BR>arp_tables.o<BR>ipchains.o<BR>ip_conntrack_ftp.o<BR>ip_conntrack_irc.o<BR>ip_conntrack.o<BR>ipfwadm.o<BR>ip_nat_ftp.o<BR>ip_nat_irc.o<BR>ip_nat_snmp_basic.o<BR>ip_queue.o<BR>iptable_filter.o<BR>iptable_mangle.o<BR>iptable_nat.o<BR>ip_tables.o<BR>ipt_ah.o<BR>ipt_esp.o<BR>ipt_length.o<BR>ipt_limit.o<BR>ipt_LOG.o<BR>ipt_mac.o<BR>ipt_mark.o<BR>ipt_MARK.o</DIV>
<DIV>ipt_MASQUERADE.o<BR>ipt_MIRROR.o<BR>ipt_multiport.o<BR>ipt_owner.o<BR>ipt_REDIRECT.o<BR>ipt_REJECT.o<BR>ipt_state.o<BR>ipt_tcpmss.o<BR>ipt_TCPMSS.o<BR>ipt_tos.o<BR>ipt_TOS.o<BR>ipt_ttl.o<BR>ipt_ULOG.o<BR>ipt_unclean.o</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;but it doesn't work. </DIV>
<DIV>I don't see any&nbsp; "ip_conntrack_core.o" in this directory, is that module needed to get this symbol? If so do I&nbsp;have to reconfigure the kernel. Any help will greatly be obliged.</DIV>
<DIV>Thanking you in advance.</DIV>
<DIV>sanoj</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-722276835-1063302281=:56915--

