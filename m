From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: BUG: soft lockup on kernel 5.19.9 when attempting FTP connections
Date: Tue, 20 Sep 2022 12:41:13 -0300
Message-ID: <37c01892-11ea-4347-7eae-871d46fecf41@riosoft.com.br>
References: <b2f301f6-d335-04bd-43b2-001e5dcacc09@riosoft.com.br>
 <20220920151952.GD30575@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
dkim-signature: v=1; c=relaxed; h=message-id:date:mime-version:subject:to:references:from:in-reply-to:content-type:content-transfer-encoding;
 d=riosoft.com.br; s=default; a=rsa-sha256;
 bh=hEESiv6l43VRFsXJdwDSxjkiOlKENvdBJ4CKPjJcqVQ=;
 b=YfSorz2tZcEkTvKeRLjpdbsNwDZsSJzrBbvt4xMQzzJ21tCviUh3LDLAgUrjT613p
 /lLsBbqrfkW+1Q50SBERJsBpvTm9GErDw0mL+4gVG6Xf+VwN1CQ5eMZJ0cuk8654hUy
 3rw5VzK3uvLVpLnZP5Sz7BtsHfWeSvjNGvjGiXw=;
Content-Language: pt-BR
In-Reply-To: <20220920151952.GD30575@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Em 20/09/2022 12:19, Florian Westphal escreveu:
> Thats all? No backtrace? 

Sorry, I wasn't sure on what would be helpful.
This was on syslog. If it isn't enough, please instruct me on how to 
output what you need.

I also forgot to include that this is a Xen guest (xen 4.7.4, kernel 4.4.0).
Guest drivers:
xe-guest-utilities-xenstore-7.4.0-1.x86_64
xe-guest-utilities-7.4.0-1.x86_64


