From: Marc V <therebel22@gmail.com>
Subject: Kernel oops with netfilter sip helper
Date: Wed, 27 Jun 2012 13:30:44 +0200
Message-ID: <CAMs117XcnA=0TMdrAxsEgJo30Q=0qf5yS+Bbf8OLFdBwBXvJKw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=2Ta7D26IG5XpVfLI25eikbevvBLV85R8/LPMPiqdUrA=;
        b=chsH6GxK0oK9xOOMu7oyGHM3KzzQ/I3sPGHMZLjoVOaVDVrMcfMcE9xDVvyYm0R7Q5
         xX5GYUMco0qybkZmZv0oOLuE30EUUQCFiKP//Fcc57rKutqTu4MwoQtIM8XL1+WXlTRt
         1ySH5DvhaL6HKFQTmvM7B0CGqOZdM0L2cwrAEmeZd8DzPDAdHFc2mNhYS52ACsC3swUW
         6dgq+o1bzx8oCOukC1TkJj2qpVG2N1p/U4d3+uN2+fhfZf3jly37ZOUK/HDJJpT3Kqii
         AzAJ9pz7bNak2clkDZd94xNoygYRNLVaatOBaYhXwwTo5R4nPnRFc6ZHFSBNus0LW4BY
         4nkg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
sorry for asking you about an old version of kernel and netfilter, but
now i'm not able to upgrade our server :

We have a debian lenny with asterisk 1.4 serving about 30 simultaneous
calls and 100 peers.

Linux pbx1 2.6.26-2-686 #1 SMP Sun Mar 4 22:19:19 UTC 2012 i686 GNU/Linux
iptables v1.4.2
asterisk 1.4.43

Modules loaded :

nf_conntrack
nf_conntrack_sip,xt_state,nf_conntrack_ipv6,xt_conntrack,nf_conntrack_h323,nf_conntrack_amanda,nf_conntrack_pptp,nf_conntrack_netlink,nf_nat,nf_conntrack_ipv4,nf_conntrack_netbios_ns,nf_conntrack_proto_gre,nf_conntrack_proto_udplite,nf_conntrack_proto_sctp,nf_conntrack_ftp,nf_conntrack_proto_dccp,nf_conntrack_tftp,nf_conntrack_sane,nf_conntrack_irc

It was very stable but last saturday with low traffic, we had our
first kernel oops since two years (see below)

I'd like ask to experts : do you recognize this kernel oops ?
(sip_help, ipv4_confirm ..) What could be the cause ? (i repeat :
there was very low traffic)

My debian box has an public ip. Can i unload safely nf_conntrack_sip
module without any problem in order to avoid this oops in the future ?

Thanks a lot for you replies.. !!

Here the oops :

