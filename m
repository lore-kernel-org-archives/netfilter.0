From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Help NEEDED--sos !!
Date: Tue, 04 Jun 2002 09:38:10 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFC3D2A.9030409@inbox.lv>
References: <Pine.LNX.4.33.0206031349460.4790-100000@blackhole.kfki.hu> <3CFB5ED0.1020204@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.samba.org

Arindam Haldar wrote:
> hi,
> yes..:)... sorry for being a little cryptic ;)... but u guessed it right 
> !..so i will summarize my 2 Question in this listing-->
> 1)i am getting these messages in my /var/log/messages..
> 
>  iptables v1.2.7-20020423 with  kernel 2.4.18 & patched htb3.3-020512 & 
> imq-2.4.18...
> May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
> &ip_conntrack_lock not readlocked
> May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739
> &ip_conntrack_lock_R71150de5 readlocked
> May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91
> &ip_conntrack_lock_R71150de5 readlocked
> 
> this pattern message is being received every minute. !.. this system is 
> on RH-7.2 with 512mb ram & has been running for a month now but the 
> mesages started coming since may 30 !...
> 
more info to the above from the server--->
# watch 'sort -nr -k 2 /proc/slabinfo'
buffer_head        34508  34560     96  864  864    1
dentry_cache       10665  10680    128  356  356    1
inode_cache         7501   7544    480  938  943    1
ip_dst_cache        2437   2800    192  140  140    1
ip_conntrack        1249   1884    320  124  157    1
# cabneigh all |wc -l
      17
# cat /proc/sys/net/ipv4/ip_conntrack_max
32248
# ls /lib/modules/2.4.18/kernel/net/ipv4/netfilter/
ip_conntrack_egg.o      iptable_nat.o      ipt_LOG.o         ipt_realm.o
ip_conntrack_ftp.o      ip_tables.o        ipt_mac.o    ipt_record_rpc.o
ip_conntrack_h323.o     ipt_ah.o           ipt_mark.o     ipt_REDIRECT.o
ip_conntrack_irc.o      ipt_connmark.o     ipt_MARK.o       ipt_REJECT.o
ip_conntrack.o          ipt_CONNMARK.o     ipt_MASQUERADE.o  ipt_state.o
ip_conntrack_rpc_tcp.o  ipt_conntrack.o    ipt_MIRROR.o     ipt_string.o
ip_conntrack_rpc_udp.o  ipt_dscp.o         ipt_mport.o      ipt_tcpmss.o
ip_nat_ftp.o            ipt_DSCP.o         ipt_multiport.o  ipt_TCPMSS.o
ip_nat_h323.o           ipt_esp.o          ipt_NETLINK.o     ipt_time.o
ip_nat_irc.o            ipt_helper.o       ipt_nth.o         ipt_tos.o
ip_nat_snmp_basic.o     ipt_IMQ.o          ipt_owner.o       ipt_TOS.o
ip_pool.o               ipt_iplimit.o      ipt_pkttype.o     ipt_ttl.o
ip_queue.o              ipt_ipv4options.o  ipt_pool.o        ipt_TTL.o
iptable_filter.o        ipt_length.o       ipt_POOL.o        ipt_ULOG.o
iptable_mangle.o        ipt_limit.o        ipt_psd.o         ipt_unclean.o
#

so surely something is wrong when i get the above said messages on 
/var/log/messages---EVERY ONE MIN...& even at none peak time like late 
midnight !! ...

can someone tell me whats wrong ?..how can i solve this problem??


> regards
> A.H
> 


