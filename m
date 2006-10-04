From: gabrix <gabrix@gabrix.ath.cx>
Subject: Patch o matic
Date: Wed, 04 Oct 2006 20:18:31 +0200
Message-ID: <4523FAF7.1070503@gabrix.ath.cx>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I have a debian sarge kernel 2.6 i got the patch-o-matic-ng , a kernel 
and iptables source ...
> root@argo:~# ls /usr/src/
> iptables-1.3.6  kernel-image-2.6.8_custom.1.0_i386.deb  
> kernel-source-2.6.8  patch-o-matic-ng-20040621
I have placed all in the /usr/src/ dir as you can see , compiled the new 
kernel , installed by dpkg -i the new kernel,rebooted,no kernel panic 
and i can't find the new ipt modules.Some got built like NOTRACK and TTL 
but no TARPIT or psd ...
> root@argo:~# lsmod | grep ipt
> ipt_ttl                 2176  0
> ipt_NOTRACK             2304  0
> ipt_recent             10252  2
> ipt_REDIRECT            2432  2
> ipt_multiport           2304  4
> ipt_limit               2688  18
> ipt_owner               3712  2
> ipt_tos                 1920  12
> ipt_MARK                2432  29
> ipt_ULOG                7592  95
> ipt_state               2304  12
> ipt_MASQUERADE          3968  1
> ipt_LOG                 6272  0
> iptable_mangle          3072  1
> iptable_filter          3072  1
> iptable_nat            22692  5 
> ipt_REDIRECT,ip_nat_irc,ip_nat_ftp,ipt_MASQUERADE
> ip_conntrack           32908  9 
> ipt_NOTRACK,ipt_REDIRECT,ip_nat_irc,ip_conntrack_irc,ip_nat_ftp,ip_conntrack_ftp,ipt_state,ipt_MASQUERADE,iptable_nat
> ip_tables              16896  16 
> ipt_ttl,ipt_NOTRACK,ipt_recent,ipt_REDIRECT,ipt_multiport,ipt_limit,ipt_owner,ipt_tos,ipt_MARK,ipt_ULOG,ipt_state,ipt_MASQUERADE,ipt_LOG,iptable_mangle,iptable_filter,iptable_nat
where are they ?
> root@argo:~# ls /lib/modules/2.6.8-2-386/kernel/net/ipv4/netfilter/
> arptable_filter.ko      ipfwadm.ko            iptable_nat.ko    
> ipt_ecn.ko      ipt_mark.ko        ipt_realm.ko     ipt_TOS.ko
> arp_tables.ko           ip_nat_amanda.ko      iptable_raw.ko    
> ipt_ECN.ko      ipt_MARK.ko        ipt_recent.ko    ipt_ttl.ko
> arpt_mangle.ko          ip_nat_ftp.ko         ip_tables.ko      
> ipt_esp.ko      ipt_MASQUERADE.ko  ipt_REDIRECT.ko  ipt_ULOG.ko
> ipchains.ko             ip_nat_irc.ko         ipt_addrtype.ko   
> ipt_helper.ko   ipt_multiport.ko   ipt_REJECT.ko
> ip_conntrack_amanda.ko  ip_nat_snmp_basic.ko  ipt_ah.ko         
> ipt_iprange.ko  ipt_NETMAP.ko      ipt_SAME.ko
> ip_conntrack_ftp.ko     ip_nat_tftp.ko        ipt_CLASSIFY.ko   
> ipt_length.ko   ipt_NOTRACK.ko     ipt_state.ko
> ip_conntrack_irc.ko     ip_queue.ko           ipt_conntrack.ko  
> ipt_limit.ko    ipt_owner.ko       ipt_tcpmss.ko
> ip_conntrack.ko         iptable_filter.ko     ipt_dscp.ko       
> ipt_LOG.ko      ipt_physdev.ko     ipt_TCPMSS.ko
> ip_conntrack_tftp.ko    iptable_mangle.ko     ipt_DSCP.ko       
> ipt_mac.ko      ipt_pkttype.ko     ipt_tos.ko
Is this the right dir for iptables kernel modules?
Is TARPIT and psd part of a chain of modules i missed to modprobe ?
Thanks !

