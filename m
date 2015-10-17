From: Miroslav Kratochvil <exa.exa@gmail.com>
Subject: Lots of WARNINGs in sch_hfsc with attached codel or fq_codel
Date: Sat, 17 Oct 2015 12:30:28 +0200
Message-ID: <CAO0uZ+_tB_5n8nrDhnPcN-b2miucAM4VXrg8mL9fc-zKr6Cb-Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=5MXR0gcPnYGwa9Bf57+ANDXOqKOQBuiv0tVzTtTrwfc=;
        b=PiEDkgUgKfbczc1KNV8IiAnQaHvzTzwN3lGiCGCHE5nUJIfZQqmO/xMHHX2Y+CAN83
         YP694lzRhMZoRZBOHD/sXdAYEE620weOQHWTFDyKdecG450GCA3NNzb/SE4l2vsFCvv1
         hVoTuXuI8zQ6xQkC7XNdM9nlj7dt65kfY2FZZydIPGuAcrrSiD5fz2MG6amH0gtJQTb/
         OOlnYzRy0Q6HK1FHsg5x09tMluYSW9qdfM3F+/672REIoHP6scaa1eQbHV718mvzjAV+
         uIM5eJOa44EwyVAohyMY0wqMKxdSe0sre9sw+IrgLoLVzEFSfZJJfi4kTjEjqF8Z0tqi
         ECyA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

I'm using a hfsc qdisc to do some bandwidth-intensive QoS. After some
upgrading (3.16 -> 4.2) I have probably hit an issue similar to the
one reported in debian bugs here:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=631945

In short, when codel or fq_codel qdiscs are attached to HFSC leaf
classes, the kernel sometimes generates bursts of WARNINGs like the
one attached below. The burst repeats several times in a hour and
lasts just several seconds (20 at most), but can trigger several
thousand warnings per second, which usually makes the userspace
slow/unresponsive. Kernel stuff (including actual traffic shaping)
works without noticeable trouble.

The debian issue (that was reported for the same error, only with SFQ
attached instead of codel) has been solved by fixing a statistic
counting, citing:

> Oh well, it seems one qdisc_tree_decrease_qlen(sch, 1) is missing

Because the issue got fixed for me if I used sfq instead of
(fq_)codel, I assumed that similar patch would be needed for codels.
For my investigation so far, I tried to remove the check that
postpones the qlen update until next cycle (it seemed like a
HTB-specific hack, removal patch attached below), but that didn't fix
the problem.

Also, the issue doesn't seem to happen with older kernels (Notably the
default one from debian jessie,  3.16.0-4-amd64 #1 SMP Debian
3.16.7-ckt7-1. Current machine uses 4.2.0-1-amd64 #1 SMP Debian
4.2.1-2), so it would be also possible that some of recent (~2014)
HFSC changes broke it, but they do not seem dangerous in any way to
me.

Do you have some idea what could cause the warnings, or a pointer
where to continue the search for the cause?

Thanks in advance,
-mk


Attached, the warning:


[762997.348743] WARNING: CPU: 1 PID: 191 at
/build/linux-hTOZhE/linux-4.2.1/net/sched/sch_hfsc.c:1429
hfsc_dequeue+0x2f6/0x310 [sch_hfsc]()
[762997.348744] Modules linked in: sch_fq_codel sch_sfq binfmt_misc
act_mirred act_gact sch_ingress sch_codel cls_u32 sch_hfsc nfsd
auth_rpcgss oid_registry nfs_acl nfs lockd grace fscache sunrpc
x86_pkg_temp_thermal intel_powerclamp intel_rapl iosf_mbi processor
thermal_sys coretemp kvm_intel iTCO_wdt kvm crct10dif_pclmul
iTCO_vendor_support crc32_pclmul ghash_clmulni_intel ast ttm
drm_kms_helper drm sg evdev joydev serio_raw lpc_ich mfd_core
sha256_ssse3 sha256_generic ie31200_edac edac_core hmac i2c_i801
shpchp pcspkr drbg ansi_cprng aesni_intel aes_x86_64 lrw gf128mul
glue_helper ablk_helper cryptd ifb autofs4 xfs libcrc32c hid_generic
usbhid hid sd_mod ixgbe igb i2c_algo_bit dca vxlan ip6_udp_tunnel
udp_tunnel mdio ahci libahci libata crc32c_intel scsi_mod xhci_pci
ehci_pci xhci_hcd ehci_hcd e1000e
[762997.348763]  ptp pps_core usbcore usb_common
[762997.348764] CPU: 1 PID: 191 Comm: systemd-journal Tainted: G
 W       4.2.0-1-amd64 #1 Debian 4.2.1-2
