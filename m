From: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Subject: [xtables-addons] Oops in SYSRQ, BUG: unable to handle kernel paging
 request at ffffffffa01a90e0
Date: Fri, 20 Jan 2012 17:48:27 +0100
Message-ID: <4F199ADB.5000204@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=++38MjC8VY07oE5kWK1gyu+FHiPAG/NlRGeNryLh/fg=;
	b=caSUyFjRoM98R6outsiEmhmWOrRdS7Lhgw3XzeJmlerzkmawiYo+mfDmZX7c566+Azmp5xLhoUGkWt1hLklIpa6iOJh0bNV5IgfSNypOj0QXVVmu8CLWIiUapGbmQqhK;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi again!
I've found bug in xt_SYSRQ (probably), when i add rule with sysrq,
remove rule, unload module then add rule i'm getting Oops. Please look
at this:

# grep xt /proc/modules
# iptables -A INPUT -s 195.242.255.127 -p udp --dport 29999 -j SYSRQ
# echo -n "xxx" > /sys/module/xt_SYSRQ/parameters/password
# iptables -F
# rmmod xt_SYSRQ
# iptables -A INPUT -s 195.242.255.127 -p udp --dport 29999 -j SYSRQ

Message from syslogd@meteor at Jan 20 17:41:12 ...
 kernel:[  159.986759] Oops: 0000 [#1] SMP

Message from syslogd@meteor at Jan 20 17:41:12 ...
 kernel:[  159.989504] Stack:

Message from syslogd@meteor at Jan 20 17:41:12 ...
 kernel:[  159.989504] Call Trace:

Message from syslogd@meteor at Jan 20 17:41:12 ...
 kernel:[  159.989504] Code: 4d 8b 24 24 4d 39 e5 74 71 49 8d 7c 24 10
48 89 de e8 b4 0b f2 ff 85 c0 75 e6 45 38 74 24 2d 75 d9 49 8b 44 24 58
48 85 c0 74 1e

Message from syslogd@meteor at Jan 20 17:41:12 ...
 kernel:[  159.989504] CR2: ffffffffa01a90e0


Here is all Oops:
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.982114] BUG:
unable to handle kernel paging request at ffffffffa01a90e0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.983757] IP:
[<ffffffff812ae571>] xt_find_target+0xa1/0x120
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.984688] PGD
132d067 PUD 1333063 PMD 1d8a6063 PTE 0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.986759] Oops:
0000 [#1] SMP
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.987873] CPU 0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.988131] Modules
linked in: sha1_generic compat_xtables ip6_tables zram(C) iptable_filter
ip_tables sit tunnel4 xfs exportfs dm_mod ipv6 sr_mod 8139too evdev
cdrom 8139cp [last unloaded: xt_SYSRQ]
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] Pid:
2388, comm: iptables Tainted: G         C  3.1.8-hardened #5 Xen HVM domU
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] RIP:
0010:[<ffffffff812ae571>]  [<ffffffff812ae571>] xt_find_target+0xa1/0x120
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] RSP:
0018:ffff880016f01b98  EFLAGS: 00010282
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] RAX:
ffffffffa01a90e0 RBX: ffff880016f090a2 RCX: ffff880016f090a0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] RDX:
0000000000000000 RSI: ffff880016f090a8 RDI: ffff880016d82b96
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] RBP:
ffff880016f01be8 R08: 0000000000000010 R09: ffff880016f09260
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] R10:
0000000000000000 R11: 0000000000000010 R12: ffff880016d82b80
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] R13:
ffff88001e9e8910 R14: 0000000000000001 R15: 00000000fffffffe
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] FS:
0000039baee6d700(0000) GS:ffff88001fc00000(0000) knlGS:0000000000000000
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] CS:  0010
DS: 0000 ES: 0000 CR0: 0000000080050033
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] CR2:
ffffffffa01a90e0 CR3: 0000000001325000 CR4: 00000000000006b0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] DR0:
0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] DR3:
0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] Process
iptables (pid: 2388, threadinfo ffff88001e32ce30, task ffff88001e32ca40)
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] Stack:
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
ffff880016f01c28 0200000000000018 00000000000000e0 ffff88001e9e88e0
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
ffff88001f5745c0 0000000000000002 ffff880016f090a2 0000000000000001
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
0000000000000001 ffff88001e159c60 ffff880016f01c18 ffffffff812af499
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504] Call Trace:
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
[<ffffffff812af499>] xt_request_find_target+0x29/0x80
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
[<ffffffffa0151389>] translate_table+0x389/0x660 [ip_tables]
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
[<ffffffffa0152e05>] do_ipt_set_ctl+0x1f5/0x2a0 [ip_tables]
2012-01-20T17:41:12.276820+01:00 meteor kernel: [  159.989504]
[<ffffffff812ad456>] nf_sockopt+0x66/0xc0
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff812ad4ec>] nf_setsockopt+0x1c/0x30
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff812bee54>] ip_setsockopt+0x94/0xb0
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff812dc105>] raw_setsockopt+0x25/0x50
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff8127347c>] sock_common_setsockopt+0x1c/0x30
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff81272357>] sys_setsockopt+0x87/0xf0
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff81316f7b>] system_call_fastpath+0x18/0x1d
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff813169f5>] ? page_fault+0x35/0x40
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]
[<ffffffff813167b3>] ? retint_swapgs+0xc/0x12
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504] Code: 4d
8b 24 24 4d 39 e5 74 71 49 8d 7c 24 10 48 89 de e8 b4 0b f2 ff 85 c0 75
e6 45 38 74 24 2d 75 d9 49 8b 44 24 58 48 85 c0 74 1e
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504] RIP
[<ffffffff812ae571>] xt_find_target+0xa1/0x120
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504]  RSP
<ffff880016f01b98>
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504] CR2:
ffffffffa01a90e0
2012-01-20T17:41:12.286824+01:00 meteor kernel: [  159.989504] ---[ end
trace 5347f098273ef2a7 ]---

$ uname -r
3.1.8-hardened
# iptables -V
iptables v1.4.12.1

Regards.
Marcin



