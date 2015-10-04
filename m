From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Kernel panic in 4.1.6 in nf_nat_redirect
Date: Sun, 4 Oct 2015 21:05:43 +0200
Message-ID: <20151004190543.GA17688@salvia>
References: <560D9DDD.8000601@seti.kr.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560D9DDD.8000601@seti.kr.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew <nitr0@seti.kr.ua>
Cc: netfilter@vger.kernel.org

On Thu, Oct 01, 2015 at 11:55:57PM +0300, Andrew wrote:
> Hi all.
> 
> I tried to do redirect for some users to captive portal, and for this I use
> tiny web page, which returns 302 with captive portal address + original URL
> in param to client. Traffic on it is forwarded with ipt_redirect. But I've
> got kernel crashes in this setup.
> 
> Here's NAT rules:
> 
> *nat
> :PREROUTING ACCEPT [2658:343256]
> :INPUT ACCEPT [319:83916]
> :OUTPUT ACCEPT [468:79362]
> :POSTROUTING ACCEPT [664:93083]
> :UNAUTH - [0:0]
> -A PREROUTING -s 10.250.128.0/20 -j UNAUTH
> -A UNAUTH -d x.x.x.x/32 -j RETURN
> -A UNAUTH -d 10.255.0.65/32 -j RETURN
> -A UNAUTH -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 40080
> COMMIT
> 
> Here's kernel crash log:
> 
> [   42.611663] BUG: unable to handle kernel NULL pointer dereference at
> 00000018
> [   42.612603] IP: [<f93f4024>] nf_nat_redirect_ipv4+0x24/0xb0
> [nf_nat_redirect]

Could you please do the following?

$ gdb net/netfilter/nf_nat_redirect.o
$ list *nf_nat_redirect_ipv4+0x24

And post the result, thanks.

