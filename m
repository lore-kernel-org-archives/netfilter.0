From: iptables@haveland.com
Subject: Limit on number of rulesets?
Date: Tue, 15 Apr 2008 21:18:19 +0200
Message-ID: <lou904pmh4hkcovha7fkv9o37vnmt27ud5@4ax.com>
Reply-To: iptables@haveland.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jan2008.admin;
	s=jan2008.admin; t=1208287099; bh=aFgqxfFd7Ah3UBnCLcA4VP1bxmdXvpkgI
	BXkoW+pnWc=; h=From:To:Subject:Date:Reply-To:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding; b=mfPxs9IP2fn
	1FeN6q4LrYhjmcpidyAVe6iQabGS0lND498HNToX3i5szzINiXLdgvYdv8Kk3JLkzPg
	JG1E7coIFnURZq/MvfwwPAluxJ6U1b6gxToMNKcSe6PU0861zb0Arrt4iz8rpXPprSp
	gm/RkCnkrgiUVY67qXlcp8/r5c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've been dealing with a long standing ddos attack and banning addresses as
they happen, but now iptables just hangs when trying to use it to add, list,
delete or save, but responds to ctrl-c. It also prevents the machine from
shutting down, which is a pain as it's colocated and needs someone to push
the BRS...

It is still working, and doing its job well - but I think it has reached an
arbitrary limit. As there are about 60,000 individual addresses banned and
other rules, could it be that rule ids are short ints? Or a memory page
problem? The previous saved ruleset is nearly 4Mb.

So question is, what limits are there? Having so may rules doesn't appear to
affect performance very much, so I guess the addresses are stored as hash
keys.

System is FC8, with latest kernel and iptables and here is a dump that
appeared in /var/log/messages which my shed some light.

>Unable to handle kernel paging request at fffffffb8815b7d0 RIP:
> [<ffffffff8812fa13>] :ip_tables:do_ipt_get_ctl+0x1e8/0x329
>PGD 203067 PUD 0
>Oops: 0000 [1] SMP
>CPU 0
>Modules linked in: autofs4 w83627hf hwmon_vid eeprom sunrpc ipv6 nf_conntrack_ftp nf_conntrack_netbios_ns ipt_REJECT xt_tcpudp ipt_LOG nf_conntrack_ipv4 xt_state nf_conntrack iptable_filter ip_tables x_tables dm_mirror
>dm_mod button forcedeth pcspkr k8temp i2c_nforce2 i2c_core hwmon sg sr_mod cdrom sata_nv pata_amd ata_generic pata_acpi libata sd_mod scsi_mod ext3 jbd mbcache uhci_hcd ohci_hcd ehci_hcd
>Pid: 9611, comm: iptables Not tainted 2.6.24.4-64.fc8 #1
>RIP: 0010:[<ffffffff8812fa13>]  [<ffffffff8812fa13>] :ip_tables:do_ipt_get_ctl+0x1e8/0x329
>RSP: 0018:ffff810044a9fe28  EFLAGS: 00010282
>RAX: 0000000000000000 RBX: 0000000000000070 RCX: ffffffffffffffff
>RDX: 0000000000c800a0 RSI: 0000000000000070 RDI: fffffffb8815b7d0
>RBP: ffffc20001574308 R08: fffffffb8815b7d0 R09: ffffffff88137820
>R10: 0000000000000000 R11: 0000000000000001 R12: ffffffff88137820
>R13: ffffc20001574298 R14: 00002aaaaabc82d0 R15: 0000000000abc6a0
>FS:  00002aaaaaad2020(0000) GS:ffffffff813cb000(0000) knlGS:00000000f7807b90
>CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
>CR2: fffffffb8815b7d0 CR3: 0000000045a36000 CR4: 00000000000006a0
>DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
>Process iptables (pid: 9611, threadinfo ffff810044a9e000, task ffff81000d93e8b0)
>Stack:  0000000000000698 ffffc2000147f000 ffffc200009c1000 000f5298aaaaaad3
> 00002aaaaaad3038 00000000000013ad 00007265746c6966 0000000000000000
> 0000000000000000 0000000000000000 0000000000abc6a0 ffffffff812684df
>Call Trace:
> [<ffffffff812684df>] mutex_lock_interruptible+0x1a/0x2f
> [<ffffffff8121574b>] nf_sockopt+0x48/0x73
> [<ffffffff81220ca9>] ip_getsockopt+0x6e/0x99
> [<ffffffff811eed4a>] sys_getsockopt+0x75/0x99
> [<ffffffff8100c005>] tracesys+0xd5/0xda
>
>
>Code: f2 ae 49 8d 7c 36 02 4c 89 c6 89 ca f7 d2 e8 0a 88 ff f8 48
>RIP  [<ffffffff8812fa13>] :ip_tables:do_ipt_get_ctl+0x1e8/0x329
> RSP <ffff810044a9fe28>
>CR2: fffffffb8815b7d0
>---[ end trace d4b04a24ed76d3e9 ]---
>BUG: sleeping function called from invalid context at kernel/rwsem.c:21
>in_atomic():0, irqs_disabled():1
>Pid: 9611, comm: iptables Tainted: G      D 2.6.24.4-64.fc8 #1
>
>Call Trace:
> [<ffffffff812687e5>] down_read+0x15/0x23
> [<ffffffff8105dddd>] acct_collect+0x42/0x18e
> [<ffffffff8103a622>] do_exit+0x217/0x76b
> [<ffffffff8126b336>] do_page_fault+0x5c3/0x691
> [<ffffffff81082a71>] zone_statistics+0x3f/0x60
> [<ffffffff81269739>] error_exit+0x0/0x51
> [<ffffffff8812fa13>] :ip_tables:do_ipt_get_ctl+0x1e8/0x329
> [<ffffffff8812f9ea>] :ip_tables:do_ipt_get_ctl+0x1bf/0x329
> [<ffffffff812684df>] mutex_lock_interruptible+0x1a/0x2f
> [<ffffffff8121574b>] nf_sockopt+0x48/0x73
> [<ffffffff81220ca9>] ip_getsockopt+0x6e/0x99
> [<ffffffff811eed4a>] sys_getsockopt+0x75/0x99
> [<ffffffff8100c005>] tracesys+0xd5/0xda

/etc/init.d/iptables stop also hangs, but ctrl-C then gives this error:
Message from syslogd@gaia at Apr 15 21:15:31 ...
 kernel: Oops: 0000 [3] SMP
Message from syslogd@gaia at Apr 15 21:15:31 ...
 kernel: CR2: fffffffb8815b7d0

An interesting problem - but what process would I need to kill to be able to
release iptables and reload? Or is this even possible if part of the kernel?

Definitely something to investigate!

Cheers,
Andy.
