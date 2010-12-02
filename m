From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: kernel BUG: ipset 4.4
Date: Thu, 02 Dec 2010 20:31:44 +0000
Message-ID: <4CF80230.4060309@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=1b5RUZcUbqEqbF3eeXROmqtxEs5oPmX1Qgzg2u8TeKo=;
        b=D6quGV8xE1F3RMPgUb+A+7ZsfeVNjLskY/XobShbtrqNAIBTDfIgzD10KScerUNJUZ
         54re42sT5vHLFkvWEcB8ZP/LYsCSEHCm3v0k9rZ6aGdxf0jaWz8VlbeW1CkThWSjBAPY
         ypaGp5ENaLp5eHGOVP46Uz7dNOaHPkQJ9veoA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

When executing ipset -L <ipset_name> to list the contents of a 
(medium-size) ipset I am getting the following kernel error (from 
/var/log/messages):

Dec  2 16:47:57 voip7 kernel: BUG: sleeping function called from invalid 
context at mm/slub.c:1705
Dec  2 16:47:57 voip7 kernel: in_atomic(): 1, irqs_disabled(): 0, pid: 
29531, name: ipset
Dec  2 16:47:57 voip7 kernel: Pid: 29531, comm: ipset Not tainted 
2.6.34.7-56.fc13.i686 #1
Dec  2 16:47:57 voip7 kernel: Call Trace:
Dec  2 16:47:57 voip7 kernel: [<c042a707>] __might_sleep+0xca/0xd1
Dec  2 16:47:57 voip7 kernel: [<c04c9424>] kmem_cache_alloc+0x35/0xd9
Dec  2 16:47:57 voip7 kernel: [<d38b6bd7>] iptreemap_del+0xb2/0x4c2 
[ip_set_iptreemap]
Dec  2 16:47:57 voip7 kernel: [<c04bc77c>] ? map_vm_area+0x26/0x39
Dec  2 16:47:57 voip7 kernel: [<d38b7031>] iptreemap_udel+0x22/0x27 
[ip_set_iptreemap]
Dec  2 16:47:57 voip7 kernel: [<d36e64e5>] ip_set_delip+0x2e/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e77ea>] ip_set_sockfn_set+0x4f5/0x567 
[ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e64b7>] ? ip_set_delip+0x0/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e645e>] ? ip_set_addip+0x0/0x59 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e64b7>] ? ip_set_delip+0x0/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e63af>] ? ip_set_testip+0x0/0x4a [ip_set]
Dec  2 16:47:57 voip7 kernel: [<c071eaa7>] nf_sockopt+0x103/0x118
Dec  2 16:47:57 voip7 kernel: [<c071eaf0>] nf_setsockopt+0x1a/0x1f
Dec  2 16:47:57 voip7 kernel: [<c0730e43>] ip_setsockopt+0x60/0x85
Dec  2 16:47:57 voip7 kernel: [<c07469fc>] raw_setsockopt+0x1f/0x62
Dec  2 16:47:57 voip7 kernel: [<c06f9100>] sock_common_setsockopt+0x18/0x1d
Dec  2 16:47:57 voip7 kernel: [<c06f72bc>] sys_setsockopt+0x6d/0x88
Dec  2 16:47:57 voip7 kernel: [<c06f89da>] sys_socketcall+0x145/0x1aa
Dec  2 16:47:57 voip7 kernel: [<c0790a64>] syscall_call+0x7/0xb
Dec  2 16:47:57 voip7 kernel: BUG: scheduling while atomic: 
ipset/29531/0x10000100
Dec  2 16:47:57 voip7 kernel: Modules linked in: tcp_diag inet_diag tun 
snd_cs4236 snd_wss_lib snd_opl3_lib snd_hwdep snd_mpu401_uart 
xt_CONNSECMARK xt_SECMARK act_mirred ip6table_filter ip6_tables 
ip_set_ipmap ip_set_iptree ip_set_portmap ip_set_iptreemap ifb 
act_police cls_flow cls_fw cls_u32 sch_htb sch_hfsc sch_ingress sch_sfq 
xt_LOGMARK xt_time xt_connlimit xt_realm ipt_set ip_set_iphash ip_set 
iptable_raw xt_IPMARK xt_comment xt_ipp2p compat_xtables xt_recent 
xt_policy ipt_ULOG ipt_REDIRECT ipt_NETMAP ipt_MASQUERADE ipt_ECN 
ipt_ecn ipt_CLUSTERIP ipt_ah ipt_addrtype nf_nat_tftp nf_nat_snmp_basic 
nf_nat_sip nf_nat_pptp nf_nat_proto_gre nf_nat_irc nf_nat_h323 
nf_nat_ftp nf_nat_amanda ts_kmp nf_conntrack_amanda nf_conntrack_sane 
nf_conntrack_tftp nf_conntrack_sip nf_conntrack_proto_sctp 
nf_conntrack_pptp nf_conntrack_proto_gre nf_conntrack_netlink 
nf_conntrack_netbios_ns nf_conntrack_irc nf_conntrack_h323 
nf_conntrack_ftp xt_TPROXY nf_tproxy_core xt_tcpmss xt_pkttype 
xt_physdev xt_owner xt_NFQUEUE xt_NFLOG nf
Dec  2 16:47:57 voip7 kernel: netlink_log xt_multiport xt_MARK xt_mark 
xt_mac xt_limit xt_length xt_iprange xt_helper xt_hashlimit xt_DSCP 
xt_dscp xt_dccp xt_CONNMARK xt_connmark xt_CLASSIFY ipt_LOG iptable_nat 
nf_nat iptable_mangle nfnetlink ipv6 snd_cs46xx gameport snd_rawmidi 
snd_ac97_codec ac97_bus snd_seq snd_seq_device snd_pcm 8139too snd_timer 
mii snd i2c_piix4 soundcore yenta_socket i2c_core snd_page_alloc 
rsrc_nonstatic squashfs ext2 [last unloaded: scsi_wait_scan]
Dec  2 16:47:57 voip7 kernel: Pid: 29531, comm: ipset Not tainted 
2.6.34.7-56.fc13.i686 #1
Dec  2 16:47:57 voip7 kernel: Call Trace:
Dec  2 16:47:57 voip7 kernel: [<c0432c28>] __schedule_bug+0x51/0x56
Dec  2 16:47:57 voip7 kernel: [<c078ecab>] schedule+0x88/0x5dc
Dec  2 16:47:57 voip7 kernel: [<c0405af8>] ? show_trace+0x15/0x19
Dec  2 16:47:57 voip7 kernel: [<d38b6bd7>] ? iptreemap_del+0xb2/0x4c2 
[ip_set_iptreemap]
Dec  2 16:47:57 voip7 kernel: [<c078f325>] _cond_resched+0x2e/0x47
Dec  2 16:47:57 voip7 kernel: [<c04c9429>] kmem_cache_alloc+0x3a/0xd9
Dec  2 16:47:57 voip7 kernel: [<d38b6bd7>] iptreemap_del+0xb2/0x4c2 
[ip_set_iptreemap]
Dec  2 16:47:57 voip7 kernel: [<c04bc77c>] ? map_vm_area+0x26/0x39
Dec  2 16:47:57 voip7 kernel: [<d38b7031>] iptreemap_udel+0x22/0x27 
[ip_set_iptreemap]
Dec  2 16:47:57 voip7 kernel: [<d36e64e5>] ip_set_delip+0x2e/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e77ea>] ip_set_sockfn_set+0x4f5/0x567 
[ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e64b7>] ? ip_set_delip+0x0/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e645e>] ? ip_set_addip+0x0/0x59 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e64b7>] ? ip_set_delip+0x0/0x40 [ip_set]
Dec  2 16:47:57 voip7 kernel: [<d36e63af>] ? ip_set_testip+0x0/0x4a [ip_set]
Dec  2 16:47:57 voip7 kernel: [<c071eaa7>] nf_sockopt+0x103/0x118
Dec  2 16:47:57 voip7 kernel: [<c071eaf0>] nf_setsockopt+0x1a/0x1f
Dec  2 16:47:57 voip7 kernel: [<c0730e43>] ip_setsockopt+0x60/0x85
Dec  2 16:47:57 voip7 kernel: [<c07469fc>] raw_setsockopt+0x1f/0x62
Dec  2 16:47:57 voip7 kernel: [<c06f9100>] sock_common_setsockopt+0x18/0x1d
Dec  2 16:47:57 voip7 kernel: [<c06f72bc>] sys_setsockopt+0x6d/0x88
Dec  2 16:47:57 voip7 kernel: [<c06f89da>] sys_socketcall+0x145/0x1aa
Dec  2 16:47:57 voip7 kernel: [<c0790a64>] syscall_call+0x7/0xb


Any idea what may be the cause? The system is Pentium2-based with 288MB 
RAM and kernel 2.6.34.7-56 with xtables 1.30 and ipset 4.4 installed.
