From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: WARNING: at include/net/dst.h:162
Date: Mon, 12 Sep 2011 11:54:10 +0200
Message-ID: <4E6DD6C2.60800@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=9lFJej3C4pk+a0xoEbhNmZ+0S32r+Bn0WHscnTkYnkc=;
	b=C9yJBX0opKK41Pce7pk1u5Kgq8ER7B+ajHSJVNxHQlIAhSUezkEyB+Qk6ryttOxnjZVbgQ/g2cXI7F1wpLNUSbuHNn4N3Sloc8swoTYwIMWgtuX4MA51ByrCe+XGLErx;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!
I hope problem with xtables-addons can be discussed at this mailinglist. 
I'm using xtables-addons-1.37 (gentoo) with kernel: 
hardened-sources-3.0.4-r1 . In dmesg i can see message [1] which appears 
only once. It happens while firewall is loading, probably TARPIT creates 
such message. It looks TARPIT works correctly regardless this warning.
P.S. This is XEN HV machine.
Regards,
Marcin

[1] -
[  153.108353] ------------[ cut here ]------------
[  153.108359] WARNING: at include/net/dst.h:162 0xffffffffa018a75e()
[  153.108360] Hardware name: HVM domU
[  153.108361] Modules linked in: tun zram(C) cryptd aes_x86_64 
aes_generic cbc dm_crypt sit tunnel4 xt_TCPMSS xt_multiport xt_geoip 
xt_set xt_TARPIT ip_set_hash_ip
ip_set_hash_net sha1_generic xt_SYSRQ compat_xtables nf_conntrack_ipv6 
nf_defrag_ipv6 ip6t_rt xt_state ip_set ip6table_mangle iptable_mangle 
iptable_nat nf_nat nf_co
nntrack_ipv4 nf_conntrack nf_defrag_ipv4 ip6table_filter ip6_tables 
iptable_filter xfs exportfs dm_mod sr_mod 8139too cdrom evdev 8139cp
[  153.108381] Pid: 2941, comm: openvpn Tainted: G         C 
3.0.4-hardened-r1 #1
[  153.108383] Call Trace:
[  153.108384]  <IRQ>  [<ffffffffa018a7c0>] ? cleanup_module+0x38/0xa8 
[xt_TARPIT]
[  153.108392]  [<ffffffff810393ab>] ? warn_slowpath_common+0x7b/0xc0
[  153.108394]  [<ffffffffa018a75e>] ? 0xffffffffa018a75d
[  153.108397]  [<ffffffffa01811ee>] ? 0xffffffffa01811ed
[  153.108400]  [<ffffffffa0165018>] ? 0xffffffffa0165017
[  153.108404]  [<ffffffff812e79dc>] ? ipt_do_table+0x2bc/0x3c0
[  153.108408]  [<ffffffff812a5c50>] ? ip_rcv_finish+0x2f0/0x2f0
[  153.108411]  [<ffffffff8129c3c3>] ? nf_iterate+0x83/0xc0
[  153.108413]  [<ffffffff812a5c50>] ? ip_rcv_finish+0x2f0/0x2f0
[  153.108415]  [<ffffffff8129c47c>] ? nf_hook_slow+0x7c/0x130
[  153.108416]  [<ffffffff812a5c50>] ? ip_rcv_finish+0x2f0/0x2f0
[  153.108420]  [<ffffffffa00053b1>] ? cp_rx_poll+0x431/0x440 [8139cp]
[  153.108422]  [<ffffffff812a5fa4>] ? ip_local_deliver+0x54/0x90
[  153.108426]  [<ffffffff812738e2>] ? __netif_receive_skb+0x192/0x3d0
[  153.108428]  [<ffffffff81277734>] ? process_backlog+0x94/0x170
[  153.108431]  [<ffffffff81277891>] ? net_rx_action+0x81/0x120
[  153.108434]  [<ffffffff8103f826>] ? __do_softirq+0x96/0x110
[  153.108438]  [<ffffffff8133d97c>] ? call_softirq+0x1c/0x30
[  153.108439]  <EOI>  [<ffffffff81004a6d>] ? do_softirq+0x4d/0x80
[  153.108443]  [<ffffffff81275d3e>] ? netif_rx_ni+0x1e/0x30
[  153.108445]  [<ffffffffa01fd4bd>] ? tun_chr_aio_write+0x35d/0x500 [tun]
[  153.108449]  [<ffffffff810d8e1f>] ? do_sync_write+0xbf/0x100
[  153.108452]  [<ffffffff810232f9>] ? do_page_fault+0x419/0x500
[  153.108454]  [<ffffffff810232f9>] ? do_page_fault+0x419/0x500
[  153.108457]  [<ffffffff8118e6c4>] ? security_file_permission+0x24/0xc0
[  153.108459]  [<ffffffff810d96a9>] ? vfs_write+0x109/0x1f0
[  153.108461]  [<ffffffff810d9a7e>] ? sys_write+0x4e/0x90
[  153.108464]  [<ffffffff8133c9b7>] ? system_call_after_swapgs+0x17/0x63
[  153.108466]  [<ffffffff8133ca19>] ? system_call_fastpath+0x16/0x1b
[  153.108468]  [<ffffffff8133c9b7>] ? system_call_after_swapgs+0x17/0x63
[  153.108470] ---[ end trace e800c936aa093764 ]---