> [   42.612603] *pdpt = 000000002fb9e001 *pde = 0000000000000000
> [   42.612603] Oops: 0000 [#1] SMP
> [   42.612603] Modules linked in: act_mirred xt_REDIRECT nf_nat_redirect
> iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack
> ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_filter xt_length xt_mark xt_dscp
> iptable_mangle ip_tables x_tables ipv6 ipoe(O) sch_sfq sch_htb cls_u32
> sch_ingress sch_prio sch_tbf cls_flow cls_fw act_police ifb 8021q mrp garp
> stp llc softdog pptp pppox gre ppp_generic slhc parport_pc parport igb(O)
> asus_atk0110 powernow_k8 processor thermal_sys i2c_viapro dca i2c_core ptp
> pps_core k8temp hwmon sd_mod pata_acpi pata_via sata_via floppy ehci_pci
> pcspkr ata_generic libata ehci_hcd uhci_hcd scsi_mod usbcore usb_common ext4
> mbcache jbd2 crc16 vfat fat isofs
> [   42.612603] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G O    4.1.6-i686 #1
> [   42.612603] Hardware name: System manufacturer System Product
> Name/M2V-MX, BIOS 0201    09/22/2006
> [   42.612603] task: f6c9eda0 ti: f6cde000 task.ti: f6cde000
> [   42.612603] EIP: 0060:[<f93f4024>] EFLAGS: 00210286 CPU: 1
> [   42.612603] EIP is at nf_nat_redirect_ipv4+0x24/0xb0 [nf_nat_redirect]
> [   42.612603] EAX: 00000000 EBX: f5073cbc ECX: 00000000 EDX: f5073d78
> [   42.612603] ESI: ef009360 EDI: f93fa050 EBP: f6cfbd8c ESP: f6cfbd60
> [   42.612603]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [   42.612603] CR0: 8005003b CR2: 00000018 CR3: 33bc6ae0 CR4: 000006f0
> [   42.612603] Stack:
> [   42.612603]  fffffffe 46d6ae88 46d6ae87 00000000 c151fd00 00000000
> ef009364 ef00940c
> [   42.612603]  f5073cbc ef58e840 ef58e840 f6cfbe4c f933950e 00000001
> 0001d4c0 00000020
> [   42.612603]  ef58e840 f24b6420 f93a9260 00000044 00200246 f397b000
> f6cfbe78 f9339561
> [   42.612603] Call Trace:
> [   42.612603]  [<f933950e>] ? ipt_do_table+0x28e/0x560 [ip_tables]
> [   42.612603]  [<f93a9260>] ? __nf_ct_ext_add_length+0x1c0/0x230
> [nf_conntrack]
> [   42.794016]  [<f9339561>] ? ipt_do_table+0x2e1/0x560 [ip_tables]
> [   42.794016]  [<f93a9260>] ? __nf_ct_ext_add_length+0x1c0/0x230
> [nf_conntrack]
> [   42.794016]  [<f93a205b>] ? __nf_conntrack_alloc+0xbb/0x1d0
> [nf_conntrack]
> [   42.794016]  [<f93ec020>] ? iptable_nat_ipv4_fn+0x20/0x20 [iptable_nat]
> [   42.794016]  [<f93cf762>] ? nf_nat_ipv4_fn+0x132/0x1e0 [nf_nat_ipv4]
> [   42.794016]  [<f93ec020>] ? iptable_nat_ipv4_fn+0x20/0x20 [iptable_nat]
> [   42.794016]  [<f93cf844>] ? nf_nat_ipv4_in+0x34/0x90 [nf_nat_ipv4]
> [   42.794016]  [<f93ec020>] ? iptable_nat_ipv4_fn+0x20/0x20 [iptable_nat]
> [   42.794016]  [<f93ec0a7>] ? iptable_nat_ipv4_in+0x17/0x20 [iptable_nat]
> [   42.794016]  [<f93ec020>] ? iptable_nat_ipv4_fn+0x20/0x20 [iptable_nat]
> [   42.794016]  [<c133bd71>] ? nf_iterate+0x71/0x80
> [   42.794016]  [<c133be08>] ? nf_hook_slow+0x88/0xd0
> [   42.794016]  [<c130cfdf>] ? netif_receive_skb_internal+0x7f/0x90
> [   42.794016]  [<c1342691>] ? ip_rcv+0x311/0x420
> [   42.794016]  [<f91be102>] ? ipoe_netdev_setup+0x42/0x80 [ipoe]
> [   42.794016]  [<c1341e50>] ? ip_local_deliver_finish+0x210/0x210
> [   42.794016]  [<c130a8af>] ? __netif_receive_skb_core+0x4ef/0x860
> [   42.794016]  [<c130e7d4>] ? process_backlog+0x64/0xd0
> [   42.794016]  [<c130e5d7>] ? net_rx_action+0x117/0x2b0
> [   42.794016]  [<c104e683>] ? __do_softirq+0xc3/0x240
> [   42.794016]  [<c13bb69c>] ? nmi_stack_correct+0x28/0x2d
> [   42.794016]  [<c104e5c0>] ? __tasklet_hrtimer_trampoline+0x50/0x50
> [   42.794016]  [<c104e5c0>] ? __tasklet_hrtimer_trampoline+0x50/0x50
> [   42.794016]  [<c1004729>] ? do_softirq_own_stack+0x29/0x40
> [   42.794016]  <IRQ>
> [   42.794016]  [<c104e9ce>] ? irq_exit+0x6e/0x90
> [   42.794016]  [<c13bb7eb>] ? do_IRQ+0x4b/0xe0
> [   42.794016]  [<c13baf2c>] ? common_interrupt+0x2c/0x34
> [   42.794016]  [<c100c0e9>] ? default_idle+0x19/0xb0
> [   42.794016]  [<c100cd0e>] ? arch_cpu_idle+0xe/0x10
> [   42.794016]  [<c107eb85>] ? cpu_startup_entry+0x215/0x310
> [   42.794016] Code: <8b> 48 18 31 c0 85 c9 74 57 8b 42 04 89 4d d8 89 4d e8
> b9 01 00 00
> [   42.794016] EIP: [<f93f4024>] nf_nat_redirect_ipv4+0x24/0xb0
> [nf_nat_redirect] SS:ESP 0068:f6cfbd60
> [   42.794016] CR2: 0000000000000018
> [   42.794016] ---[ end trace 943b47b10ddb0266 ]---
> [   42.794016] Kernel panic - not syncing: Fatal exception in interrupt
> [   42.794016] Kernel Offset: disabled
> [   42.794016] Rebooting in 5 seconds..
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