Sep 20 11:05:05 fw1-test kernel: watchdog: BUG: soft lockup - CPU#1 
stuck for 26s! [swapper/1:0]
Sep 20 11:05:05 fw1-test kernel: Modules linked in: nf_nat_ftp 
nf_conntrack_ftp xt_MASQUERADE nft_chain_nat xt_nat nf_nat xt_state 
xt_conntrack nft_compat nf_tables nfnetlink qrtr xenfs xen_privcmd 
rfkill sunrpc ppdev joydev parport_pc parport i2c_piix4 
nf_conntrack_pptp fuse zram xen_netfront crct10dif_pclmul crc32_pclmul 
crc32c_intel xen_blkfront ghash_clmulni_intel bochs drm_vram_helper 
drm_ttm_helper serio_raw ttm ata_generic pata_acpi nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4
Sep 20 11:05:05 fw1-test kernel: Unloaded tainted modules: 
acpi_cpufreq():1 acpi_cpufreq():1 intel_cstate():1 intel_cstate():1 
intel_uncore():1 intel_uncore():1 fjes():1 fjes():1 fjes():1 
pcc_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 
fjes():1 fjes():1 fjes():1
Sep 20 11:05:05 fw1-test kernel: CPU: 1 PID: 0 Comm: swapper/1 Not 
tainted 5.19.9-200.fc36.x86_64 #1
Sep 20 11:05:05 fw1-test kernel: Hardware name: Xen HVM domU, BIOS 
4.7.4-2.11 02/23/2018
Sep 20 11:05:05 fw1-test kernel: RIP: 0010:xen_hypercall_sched_op+0x8/0x20
Sep 20 11:05:05 fw1-test kernel: Code: cc cc b8 1c 00 00 00 0f 01 c1 c3 
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc b8 
1d 00 00 00 0f 01 c1 <c3> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 
cc cc cc cc cc cc
Sep 20 11:05:05 fw1-test kernel: RSP: 0018:ffffb6db0014c838 EFLAGS: 00000206
Sep 20 11:05:05 fw1-test kernel: RAX: 0000000000000000 RBX: 
ffffa0b93c25ef80 RCX: 0000000000000000
Sep 20 11:05:05 fw1-test kernel: RDX: ffffa0b881825628 RSI: 
ffffb6db0014c848 RDI: 0000000000000003
Sep 20 11:05:05 fw1-test kernel: RBP: 0000000000000003 R08: 
ffffa0b881401678 R09: ffffffffa4f46180
Sep 20 11:05:05 fw1-test kernel: R10: 0000000000000000 R11: 
0000000000000000 R12: ffffa0b8886cc304
Sep 20 11:05:05 fw1-test kernel: R13: 0000000000000039 R14: 
ffffa0b93c2726c0 R15: 0000000000000000
Sep 20 11:05:05 fw1-test kernel: FS:  0000000000000000(0000) 
GS:ffffa0b93c240000(0000) knlGS:0000000000000000
Sep 20 11:05:05 fw1-test kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 
0000000080050033
Sep 20 11:05:05 fw1-test kernel: CR2: 00005610f4e10f50 CR3: 
0000000002af0003 CR4: 00000000000206e0
Sep 20 11:05:05 fw1-test kernel: Call Trace:
Sep 20 11:05:05 fw1-test kernel: <IRQ>
Sep 20 11:05:05 fw1-test kernel: ? xen_poll_irq+0x60/0x90
Sep 20 11:05:05 fw1-test kernel: ? xen_qlock_wait+0x8a/0x90
Sep 20 11:05:05 fw1-test kernel: ? 
__pv_queued_spin_lock_slowpath+0x344/0x380
Sep 20 11:05:05 fw1-test kernel: ? _raw_spin_lock_bh+0x30/0x40
Sep 20 11:05:05 fw1-test kernel: ? nf_ct_seqadj_set+0x61/0xe0 [nf_conntrack]
Sep 20 11:05:05 fw1-test kernel: ? 
__nf_nat_mangle_tcp_packet+0x105/0x170 [nf_nat]
Sep 20 11:05:05 fw1-test kernel: ? nf_nat_ftp+0x19a/0x2d0 [nf_nat_ftp]
Sep 20 11:05:05 fw1-test kernel: ? nf_ct_expect_alloc+0x1a/0x40 
[nf_conntrack]
Sep 20 11:05:05 fw1-test kernel: ? help+0x55f/0x910 [nf_conntrack_ftp]
Sep 20 11:05:05 fw1-test kernel: ? help+0x55f/0x910 [nf_conntrack_ftp]
Sep 20 11:05:05 fw1-test kernel: ? try_rfc959+0x70/0x70 [nf_conntrack_ftp]
Sep 20 11:05:05 fw1-test kernel: ? nf_confirm+0x5a/0x120 [nf_conntrack]
Sep 20 11:05:05 fw1-test kernel: ? nf_confirm+0x5a/0x120 [nf_conntrack]
Sep 20 11:05:05 fw1-test kernel: ? nf_hook_slow+0x41/0xc0
Sep 20 11:05:05 fw1-test kernel: ? ip_output+0xb8/0xf0
Sep 20 11:05:05 fw1-test kernel: ? __ip_finish_output+0x190/0x190
Sep 20 11:05:05 fw1-test kernel: ? ip_sublist_rcv_finish+0x85/0x90
Sep 20 11:05:05 fw1-test kernel: ? ip_sublist_rcv+0x173/0x200
Sep 20 11:05:05 fw1-test kernel: ? ip_sublist_rcv+0x200/0x200
Sep 20 11:05:05 fw1-test kernel: ? ip_list_rcv+0x129/0x140
Sep 20 11:05:05 fw1-test kernel: ? __netif_receive_skb_list_core+0x288/0x2b0
Sep 20 11:05:05 fw1-test kernel: ? __netdev_alloc_skb+0x3b/0x150
Sep 20 11:05:05 fw1-test kernel: ? 
netif_receive_skb_list_internal+0x1b7/0x2d0
Sep 20 11:05:05 fw1-test kernel: ? napi_complete_done+0x6d/0x1a0
Sep 20 11:05:05 fw1-test kernel: ? xennet_poll+0x856/0x950 [xen_netfront]
Sep 20 11:05:05 fw1-test kernel: ? __raise_softirq_irqoff+0x16/0x70
Sep 20 11:05:05 fw1-test kernel: ? __napi_poll+0x2b/0x160
Sep 20 11:05:05 fw1-test kernel: ? net_rx_action+0x278/0x330
Sep 20 11:05:05 fw1-test kernel: ? __do_softirq+0xfb/0x30f
Sep 20 11:05:05 fw1-test kernel: ? __irq_exit_rcu+0xc5/0x140
Sep 20 11:05:05 fw1-test kernel: ? sysvec_xen_hvm_callback+0x9e/0xc0
Sep 20 11:05:05 fw1-test kernel: </IRQ>
Sep 20 11:05:05 fw1-test kernel: <TASK>
Sep 20 11:05:05 fw1-test kernel: ? asm_sysvec_xen_hvm_callback+0x16/0x20
Sep 20 11:05:05 fw1-test kernel: ? native_safe_halt+0xb/0x10
Sep 20 11:05:05 fw1-test kernel: ? acpi_idle_do_entry+0x56/0x70
Sep 20 11:05:05 fw1-test kernel: ? acpi_idle_enter+0xa4/0x100
Sep 20 11:05:05 fw1-test kernel: ? cpuidle_enter_state+0x89/0x380
Sep 20 11:05:05 fw1-test kernel: ? cpuidle_enter+0x29/0x40
Sep 20 11:05:05 fw1-test kernel: ? do_idle+0x1b6/0x230
Sep 20 11:05:05 fw1-test kernel: ? cpu_startup_entry+0x19/0x20
Sep 20 11:05:05 fw1-test kernel: ? start_secondary+0x102/0x120
Sep 20 11:05:05 fw1-test kernel: ? secondary_startup_64_no_verify+0xe5/0xeb
Sep 20 11:05:05 fw1-test kernel: </TASK>
Sep 20 11:05:07 fw1-test abrt-dump-journal-oops[840]: 
abrt-dump-journal-oops: Found oopses: 1
Sep 20 11:05:07 fw1-test abrt-dump-journal-oops[840]: 
abrt-dump-journal-oops: Creating problem directories
Sep 20 11:05:08 fw1-test abrt-dump-journal-oops[840]: Reported 1 kernel 
oopses to Abrt
Sep 20 11:05:10 fw1-test abrt-server[1141]: Can't find a meaningful 
backtrace for hashing in '.'
Sep 20 11:05:10 fw1-test abrt-server[1141]: Preserving oops '.' because 
DropNotReportableOopses is 'no'
Sep 20 11:05:11 fw1-test systemd[1]: Created slice 
system-dbus\x2d:1.5\x2dorg.freedesktop.problems.slice - Slice 
/system/dbus-:1.5-org.freedesktop.problems.
Sep 20 11:05:11 fw1-test systemd[1]: Started 
dbus-:1.5-org.freedesktop.problems@0.service.
Sep 20 11:05:11 fw1-test abrt-notification[1162]: System encountered a 
non-fatal error in ??()