Jun 16 12:49:25 pbx kernel: [6659154.690478] BUG: unable to handle
kernel NULL pointer dereference at 00000000
Jun 16 12:49:25 pbx kernel: [6659154.690478] IP: [<00000000>]
Jun 16 12:49:25 pbx kernel: [6659154.690478] *pde = 00000000
Jun 16 12:49:25 pbx kernel: [6659154.690478] Oops: 0000 [#1] SMP
Jun 16 12:49:25 pbx kernel: [6659154.690478] Modules linked in:
ipt_LOG xt_DSCP iptable_mangle nf_conntrack_ipv6 xt_tcpudp
xt_multiport xt_state ip6table_filter ip6_tables iptable_filter
ip_tables ipv6 nf_conntrack_sip xt_conntrack x_tables
nf_conntrack_h323 ts_kmp nf_conntrack_amanda nf_conntrack_pptp
nf_conntrack_netlink nfnetlink nf_nat nf_conntrack_ipv4
nf_conntrack_netbios_ns nf_conntrack_proto_gre
nf_conntrack_proto_udplite nf_conntrack_proto_sctp nf_conntrack_ftp
nf_conntrack_proto_dccp nf_conntrack_tftp nf_conntrack_sane
nf_conntrack_irc nf_conntrack crc_ccitt loop serio_raw evdev snd_pcm
psmouse snd_timer snd soundcore snd_page_alloc button pcspkr dcdbas
ext3 jbd mbcache sg sr_mod cdrom ide_pci_generic ide_core ata_piix ses
enclosure sd_mod ata_generic ehci_hcd libata uhci_hcd megaraid_sas
dock usbcore scsi_mod bnx2 firmware_class thermal processor fan
thermal_sys [last unloaded: nf_conntrack_ipv6]
Jun 16 12:49:25 pbx kernel: [6659154.690478]
Jun 16 12:49:25 pbx kernel: [6659154.690478] Pid: 19655, comm:
asterisk Not tainted (2.6.26-2-686 #1)
Jun 16 12:49:25 pbx kernel: [6659154.690478] EIP: 0060:[<00000000>]
EFLAGS: 00010246 CPU: 0
Jun 16 12:49:25 pbx kernel: [6659154.690478] EIP is at 0x0
Jun 16 12:49:25 pbx kernel: [6659154.690478] EAX: d505c080 EBX:
f8bd38e0 ECX: f7d89c5c EDX: f7d89c58
Jun 16 12:49:25 pbx kernel: [6659154.690478] ESI: 0000016b EDI:
d505c080 EBP: 00001902 ESP: f7d89c3c
Jun 16 12:49:25 pbx kernel: [6659154.690478]  DS: 007b ES: 007b FS:
00d8 GS: 0033 SS: 0068
Jun 16 12:49:25 pbx kernel: [6659154.690478] Process asterisk (pid:
19655, ti=f7d88000 task=f79a48c0 task.ti=f7d88000)
Jun 16 12:49:25 pbx kernel: [6659154.690478] Stack: f8bd24d3 00001902
000000c8 f7cd87fc 000000c8 00000004 00000166 f7e9102c
Jun 16 12:49:25 pbx kernel: [6659154.690478]        0000027c f8bd5720
d505c080 f7cd87fc 00000003 f89f133e 00000003 f89f3cf0
Jun 16 12:49:25 pbx kernel: [6659154.690478]        f7d89cc0 00000004
d505c080 c026e9b0 f7b20000 c0276c22 c0375ac0 00000004
Jun 16 12:49:25 pbx kernel: [6659154.690478] Call Trace:
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<f8bd24d3>]
sip_help+0x206/0x247 [nf_conntrack_sip]
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<f89f133e>]
ipv4_confirm+0x58/0xb4 [nf_conntrack_ipv4]
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c026e9b0>] nf_iterate+0x30/0x61
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0276c22>]
ip_finish_output+0x0/0x1fc
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c026ea3f>]
nf_hook_slow+0x3a/0x90
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0276c22>]
ip_finish_output+0x0/0x1fc
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c027709e>] ip_output+0x6c/0x7e
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0276c22>]
ip_finish_output+0x0/0x1fc
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c027696e>]
ip_local_out+0x15/0x17
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0276bc8>]
ip_push_pending_frames+0x258/0x2b2
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c028e272>]
udp_push_pending_frames+0x2b0/0x315
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c028f252>]
udp_sendmsg+0x43a/0x51b
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c028e272>]
udp_push_pending_frames+0x2b0/0x315
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c028f252>]
udp_sendmsg+0x43a/0x51b
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c02940b4>]
inet_sendmsg+0x35/0x3f
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c024f863>]
sock_sendmsg+0xc7/0xe1
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0131ab0>]
autoremove_wake_function+0x0/0x2d
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0182bfa>] dput+0x15/0xbb
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c017cb6d>]
__link_path_walk+0xb0b/0xb26
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0119cd9>]
__dequeue_entity+0x1f/0x71
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0102973>]
__switch_to+0xa5/0x125
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0187010>]
mntput_no_expire+0x13/0xd9
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0250147>]
sys_sendto+0x105/0x130
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c017ce6e>]
do_path_lookup+0x122/0x184
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c01771f1>]
cp_new_stat64+0xfc/0x10e
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0250a3c>]
sys_socketcall+0x106/0x19e
Jun 16 12:49:25 pbx kernel: [6659154.690478]  [<c0103857>]
sysenter_past_esp+0x78/0xb1
Jun 16 12:49:25 pbx kernel: [6659154.690478]  =======================
Jun 16 12:49:25 pbx kernel: [6659154.690478] Code:  Bad EIP value.
Jun 16 12:49:25 pbx kernel: [6659154.690478] EIP: [<00000000>] 0x0
SS:ESP 0068:f7d89c3c
Jun 16 12:49:25 pbx kernel: [6659154.691249] ---[ end trace
aadebb1841a14c44 ]---
Jun 16 17:23:02 pbx kernel: [6675785.324578] php invoked oom-killer:
gfp_mask=0x84d0, order=0, oomkilladj=0
Jun 16 17:23:02 pbx kernel: [6675785.324614] Pid: 2193, comm: php
Tainted: G      D   2.6.26-2-686 #1
Jun 16 17:23:02 pbx kernel: [6675785.324653]  [<c0159252>]
oom_kill_process+0x4f/0x195
Jun 16 17:23:02 pbx kernel: [6675785.324694]  [<c015967c>]
out_of_memory+0x14e/0x17f
Jun 16 17:23:02 pbx kernel: [6675785.324730]  [<c015b5e4>]
__alloc_pages_internal+0x2b8/0x34e
Jun 16 17:23:02 pbx kernel: [6675785.324768]  [<c015b686>] __alloc_pages+0x7/0x9
Jun 16 17:23:02 pbx kernel: [6675785.324798]  [<c01173c9>]
pte_alloc_one+0x12/0x2d
Jun 16 17:23:02 pbx kernel: [6675785.324830]  [<c016337e>] __pte_alloc+0x11/0x82
Jun 16 17:23:02 pbx kernel: [6675785.324864]  [<c01638a7>]
copy_page_range+0x102/0x3d4
Jun 16 17:23:02 pbx kernel: [6675785.324899]  [<c011731d>] pgd_alloc+0xb5/0xd6
Jun 16 17:23:02 pbx kernel: [6675785.324933]  [<c0120a34>] dup_mm+0x226/0x2f8
Jun 16 17:23:02 pbx kernel: [6675785.324969]  [<c01213e3>]
copy_process+0x8ba/0xf73
Jun 16 17:23:02 pbx kernel: [6675785.325004]  [<c0121bb5>] do_fork+0xab/0x1dc
Jun 16 17:23:02 pbx kernel: [6675785.325036]  [<c0179dea>] do_pipe+0x7e/0xbd
Jun 16 17:23:02 pbx kernel: [6675785.325070]  [<c0102199>] sys_clone+0x22/0x26
Jun 16 17:23:02 pbx kernel: [6675785.325101]  [<c0103857>]
sysenter_past_esp+0x78/0xb1
Jun 16 17:23:02 pbx kernel: [6675785.325136]  [<c02b0000>]
quirk_nopciamd+0x10/0x4a
Jun 16 17:23:02 pbx kernel: [6675785.325170]  =======================
Jun 16 17:23:02 pbx kernel: [6675785.325195] Mem-info:
Jun 16 17:23:02 pbx kernel: [6675785.325216] DMA per-cpu:
Jun 16 17:23:02 pbx kernel: [6675785.325239] CPU    0: hi:    0, btch:
  1 usd:   0
Jun 16 17:23:02 pbx kernel: [6675785.325266] CPU    1: hi:    0, btch:
  1 usd:   0
Jun 16 17:23:02 pbx kernel: [6675785.325293] CPU    2: hi:    0, btch:
  1 usd:   0
Jun 16 17:23:02 pbx kernel: [6675785.325321] CPU    3: hi:    0, btch:
  1 usd:   0
