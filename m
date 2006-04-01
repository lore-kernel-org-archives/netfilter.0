From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: kernel panic
Date: Sat, 01 Apr 2006 08:21:33 +0200
Message-ID: <442E1BED.40107@arcoscom.com>
References: <442CB08F.9000406@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442CB08F.9000406@arcoscom.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

Any idea at least?

Samuel D=EDaz Garc=EDa escribi=F3:
> Iptables 1.3.5
> kernel 2.6.15.6
>=20
> Any help?
>=20
> Mar 30 00:31:01 fraile kernel: [17181150.312000] ip_nat_pptp version 3.0 =

> unloaded
> Mar 30 00:31:01 fraile kernel: [17181150.492000] ctnetlink:=20
> unregistering from nfnetlink.
> Mar 30 00:31:01 fraile kernel: [17181150.524000] ip_conntrack_pptp=20
> version 3.1 unloaded
> Mar 30 00:31:01 fraile kernel: [17181150.688000] ctnetlink v0.90:=20
> registering with nfnetlink.
> Mar 30 00:31:01 fraile kernel: [17181150.688000] Unable to handle kernel =

> paging request at virtual address e0c76e54
> Mar 30 00:31:01 fraile kernel: [17181150.688000]  printing eip:
> Mar 30 00:31:01 fraile kernel: [17181150.688000] c012a309
> Mar 30 00:31:01 fraile kernel: [17181150.688000] *pde =3D 1c9ac067
> Mar 30 00:31:01 fraile kernel: [17181150.688000] Oops: 0000 [#1]
> Mar 30 00:31:01 fraile kernel: [17181150.688000] Modules linked in:=20
> ip_conntrack_netlink ip_conntrack_netbios_ns ip_conntrack_irc=20
> ip_conntrack_h323 ip_conntrack_ftp ip_conntrack_amanda ipt_ipp2p=20
> parport_pc lp parport ipt_mac ipt_connlimit iptable_filter=20
> ipt_MASQUERADE iptable_nat ip_nat ipt_layer7 ipt_state ipt_MARK ipt_mark =

> ipt_CONNMARK ip_conntrack nfnetlink ipt_comment iptable_mangle ip_tables =

> police autofs4 it87 hwmon_vid hwmon eeprom i2c_isa bluetooth sunrpc=20
> dm_mod video thermal processor fan container button battery ac ohci_hcd=20
> shpchp i2c_sis630 i2c_sis96x i2c_core snd_intel8x0 snd_ac97_codec=20
> snd_ac97_bus snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq=20
> snd_seq_device snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd soundcore =

> snd_page_alloc sis900 8139too 3c59x mii floppy ext3 jbd aacraid sd_mod=20
> scsi_mod
> Mar 30 00:31:01 fraile kernel: [17181150.688000] CPU:    0
> Mar 30 00:31:01 fraile kernel: [17181150.688000] EIP:=20
> 0060:[<c012a309>]    Tainted: GF     VLI
> Mar 30 00:31:01 fraile kernel: [17181150.688000] EFLAGS: 00010282=20
> (2.6.15.6-ArcosCom)
> Mar 30 00:31:01 fraile kernel: [17181150.688000] EIP is at=20
> notifier_chain_register+0x19/0x50
> Mar 30 00:31:01 fraile kernel: [17181150.688000] eax: e0c76e4c   ebx:=20
> e0c114c0   ecx: ffffffff   edx: 00000000
> Mar 30 00:31:01 fraile kernel: [17181150.688000] esi: e0c40e4c   edi:=20
> 0805e218   ebp: d174e000   esp: d174ff8c
> Mar 30 00:31:02 fraile kernel: [17181150.688000] ds: 007b   es: 007b ss: =

> 0068
> Mar 30 00:31:02 fraile kernel: [17181150.688000] Process modprobe (pid:=20
> 4432, threadinfo=3Dd174e000 task=3Dd363f570)
> Mar 30 00:31:02 fraile kernel: [17181150.688000] Stack: 00000000=20
> 0805e1f8 e0c2a05c e0c3f4c4 e0c2a0db e0c40f00 c0138a87 b7e9c008
> Mar 30 00:31:02 fraile kernel: [17181150.688000]        0805e1f8=20
> b7e9c008 0805e1f8 c0103055 b7e9c008 00034380 0805e1f8 0805e1f8
> Mar 30 00:31:02 fraile kernel: [17181150.688000]        0805e218=20
> bfd130b8 ffffffda 0000007b 0000007b 00000080 ffffe410 00000073
> Mar 30 00:31:02 fraile kernel: [17181150.688000] Call Trace:
> Mar 30 00:31:02 fraile kernel: [17181150.688000]  [<e0c2a05c>]=20
> ctnetlink_init+0x5c/0xdb [ip_conntrack_netlink]
> Mar 30 00:31:02 fraile kernel: [17181150.688000]  [<c0138a87>]=20
> sys_init_module+0xc7/0x1d0
> Mar 30 00:31:02 fraile kernel: [17181150.688000]  [<c0103055>]=20
> syscall_call+0x7/0xb
> Mar 30 00:31:03 fraile kernel: [17181150.688000] Code: 00 e8 5c 54 24 00 =

> b8 fe fd ff ff c3 90 90 90 90 90 90 56 89 d6 53 89 c3 b8 18 3c 3d c0 e8=20
> 70 6b 24 00 8b 03 85 c0 74 1a 8b 56 08 <3b> 50 08 7f 12 89 f6 8d 58 04=20
> 8b 40 04 85 c0 74 06 39 50 08 7d
> Mar 30 00:31:03 fraile kernel: [17181150.688000]  ip_conntrack_pptp=20
> version 3.1 loaded
> Mar 30 00:31:03 fraile kernel: [17181150.840000] ip_nat_pptp version 3.0 =

> loaded
> Mar 30 00:31:30 fraile kernel: [17181179.176000] ip_nat_pptp version 3.0 =

> unloaded
> Mar 30 00:31:30 fraile kernel: [17181179.388000] ip_conntrack_pptp=20
> version 3.1 unloaded
> Mar 30 00:31:30 fraile kernel: [17181179.556000] ip_conntrack_pptp=20
> version 3.1 loaded
>=20
>=20

--=20
    Samuel D=EDaz Garc=EDa

