From: Andreas Schultz <aschultz@tpip.net>
Subject: BUG: using smp_processor_id() in preemptible [00000000] code:
 iptables-compat/498
Date: Thu, 8 Jan 2015 17:54:46 +0000 (UTC)
Message-ID: <313639491.1562295.1420739686846.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

With iptables-compat from git.netfilter.org/iptables, on Linux 3.17.6 I get
this  kernel BUG message:

BUG: using smp_processor_id() in preemptible [00000000] code: iptables-compat/498
caller is debug_smp_processor_id+0x17/0x20
CPU: 3 PID: 498 Comm: iptables-compat Tainted: G           O   3.17.6-tplino-standard #3
Hardware name: To be filled by O.E.M. To be filled by O.E.M./MAHOBAY, BIOS 4.6.5 08/20/2012
 ffffffff81cd1768 ffff8800d1733990 ffffffff81892927 0000000000000003
 ffff8800d17339b8 ffffffff81425f10 ffffffff81eeb7d8 000060fee0a03d90
 ffff8800d51e0b00 ffff8800d17339c8 ffffffff81425f37 ffff8800d1733a08
Call Trace:
 [<ffffffff81892927>] dump_stack+0x4e/0x7a
 [<ffffffff81425f10>] check_preemption_disabled+0xf0/0x100
 [<ffffffff81425f37>] debug_smp_processor_id+0x17/0x20
 [<ffffffffa01fb0b2>] nft_stats_alloc+0xa2/0x110 [nf_tables]
 [<ffffffffa01fdbb1>] nf_tables_newchain+0x4b1/0x900 [nf_tables]
 [<ffffffff81431ed9>] ? nla_parse+0xb9/0x120
 [<ffffffffa005b93e>] nfnetlink_rcv+0x2fe/0x497 [nfnetlink]
 [<ffffffffa005b7f9>] ? nfnetlink_rcv+0x1b9/0x497 [nfnetlink]
 [<ffffffff817afd76>] netlink_unicast+0x166/0x210
 [<ffffffff817b0130>] netlink_sendmsg+0x310/0x420
 [<ffffffff81766723>] sock_sendmsg+0x73/0x90
 [<ffffffff8114e517>] ? pagevec_lru_move_fn+0xe7/0x100
 [<ffffffff8176890c>] ? move_addr_to_kernel+0x2c/0x50
 [<ffffffff81776233>] ? verify_iovec+0x43/0xc0
 [<ffffffff81767300>] ___sys_sendmsg+0x3a0/0x3b0
 [<ffffffff8189a626>] ? _raw_spin_unlock+0x16/0x30
 [<ffffffff8116c3f5>] ? handle_mm_fault+0x605/0xb40
 [<ffffffff81041d84>] ? __do_page_fault+0x214/0x5a0
 [<ffffffff81097c3d>] ? get_parent_ip+0xd/0x50
 [<ffffffff81074133>] ? __local_bh_enable_ip+0x43/0xb0
 [<ffffffff8189a90a>] ? _raw_spin_unlock_bh+0x1a/0x20
 [<ffffffff8176c3b5>] ? release_sock+0x145/0x170
 [<ffffffff81768f82>] __sys_sendmsg+0x42/0x80
 [<ffffffff81768fd2>] SyS_sendmsg+0x12/0x20
 [<ffffffff8189b1d2>] system_call_fastpath+0x16/0x1b

Has this been fixed in 3.18 or later?

Andreas
-- 
Andreas Schultz
