From: Emmanuel Guiton <emmanuel@netlab.hut.fi>
Subject: Do I miss anything?
Date: Fri, 14 Nov 2003 11:27:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB49FEB.1030307@netlab.hut.fi>
Reply-To: emmanuel@netlab.hut.fi
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

Hei!

That's been two days that I'm trying to make iptables works without 
success. As I have already reported, once iptables is installed I have 
the error:

pc104:/lib/modules/2.4.22# iptables -L
modprobe: Can't locate module ip_tables
iptables v1.2.9: can't initialize iptables table `filter': iptables who? 
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

And if I try to insmod iptables.o (from the install directory) or 
ip_tables.o (from the kernel sources) I get the following error:
 couldn't find the kernel version the module was compiled for

If anybody has a clue, I would really appreciate to know it.
Anyway, can someone tell me if I miss any file? When looking for any 
iptables related file I obtain the following:

pc104:/# locate ip_tables
/usr/include/linux/netfilter_ipv4/ip_tables.h
/usr/src/linux-2.4.22/include/linux/modules/ip_tables.stamp
/usr/src/linux-2.4.22/include/linux/modules/ip_tables.ver
/usr/src/linux-2.4.22/include/linux/netfilter_ipv4/ip_tables.h
/usr/src/linux-2.4.22/net/ipv4/netfilter/.ip_tables.o.flags
/usr/src/linux-2.4.22/net/ipv4/netfilter/ip_tables.c
/usr/src/linux-2.4.22/net/ipv4/netfilter/ip_tables.o

pc104:/# locate iptables
/sbin/iptables
/sbin/iptables-restore
/sbin/iptables-save
/usr/iptables-1.2.9.tar
/usr/local/man/man8/iptables-restore.8
/usr/local/man/man8/iptables-save.8
/usr/local/man/man8/iptables.8
/usr/patch-o-matic/extra/iptables-loopcheck-speedup.patch
/usr/patch-o-matic/extra/iptables-loopcheck-speedup.patch.help
/usr/src/linux-2.4.22/include/config/ip/nf/iptables.h
/var/lib/iptables
/var/lib/iptables/libip6t_ah.so
/var/lib/iptables/libip6t_dst.so
/var/lib/iptables/libip6t_esp.so
/var/lib/iptables/libip6t_eui64.so
/var/lib/iptables/libip6t_frag.so
/var/lib/iptables/libip6t_hbh.so
/var/lib/iptables/libip6t_HL.so
/var/lib/iptables/libip6t_hl.so
/var/lib/iptables/libip6t_icmpv6.so
/var/lib/iptables/libip6t_ipv6header.so
/var/lib/iptables/libip6t_length.so
/var/lib/iptables/libip6t_limit.so
/var/lib/iptables/libip6t_LOG.so
/var/lib/iptables/libip6t_mac.so
/var/lib/iptables/libip6t_MARK.so
/var/lib/iptables/libip6t_mark.so
/var/lib/iptables/libip6t_multiport.so
/var/lib/iptables/libip6t_owner.so
/var/lib/iptables/libip6t_rt.so
/var/lib/iptables/libip6t_standard.so
/var/lib/iptables/libip6t_tcp.so
/var/lib/iptables/libip6t_TRACE.so
/var/lib/iptables/libip6t_udp.so
/var/lib/iptables/libipt_ah.so
/var/lib/iptables/libipt_CLASSIFY.so
/var/lib/iptables/libipt_connlimit.so
/var/lib/iptables/libipt_CONNMARK.so
/var/lib/iptables/libipt_connmark.so
/var/lib/iptables/libipt_conntrack.so
/var/lib/iptables/libipt_DNAT.so
/var/lib/iptables/libipt_DSCP.so
/var/lib/iptables/libipt_dscp.so
/var/lib/iptables/libipt_ECN.so
/var/lib/iptables/libipt_ecn.so
/var/lib/iptables/libipt_esp.so
/var/lib/iptables/libipt_helper.so
/var/lib/iptables/libipt_icmp.so
/var/lib/iptables/libipt_iprange.so
/var/lib/iptables/libipt_length.so
/var/lib/iptables/libipt_limit.so
/var/lib/iptables/libipt_LOG.so
/var/lib/iptables/libipt_mac.so
/var/lib/iptables/libipt_MARK.so
/var/lib/iptables/libipt_mark.so
/var/lib/iptables/libipt_MASQUERADE.so
/var/lib/iptables/libipt_MIRROR.so
/var/lib/iptables/libipt_multiport.so
/var/lib/iptables/libipt_NETMAP.so
/var/lib/iptables/libipt_NOTRACK.so
/var/lib/iptables/libipt_owner.so
/var/lib/iptables/libipt_physdev.so
/var/lib/iptables/libipt_pkttype.so
/var/lib/iptables/libipt_realm.so
/var/lib/iptables/libipt_recent.so
/var/lib/iptables/libipt_REDIRECT.so
/var/lib/iptables/libipt_REJECT.so
/var/lib/iptables/libipt_rpc.so
/var/lib/iptables/libipt_SAME.so
/var/lib/iptables/libipt_SNAT.so
/var/lib/iptables/libipt_standard.so
/var/lib/iptables/libipt_state.so
/var/lib/iptables/libipt_TARPIT.so
/var/lib/iptables/libipt_tcp.so
/var/lib/iptables/libipt_TCPMSS.so
/var/lib/iptables/libipt_tcpmss.so
/var/lib/iptables/libipt_TOS.so
/var/lib/iptables/libipt_tos.so
/var/lib/iptables/libipt_TRACE.so
/var/lib/iptables/libipt_TTL.so
/var/lib/iptables/libipt_ttl.so
/var/lib/iptables/libipt_udp.so
/var/lib/iptables/libipt_ULOG.so
/var/lib/iptables/libipt_unclean.so

Could someone mail me the results of the same commands on a working 
system so I can compare?

Thanks,

              Emmanuel