[762997.348765] Hardware name: Supermicro X10SLL-F/X10SLL-F, BIOS 2.0 04/24/2014
[762997.348766]  0000000000000000 ffffffffa0600060 ffffffff81548756
0000000000000000
[762997.348767]  ffffffff8106e571 ffff88040a15e600 00000ada74e993a3
ffff88040cb7b800
[762997.348768]  ffff88040cb7bc90 ffff8803cd9ad700 ffffffffa05fe546
ffff88040a15e600
[762997.348769] Call Trace:
[762997.348770]  <IRQ>  [<ffffffff81548756>] ? dump_stack+0x40/0x50
[762997.348772]  [<ffffffff8106e571>] ? warn_slowpath_common+0x81/0xb0
[762997.348774]  [<ffffffffa05fe546>] ? hfsc_dequeue+0x2f6/0x310 [sch_hfsc]
[762997.348775]  [<ffffffff8147ce1f>] ? __qdisc_run+0x3f/0x1b0
[762997.348776]  [<ffffffff8145c3cf>] ? __dev_queue_xmit+0x2bf/0x540
[762997.348778]  [<ffffffffa06c1580>] ? tcf_mirred+0x120/0x188 [act_mirred]
[762997.348779]  [<ffffffff814823a5>] ? tcf_action_exec+0x45/0x80
[762997.348780]  [<ffffffffa06ac9fc>] ? u32_classify+0x20c/0x430 [cls_u32]
[762997.348781]  [<ffffffff8147cc5d>] ? sch_direct_xmit+0x5d/0x1e0
[762997.348783]  [<ffffffff8147df14>] ? tc_classify_compat+0x54/0x80
[762997.348784]  [<ffffffff8147e9db>] ? tc_classify+0x2b/0x80
[762997.348785]  [<ffffffff81459d9b>] ? __netif_receive_skb_core+0x4fb/0x9a0
[762997.348786]  [<ffffffff8101c2e5>] ? read_tsc+0x5/0x10
[762997.348788]  [<ffffffff8145a2bf>] ? netif_receive_skb_internal+0x1f/0x80
[762997.348789]  [<ffffffff8145ae08>] ? napi_gro_receive+0x98/0xc0
[762997.348791]  [<ffffffffa0278f1d>] ? ixgbe_clean_rx_irq+0x54d/0xa90 [ixgbe]
[762997.348793]  [<ffffffffa027a114>] ? ixgbe_poll+0x424/0x790 [ixgbe]
[762997.348795]  [<ffffffff8145a0e1>] ? __netif_receive_skb_core+0x841/0x9a0
[762997.348796]  [<ffffffff8145a76a>] ? net_rx_action+0x20a/0x320
[762997.348797]  [<ffffffff8107254e>] ? __do_softirq+0xfe/0x250
[762997.348798]  [<ffffffff81072812>] ? irq_exit+0x92/0xa0
[762997.348799]  [<ffffffff81550a3f>] ? do_IRQ+0x4f/0xd0
[762997.348801]  [<ffffffff8154e9eb>] ? common_interrupt+0x6b/0x6b
[762997.348801]  <EOI>
[762997.348802] ---[ end trace c1d672c9597e7d60 ]---
[762997.349389] systemd-journald[191]: /dev/kmsg buffer overrun, some
messages lost.

[ ... ]

The patch that tried to disable the htb-specific check:

--- a/net/sched/sch_codel.c
+++ b/net/sched/sch_codel.c
@@ -79,10 +79,7 @@ static struct sk_buff *codel_qdisc_dequeue(struct Qdisc *sch)

     skb = codel_dequeue(sch, &q->params, &q->vars, &q->stats, dequeue);

-    /* We cant call qdisc_tree_decrease_qlen() if our qlen is 0,
-     * or HTB crashes. Defer it for next round.
-     */
-    if (q->stats.drop_count && sch->q.qlen) {
+    if (q->stats.drop_count) {
         qdisc_tree_decrease_qlen(sch, q->stats.drop_count);
         q->stats.drop_count = 0;
     }
diff --git a/net/sched/sch_fq_codel.c b/net/sched/sch_fq_codel.c
index 4c834e9..3619598 100644
--- a/net/sched/sch_fq_codel.c
+++ b/net/sched/sch_fq_codel.c
@@ -276,10 +276,7 @@ begin:
     }
     qdisc_bstats_update(sch, skb);
     flow->deficit -= qdisc_pkt_len(skb);
-    /* We cant call qdisc_tree_decrease_qlen() if our qlen is 0,
-     * or HTB crashes. Defer it for next round.
-     */
-    if (q->cstats.drop_count && sch->q.qlen) {
+    if (q->cstats.drop_count) {
         qdisc_tree_decrease_qlen(sch, q->cstats.drop_count);
         q->cstats.drop_count = 0;
     }
-- 

The hardware, just to be sure:
00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v3 Processor DRAM
Controller (rev 06)
00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset
Family USB xHCI (rev 05)
00:19.0 Ethernet controller: Intel Corporation Ethernet Connection
I217-LM (rev 05)
00:1a.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #2 (rev 05)
00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #1 (rev d5)
00:1c.1 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #2 (rev d5)
00:1c.4 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #5 (rev d5)
00:1d.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset
Family USB EHCI #1 (rev 05)
00:1f.0 ISA bridge: Intel Corporation C222 Series Chipset Family
Server Essential SKU LPC Controller (rev 05)
00:1f.2 SATA controller: Intel Corporation 8 Series/C220 Series
Chipset Family 6-port SATA Controller 1 [AHCI mode] (rev 05)
00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family
SMBus Controller (rev 05)
00:1f.6 Signal processing controller: Intel Corporation 8 Series
Chipset Family Thermal Management Controller (rev 05)
01:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 PCI-to-PCI Bridge (rev 03)
02:00.0 VGA compatible controller: ASPEED Technology, Inc. ASPEED
Graphics Family (rev 30)
03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network
Connection (rev 03)
04:00.0 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
SFI/SFP+ Network Connection (rev 01)
04:00.1 Ethernet controller: Intel Corporation 82599ES 10-Gigabit
SFI/SFP+ Network Connection (rev 01)
