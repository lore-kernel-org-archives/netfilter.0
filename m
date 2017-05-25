From: Juergen Schmidt <abcdmail@freenet.de>
Subject: regression: nf_conntrack_sip: kernel BUG at
 ../net/netfilter/nf_conntrack_helper.c:384! since linux 4.8
Date: Thu, 25 May 2017 10:51:24 +0200
Message-ID: <a72bec87-be30-65ce-818b-b3e9d22ab867@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

If you want to use more than one port (like
modprobe nf_conntrack_sip 777,778), you get the following BUG (linux 4.9.x):


May 25 07:17:46 dualc kernel: kernel BUG at ../net/netfilter/nf_conntrack_helper.c:384!
May 25 07:17:46 dualc kernel: invalid opcode: 0000 [#1] PREEMPT SMP
May 25 07:17:46 dualc kernel: Modules linked in: nf_conntrack_sip(+) vhost_net tun vhost macvtap macvlan nf_log_ipv4 nf_log_common xt_LOG ipt_REJECT nf_reject_ipv4 xt_tcpudp nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack iptable_filter ip_tables x_tables vfio
_pci vfio_iommu_type1 vfio_virqfd vfio br_netfilter bridge stp llc iscsi_ibft iscsi_boot_sysfs it87 hwmon_vid snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi mxm_wmi snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm edac_mce_amd snd_seq edac_core 
snd_seq_device snd_timer kvm_amd sp5100_tco kvm r8169 fam15h_power pcspkr k10temp i2c_piix4 irqbypass mii tpm_infineon snd fjes soundcore wmi button shpchp acpi_cpufreq tpm_tis tpm_tis_core tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc xfs libcrc32c dm_crypt uas usb_storage hid_generic
May 25 07:17:46 dualc kernel:  usbhid raid1 md_mod ohci_pci crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel serio_raw sr_mod cdrom amdkfd amd_iommu_v2 firewire_ohci radeon firewire_core crc_itu_t ohci_hcd ehci_pci i2c_algo_bit ehci_hcd drm_kms_helper sysco
pyarea sysfillrect xhci_pci sysimgblt fb_sys_fops xhci_hcd ttm usbcore drm aesni_intel aes_x86_64 glue_helper lrw ablk_helper cryptd ata_generic pata_atiixp dm_mirror dm_region_hash dm_log sg thermal dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc scsi_dh_alua
May 25 07:17:46 dualc kernel: CPU: 4 PID: 4064 Comm: modprobe Not tainted 4.9.29-1-default #1
May 25 07:17:46 dualc kernel: Hardware name: Gigabyte Technology Co., Ltd. GA-990XA-UD3/GA-990XA-UD3, BIOS F14b 01/24/2013
May 25 07:17:46 dualc kernel: task: ffff90d3af6fe040 task.stack: ffffaa814af40000
May 25 07:17:46 dualc kernel: RIP: 0010:[<ffffffffc0d47b8e>]  [<ffffffffc0d47b8e>] nf_conntrack_helper_register+0xee/0x100 [nf_conntrack]
May 25 07:17:46 dualc kernel: RSP: 0018:ffffaa814af43bf0  EFLAGS: 00010246
May 25 07:17:46 dualc kernel: RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff90d54ee93888
May 25 07:17:46 dualc kernel: RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffffc0dc2150
May 25 07:17:46 dualc kernel: RBP: ffffaa814af43c18 R08: 0000000000000020 R09: 00000000c0dc0000
May 25 07:17:46 dualc kernel: R10: 0000000000ffff0a R11: 0000000000000003 R12: 0000000000000000
May 25 07:17:46 dualc kernel: R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000200
May 25 07:17:46 dualc kernel: FS:  00007facd0838700(0000) GS:ffff90d56ed00000(0000) knlGS:0000000000000000
May 25 07:17:46 dualc kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
May 25 07:17:46 dualc kernel: CR2: 00007f4d1800a988 CR3: 00000006103ee000 CR4: 00000000000406e0
May 25 07:17:46 dualc kernel: Stack:
May 25 07:17:46 dualc kernel:  0000000000000001 ffffffffc0dc2150 ffffffffc0dc20c0 0000000000000008
May 25 07:17:46 dualc kernel:  ffff90d386a03a80 ffffaa814af43c50 ffffffffc0d4822c 0000000000000001
May 25 07:17:46 dualc kernel:  0000000000000002 ffffffffc0dc2540 ffffffffc0dc21e0 0000000000000000
May 25 07:17:46 dualc kernel: Call Trace:
May 25 07:17:46 dualc kernel:  [<ffffffffc0d4822c>] nf_conntrack_helpers_register+0x3c/0x80 [nf_conntrack]
May 25 07:17:46 dualc kernel:  [<ffffffffc034318d>] nf_conntrack_sip_init+0x18d/0x1000 [nf_conntrack_sip]
May 25 07:17:46 dualc kernel:  [<ffffffffc0343000>] ? 0xffffffffc0343000
May 25 07:17:46 dualc kernel:  [<ffffffffb6002190>] do_one_initcall+0x50/0x190
May 25 07:17:46 dualc kernel:  [<ffffffffb61ed191>] ? __vunmap+0x81/0xd0
May 25 07:17:46 dualc kernel:  [<ffffffffb61a2cdc>] ? do_init_module+0x27/0x20a
May 25 07:17:46 dualc kernel:  [<ffffffffb61a2d15>] do_init_module+0x60/0x20a
May 25 07:17:46 dualc kernel:  [<ffffffffb61131af>] load_module+0x203f/0x28d0
May 25 07:17:46 dualc kernel:  [<ffffffffb610ff20>] ? __symbol_put+0x50/0x50
May 25 07:17:46 dualc kernel:  [<ffffffffb6113c29>] SYSC_finit_module+0x99/0xd0
May 25 07:17:46 dualc kernel:  [<ffffffffb6113c7e>] SyS_finit_module+0xe/0x10
May 25 07:17:46 dualc kernel:  [<ffffffffb6003ad1>] do_syscall_64+0x61/0x190
May 25 07:17:46 dualc kernel:  [<ffffffffb6727caf>] entry_SYSCALL64_slow_path+0x25/0x25
May 25 07:17:46 dualc kernel: Code: db eb 0f 0f b6 73 5e 40 38 70 5e 75 d0 bb ef ff ff ff 48 c7 c7 c0 43 d5 c0 e8 ef ce 9d f5 89 d8 5b 41 5c 41 5d 41 5e 41 5f 5d c3 <0f> 0b 0f 0b 0f 0b 66 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 
May 25 07:17:46 dualc kernel: RIP  [<ffffffffc0d47b8e>] nf_conntrack_helper_register+0xee/0x100 [nf_conntrack]
May 25 07:17:46 dualc kernel:  RSP <ffffaa814af43bf0>
May 25 07:17:46 dualc kernel: ---[ end trace 02b02dd336a52aa8 ]---



Would be great if it would be fixed!



Regards,
Juergen
