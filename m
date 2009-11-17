From: "Tim Fennelly" <tfennelly@vtap.com>
Subject: BUG: soft lockup detected on CPU#6!
Date: Tue, 17 Nov 2009 18:52:44 -0500
Message-ID: <BC509C21E21C6D42B57342019E74B9D176679A@usmail.veveotv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
  Has anyone received a similar alarm?

Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (8192 buckets, 65536 max) - 304 bytes per
conntrack
BUG: soft lockup detected on CPU#6!

Call Trace:
 <IRQ>  [<ffffffff800b2c85>] softlockup_tick+0xdb/0xed
 [<ffffffff800933d1>] update_process_times+0x42/0x68
 [<ffffffff80073d97>] smp_local_timer_interrupt+0x23/0x47
 [<ffffffff80074459>] smp_apic_timer_interrupt+0x41/0x47
 [<ffffffff8005bcc2>] apic_timer_interrupt+0x66/0x6c
 [<ffffffff8021f45f>] dst_rcu_free+0x0/0x3a
 [<ffffffff8006263c>] _spin_lock_bh+0xc/0x14
 [<ffffffff8003cc82>] rt_run_flush+0x57/0xb8
 [<ffffffff8003cc2b>] rt_run_flush+0x0/0xb8
 [<ffffffff80092bf7>] run_timer_softirq+0x133/0x1b0
 [<ffffffff80011c19>] __do_softirq+0x5e/0xd5
 [<ffffffff8005c330>] call_softirq+0x1c/0x28
 [<ffffffff8006a310>] do_softirq+0x2c/0x85
 [<ffffffff8005bcc2>] apic_timer_interrupt+0x66/0x6c
 <EOI>  [<ffffffff80008480>] copy_page_range+0x5cc/0x734
 [<ffffffff80008466>] copy_page_range+0x5b2/0x734
 [<ffffffff8003bb4c>] __get_free_pages+0xe/0x71
 [<ffffffff800620b4>] __down_write_nested+0x12/0x92
 [<ffffffff8001f1f4>] copy_process+0xcfb/0x155d
 [<ffffffff800309f9>] do_fork+0x68/0x166
 [<ffffffff8005b2c1>] tracesys+0xd1/0xdc
 [<ffffffff8005b45b>] ptregscall_common+0x67/0xac

Any help would be greatly appreciated!

Thanks

Tim Fennelly 
Customer Support
Veveo Inc.
http://vtap.com


