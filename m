From: gabrix <gabrix@gabrix.ath.cx>
Subject: patch o matic modules
Date: Fri, 06 Oct 2006 05:05:12 +0200
Message-ID: <4525C7E8.4010301@gabrix.ath.cx>
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

I will try to explain in a better way my POM modules problem .
I have a debian sarge kernel 2.6 these are the packages i got to compile 
POM in the kernel:
> root@argo:~# ls /usr/src/
> iptables-1.3.6  kernel-source-2.6.8  patch-o-matic-ng-20040621
This the resulting .deb kernel afther compile:

> kernel-image-2.6.8_custom.1.0_i386.deb
this the kernel installed:

> root@argo:~# uname -a
> Linux argo 2.6.8-2-386 #1 Tue Aug 16 12:46:35 UTC 2005 i686 GNU/Linux

the iptables POM modules are where they are supposed to be:

> lroot@argo:~# ls /lib/iptables/
> libip6t_ah.so          libip6t_multiport.so  libipt_CONNMARK.so       
> libipt_LOG.so         libipt_POOL.so      libipt_TARPIT.so
> libip6t_condition.so   libip6t_nth.so        libipt_conntrack.so      
> libipt_mac.so         libipt_psd.so       libipt_TCPLAG.so
> libip6t_dst.so         libip6t_owner.so      libipt_DNAT.so           
> libipt_mark.so        libipt_quota.so     libipt_tcpmss.so
> libip6t_esp.so         libip6t_policy.so     libipt_dscp.so           
> libipt_MARK.so        libipt_random.so    libipt_TCPMSS.so
> libip6t_eui64.so       libip6t_random.so     libipt_DSCP.so           
> libipt_MASQUERADE.so  libipt_realm.so     libipt_tcp.so
> libip6t_frag.so        libip6t_REJECT.so     libipt_dstlimit.so       
> libipt_MIRROR.so      libipt_recent.so    libipt_time.so
> libip6t_fuzzy.so       libip6t_ROUTE.so      libipt_ecn.so            
> libipt_mport.so       libipt_REDIRECT.so  libipt_tos.so
> libip6t_hbh.so         libip6t_rt.so         libipt_ECN.so            
> libipt_multiport.so   libipt_REJECT.so    libipt_TOS.so
> libip6t_hl.so          libip6t_standard.so   libipt_esp.so            
> libipt_NETLINK.so     libipt_ROUTE.so     libipt_TRACE.so
> libip6t_HL.so          libip6t_tcp.so        libipt_fuzzy.so          
> libipt_NETMAP.so      libipt_rpc.so       libipt_ttl.so
> libip6t_icmpv6.so      libip6t_TRACE.so      libipt_helper.so         
> libipt_NOTRACK.so     libipt_SAME.so      libipt_TTL.so
> libip6t_ipv6header.so  libip6t_udp.so        libipt_icmp.so           
> libipt_nth.so         libipt_sctp.so      libipt_u32.so
> libip6t_length.so      libipt_addrtype.so    libipt_IPMARK.so         
> libipt_osf.so         libipt_set.so       libipt_udp.so
> libip6t_limit.so       libipt_ah.so          libipt_iprange.so        
> libipt_owner.so       libipt_SET.so       libipt_ULOG.so
> libip6t_LOG.so         libipt_CLASSIFY.so    libipt_ipv4options.so    
> libipt_physdev.so     libipt_SNAT.so      libipt_unclean.so
> libip6t_mac.so         libipt_condition.so   libipt_IPV4OPTSSTRIP.so  
> libipt_pkttype.so     libipt_standard.so  libipt_XOR.so
> libip6t_mark.so        libipt_connlimit.so   libipt_length.so         
> libipt_policy.so      libipt_state.so
> libip6t_MARK.so        libipt_connmark.so    libipt_limit.so          
> libipt_pool.so        libipt_string.so
How do i load them in my iptables script ?
many of the modules above are not present in the 
/lib/modules/2.6.8-2-386/kernel/net/ipv4/netfilter/ dir

> root@argo:~# ls /lib/modules/2.6.8-2-386/kernel/net/ipv4/netfilter/
> arptable_filter.ko      ip_nat_irc.ko           
> ipt_conntrack.ko        ipt_mark.ko             ipt_REJECT.ko
> arp_tables.ko           ip_nat_snmp_basic.ko    
> ipt_dscp.ko             ipt_MARK.ko             ipt_SAME.ko
> arpt_mangle.ko          ip_nat_tftp.ko          
> ipt_DSCP.ko             ipt_MASQUERADE.ko       ipt_state.ko
> ipchains.ko             ip_queue.ko             
> ipt_ecn.ko              ipt_multiport.ko        ipt_tcpmss.ko
> ip_conntrack_amanda.ko  iptable_filter.ko       
> ipt_ECN.ko              ipt_NETMAP.ko           ipt_TCPMSS.ko
> ip_conntrack_ftp.ko     iptable_mangle.ko       
> ipt_esp.ko              ipt_NOTRACK.ko          ipt_tos.ko
> ip_conntrack_irc.ko     iptable_nat.ko          
> ipt_helper.ko           ipt_owner.ko            ipt_TOS.ko
> ip_conntrack.ko         iptable_raw.ko          
> ipt_iprange.ko          ipt_physdev.ko          ipt_ttl.ko
> ip_conntrack_tftp.ko    ip_tables.ko            
> ipt_length.ko           ipt_pkttype.ko          ipt_ULOG.ko
> ipfwadm.ko              ipt_addrtype.ko         
> ipt_limit.ko            ipt_realm.ko
> ip_nat_amanda.ko        ipt_ah.ko               
> ipt_LOG.ko              ipt_recent.ko
> ip_nat_ftp.ko           ipt_CLASSIFY.ko         ipt_mac.ko
and this modules get loaded :
 
> root@argo:~# modprobe ipt_TCPMSS
> root@argo:~# modprobe ipt_SAME
> root@argo:~# modprobe ipt_REJECT
> root@argo:~# 
What's happening?
Why modules are present in one dir and not in the orther ?
What am i supposed to do to make POM happen ?
thanks !






