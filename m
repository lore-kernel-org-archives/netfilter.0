From: Martin Bednar <martin@serafean.cz>
Subject: nftables kernel bug
Date: Tue, 29 Nov 2016 23:37:21 +0100
Message-ID: <2097005.VXRZyRJPl3@nemmerle>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1480459357;
        bh=L9T/EWRcyd5M3/xVaAOguoCq+JLyypF+5RGCeMWUnsQ=;
        h=From:To:Subject:Date;
        b=bkin8zQnsPeeIdNrvAtURTWbfGMPk/aufM+jvW4huIjmz6RGLFvwe48SPzW3NkkWp
         sxoMsfXQQjJaR2PXSeD3OOfc5ZaPcX48hqldj5P9K/MQpQe9Sp5Y+k6HUTb/oP43v5
         ijuTzd6h47dw2L3KelnYGJqvrMa9X3e3wf4XQARWY0l3CSWxMCdyoELMnnePtqYbRp
         q6Wg3tZG9Q9+Cde9wXth1uWIcrLKdg479sAS2oArWePNZpWr+fnbpqpHhnhDMcOoln
         vdfvEgdZolg+j//PxBVYXwJEsmMr9RrlvEvMAJz0yy3dLh+buhc0tMcv1mKl8S0o+s
         +Ey7K6E0i7CMA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, I just hit a kernel bug using nftables.
Using kernel 4.8.11.

Inline is a minimal configuration file to reproduce and the dmesg log.
Let me know if you need anything else.

Martin.

Minimal configuration to reproduce: 

table inet filter{
	map iface_rules {type iface_index : verdict;}
	chain lan1{
	}

	chain input{
	type filter hook input priority 0;policy accept;

	iif vmap @iface_rules

	}
}
add element inet filter iface_rules {enp0s18 : jump lan1 } #BUG_ON here.

kernel bug : 

BUG: unable to handle kernel paging request at 000000000000113c
IP: [<ffffffffa0192674>] nf_tables_check_loops+0xe4/0x1b0 [nf_tables]
PGD 11e429067 PUD 11bf40067 PMD 0 
Oops: 0000 [#1] SMP
Modules linked in: nft_meta nft_hash nft_rbtree nf_tables_inet nf_tables_ipv6
nf_tables_ipv4 nf_tables fuse bnep btusb btrtl btbcm btintel bluetooth 
usb_storage usbhid
snd_hda_codec_hdmi dm_crypt snd_hda_codec_analog snd_hda_codec_generic 
serpent_sse2_x86_64
serpent_generic ablk_helper cryptd lrw glue_helper xts algif_skcipher af_alg 
ohci_pci sr_mod radeon
cdrom dm_mod coretemp kvm_intel snd_hda_intel snd_hda_codec kvm snd_hwdep 
ehci_pci ohci_hcd
snd_hda_core ehci_hcd irqbypass snd_pcm usbcore forcedeth snd_timer pata_amd 
nv_tco ttm snd
i2c_nforce2 asus_atk0110 usb_common sch_fq_codel ipv6 crc_ccitt
CPU: 1 PID: 23992 Comm: nft Not tainted 4.8.7-gentoo #3
Hardware name: System manufacturer System Product Name/P5N32-E SLI PLUS, BIOS 
ASUS
P5N32-E SLI PLUS ACPI BIOS Revision 1502 11/17/2009
task: ffff8800b4aab000 task.stack: ffff8801224b8000
RIP: 0010:[<ffffffffa0192674>]  [<ffffffffa0192674>] nf_tables_check_loops
+0xe4/0x1b0
[nf_tables]
RSP: 0018:ffff8801224bb980  EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffff8801224bba40 RCX: ffff88010896f240
RDX: ffff8801224bba40 RSI: ffff88010896f000 RDI: ffff8801224bba58
RBP: ffff8801224bb9c0 R08: 0000000000000010 R09: ffff88008cfe7d60
R10: ffff8801224bba58 R11: ffff88010969bc10 R12: ffff88010969bc00
R13: ffff8801224bba58 R14: ffff88010896f000 R15: ffff88010896f000
FS:  00007f93e9ab1700(0000) GS:ffff88012fc80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000000113c CR3: 0000000122711000 CR4: 00000000000006e0
Stack:
 ffff8801224bb9e0 ffffffffa0193a10 0000000000000000 ffff8801224bba40
 ffff8801224bba58 ffff88010969bc10 ffff8801224bbb58 ffff88008cfe7d60
 ffff8801224bb9e0 ffffffffa0193399 ffff8801224bba40 0000000000000000
Call Trace:
 [<ffffffffa0193a10>] ? nft_data_init+0x120/0x180 [nf_tables]
 [<ffffffffa0193399>] nft_validate_register_store+0x39/0xb0 [nf_tables]
 [<ffffffffa0199bd2>] nft_add_set_elem+0x542/0x5f0 [nf_tables]
 [<ffffffffa0192d0b>] ? nft_table_lookup+0x2b/0x60 [nf_tables]
 [<ffffffff813845b0>] ? nla_strcmp+0x40/0x50
 [<ffffffffa0199d7a>] nf_tables_newsetelem+0xfa/0x210 [nf_tables]
 [<ffffffff8159f20d>] nfnetlink_rcv+0x32d/0x560
 [<ffffffff8159effe>] ? nfnetlink_rcv+0x11e/0x560
 [<ffffffff8159a655>] netlink_unicast+0x165/0x210
 [<ffffffff8159aa06>] netlink_sendmsg+0x306/0x380
 [<ffffffff8154c243>] sock_sendmsg+0x33/0x40
 [<ffffffff8154d0c8>] ___sys_sendmsg+0x278/0x280
 [<ffffffff812f641e>] ? cred_has_capability+0x5e/0xf0
 [<ffffffff8116eb18>] ? page_add_new_anon_rmap+0x88/0xc0
 [<ffffffff812f64fb>] ? selinux_capable+0x1b/0x20
 [<ffffffff812ef733>] ? security_capable+0x43/0x60
 [<ffffffff8154d920>] __sys_sendmsg+0x40/0x70
 [<ffffffff8154d95d>] SyS_sendmsg+0xd/0x20
 [<ffffffff8162ed5b>] entry_SYSCALL_64_fastpath+0x13/0x8f
Code: 49 8b 4d 10 4c 8b 61 20 48 8d 41 20 49 39 c4 75 16 e9 c8 00 00 00 4d 8b 
24 24
48 8d 41 20 49 39 c4 0f 84 b7 00 00 00 49 8b 45 00 <80> b8 3c 11 00 00 00 41 
0f b6 84 24 89 00 00 00
0f 94 c2 c0 e8 
RIP  [<ffffffffa0192674>] nf_tables_check_loops+0xe4/0x1b0 [nf_tables]
 RSP <ffff8801224bb980>
CR2: 000000000000113c
---[ end trace df0accda550108b1 ]---


