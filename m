From: Ye Liu <yeliu@carmelvision.com>
Subject: Re: Invalid arguments when using '-j TEE'
Date: Wed, 11 Jan 2012 17:03:29 -0500
Message-ID: <CAO=pG1CPwb5VcTeMzxqtEv+K=XpC7oyV2MNdM1yO0V2qMouoAg@mail.gmail.com>
References: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
 <alpine.LNX.2.01.1201111924450.23643@frira.zrqbmnf.qr> <CAO=pG1DZEaKoWUi+zSxFtLgNuowY1Up5m98JMNoFwn9hcePwdw@mail.gmail.com>
 <4F0DEEAA.5020603@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=/FsBsseGViF92Uaiif/CZhKOqarOPP4T0/4TBXc3kEI=;
        b=C4mFTpybLWZv7lll3KCmDVASMt3uPU+gxhqEWFxKG5HpLPv4L5v0wcHAq0q+C6xE47
         bpIUR/dCvbjdofVKWjPgvz0A2n/mVFTvMD11fNS9SJSN+1u4mMal18NyjEHdc67JKCAs
         Hu4FW8NAv500nevbdi2SGTIuLDKNc8t4wjXPQ=
In-Reply-To: <4F0DEEAA.5020603@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "mart.frauenlob@chello.at" <mart.frauenlob@chello.at>, Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dov Berliner <dov@carmelvision.com>

On Wed, Jan 11, 2012 at 3:18 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 11.01.2012 19:30, Ye Liu wrote:
>> Jan, I replaced the real ip with X's, sorry for the confusion.
>>
>> On Wed, Jan 11, 2012 at 1:25 PM, Jan Engelhardt<jengelh@medozas.de> =
=C2=A0wrote:
>>> On Wednesday 2012-01-11 19:20, Ye Liu wrote:
>>>
>>>> Hi there,
>>>>
>>>> I need to setup iptables rules to tee the traffic, so I've tried t=
o
>>>> add the following rule:
>>>> $> =C2=A0iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xxx=
=2Exxx.xxx
>>>> But the command gives an error, says
>>>> $> =C2=A0iptables: Invalid argument. Run `dmesg' for more informat=
ion.
>>>
>>> xxx.xxx.xxx.xxx is of course not a valid IP address.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
> Forget Jan, he once again proved he's the biggest asshole on the list=
=2E

LOL

I did more researches, and one thread in this list suggested I should
use iptables < 1.4.8 for kernel < 2.6.35, so I tried iptables 1.4.7,
but got the same result. Here is command-line output:

$ uname -a
Linux NanoPBX 2.6.19.2 #85 PREEMPT Wed Nov 16 12:20:42 EST 2011 armv6l =
GNU/Linux

$ iptables -V
iptables v1.4.7

$ iptables -t mangle -A PREROUTING -j TEE --gateway 192.9.200.29 -v
TEE  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0   TEE gw:192.9.200.=
29
iptables: Invalid argument. Run `dmesg' for more information.

$ iptables -t mangle -A PREROUTING -j TEE --gateway 192.9.200.29 -vv
TEE  all opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0   TEE gw:192.9.200.=
29
libiptc vlibxtables.so.4. 936 bytes.
Table `mangle'
Hooks: pre/in/fwd/out/post =3D 0/98/130/1c8/260
Underflows: pre/in/fwd/out/post =3D 0/98/130/1c8/260
Entry 0 (0):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 3712 packets, 917058 bytes
Cache: 00000000
Target name: `' [40]
verdict=3DNF_ACCEPT

Entry 1 (152):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 3712 packets, 917058 bytes
Cache: 00000000
Target name: `' [40]
verdict=3DNF_ACCEPT

Entry 2 (304):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `' [40]
verdict=3DNF_ACCEPT

Entry 3 (456):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 649 packets, 72228 bytes
Cache: 00000000
Target name: `' [40]
verdict=3DNF_ACCEPT

Entry 4 (608):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 649 packets, 72228 bytes
Cache: 00000000
Target name: `' [40]
verdict=3DNF_ACCEPT

Entry 5 (760):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
=46lags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `ERROR' [64]
error=3D`ERROR'

iptables: Invalid argument. Run `dmesg' for more information.


$ lsmod
iptable_mangle 2048 0 - Live 0xbf064000
xt_TEE 2740 0 - Live 0xbf062000
compat_xtables 7584 1 xt_TEE, Live 0xbf05f000
dahdi_echocan_mg2 5288 2 - Live 0xbf05c000
spifxo 18076 2 - Live 0xbf056000
dahdi 197380 8 dahdi_echocan_mg2,spifxo, Live 0xbf024000
xt_tcpudp 2656 7 - Live 0xbf022000
xt_state 1696 1 - Live 0xbf020000
ipt_REJECT 3328 2 - Live 0xbf01e000
xt_multiport 2880 1 - Live 0xbf01c000
xt_conntrack 2144 1 - Live 0xbf01a000
ip_conntrack 47188 2 xt_state,xt_conntrack, Live 0xbf00d000
nfnetlink 5336 1 ip_conntrack, Live 0xbf00a000
iptable_filter 2176 1 - Live 0xbf008000
ip_tables 12104 2 iptable_mangle,iptable_filter, Live 0xbf004000
x_tables 12068 7
compat_xtables,xt_tcpudp,xt_state,ipt_REJECT,xt_multiport,xt_conntrack,=
ip_tables,
Live 0xbf000000

Again, dmesg has nothing about iptables :(

$ dmesg
[   53.960000] Linux version 2.6.19.2 (ye@Oceanic815) (gcc version
4.1.2) #85 PREEMPT Wed Nov 16 12:20:42 EST 2011
[   52.960000] CPU: Some Random V6 Processor [4107b364] revision 4
(ARMv6TEJ), cr=3D00c5387f
[   52.960000] Machine: Freescale i.MX31 litekit
[   52.960000] Memory policy: ECC disabled, Data cache writeback
[   55.960000] On node 0 totalpages: 32768
[   55.960000]   DMA zone: 256 pages used for memmap
[   55.960000]   DMA zone: 0 pages reserved
[   55.960000]   DMA zone: 32512 pages, LIFO batch:7
[   55.960000]   Normal zone: 0 pages used for memmap
[   52.960000] CPU0: D VIPT write-back cache
[   52.960000] CPU0: I cache: 16384 bytes, associativity 4, 32 byte
lines, 128 sets
[   52.960000] CPU0: D cache: 16384 bytes, associativity 4, 32 byte
lines, 128 sets
[   52.960000] Built 1 zonelists.  Total pages: 32512
[   53.960000] Kernel command line: console=3Dttymxc0,115200
root=3D/dev/mtdblock4 rootfstype=3Djffs2
[   52.960000] PID hash table entries: 512 (order: 9, 2048 bytes)
[   54.960000]
[   52.960000] WARNING: Can't generate CLOCK_TICK_RATE at 16625000 Hz
[   54.960000] Actual CLOCK_TICK_RATE is 16656250 Hz
[   52.960000] Console: colour dummy device 80x30
[   52.960000] Dentry cache hash table entries: 16384 (order: 4, 65536 =
bytes)
[   52.960000] Inode-cache hash table entries: 8192 (order: 3, 32768 by=
tes)
[   54.970000] Memory: 128MB =3D 128MB total
[   53.970000] Memory: 126848KB available (2388K code, 497K data, 100K =
init)
[   55.970000] Calibrating delay loop... 530.84 BogoMIPS (lpj=3D2654208=
)
[   52.220000] Mount-cache hash table entries: 512
[   54.220000] CPU: Testing write buffer coherency: ok
[   54.220000] NET: Registered protocol family 16
[   54.220000] MXC GPIO hardware
[   54.220000] system_rev is: 0x20
[   52.220000] Irq init for eth0
[   52.220000] GPIO3 [dir=3D0x7000FFF0 val=3D0x8FFF007C]
[   52.230000] L2 cache: WB
[   54.230000] Using SDMA I.API
[   54.230000] MXC DMA API initialized
[   53.230000] SCSI subsystem initialized
[   52.230000]
[   52.230000]
[   52.230000] spi_active 0
[   54.230000] CSPI: mxc_spi-1 probed
[   54.240000] NET: Registered protocol family 2
[   52.330000] IP route cache hash table entries: 1024 (order: 0, 4096 =
bytes)
[   52.330000] TCP established hash table entries: 4096 (order: 2, 1638=
4 bytes)
[   52.330000] TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
[   54.330000] TCP: Hash tables configured (established 4096 bind 2048)
[   54.330000] TCP reno registered
[   54.330000] Low-Level PM Driver module loaded
[   54.330000] NTFS driver 2.1.27 [Flags: R/W].
[   54.330000] JFFS2 version 2.2. (NAND) (C) 2001-2006 Red Hat, Inc.
[   54.330000] io scheduler noop registered
[   54.330000] io scheduler anticipatory registered
[   54.330000] io scheduler deadline registered
[   54.330000] io scheduler cfq registered (default)
[   52.530000] Real TIme clock Driver v1.0
[   51.530000] MXC WatchDog Driver 2.0
[   51.530000] MXC Watchdog # 0 Timer: initial timeout 120 sec
[   51.530000] 1.set watch dog time out to 120.
[   54.530000] Serial: MXC Internal UART driver
[   54.530000] mxcintuart.0: ttymxc0 at MMIO 0x43f90000 (irq =3D 45) is
a Freescale MXC
[   54.780000] mxcintuart.1: ttymxc1 at MMIO 0x43f94000 (irq =3D 32) is
a Freescale MXC
[   54.790000] mxcintuart.2: ttymxc2 at MMIO 0x5000c000 (irq =3D 18) is
a Freescale MXC
[   54.800000] mxcintuart.4: ttymxc4 at MMIO 0x43fb4000 (irq =3D 47) is
a Freescale MXC
[   52.810000] RAMDISK driver initialized: 2 RAM disks of 32768K size
1024 blocksize
[   54.820000] loop: loaded (max 8 devices)
[   54.820000] MXC MTD nor Driver 2.0
[   55.830000] CFI: Found no mxc_nor_flash.0 device at location zero
[   52.830000] mxc_nor_flash: probe of mxc_nor_flash.0 failed with erro=
r -5
[   54.830000] MXC MTD nand Driver 2.0
[   51.840000] PDR0=3D0xff871f58.
<3>ESDCFG0=3D0x79d72f.
<3>ESDCFG1=3D0x7ac727.
<6>NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Unknown NAND
512MiB 3,3V 8-bit)
[   54.860000] Scanning device for bad blocks
[   53.530000] Searching for RedBoot partition table in NAND 512MiB
3,3V 8-bit at offset 0x80000
[   53.560000] 6 RedBoot partitions found on MTD device NAND 512MiB 3,3=
V 8-bit
[   53.570000] Creating 6 MTD partitions on "NAND 512MiB 3,3V 8-bit":
[   53.580000] 0x00000000-0x00040000 : "RedBoot"
[   53.580000] 0x00080000-0x0009f000 : "FIS directory"
[   52.590000] mtd: partition "FIS directory" doesn't end on an erase
block -- force read-only
[   53.600000] 0x0009f000-0x000a0000 : "RedBoot config"
[   52.600000] mtd: partition "RedBoot config" doesn't start on an
erase block boundary -- force read-only
[   53.610000] 0x000a0000-0x004a0000 : "kernel"
[   53.620000] 0x004a0000-0x104a0000 : "rootfs"
[   53.620000] 0x104a0000-0x1fb00000 : "workspace"
[   54.630000] SSI module loaded successfully
[   54.630000] TCP cubic registered
[   54.640000] NET: Registered protocol family 1
[   54.640000] NET: Registered protocol family 17
[   54.640000] VFP support v0.3: implementor 41 architecture 1 part 20
variant b rev 2
[   52.130000] Empty flash at 0x0a0555e8 ends at 0x0a055800
[   52.140000] Empty flash at 0x0a059cfc ends at 0x0a05a000
[   52.510000] VFS: Mounted root (jffs2 filesystem).
[   54.520000] Freeing init memory: 100K
[   52.570000] Empty flash at 0x0a7e286c ends at 0x0a7e3000
[   51.420000] 1.set watch dog time out to 10.
[   51.430000] 2.set watch dog time out to 10.
[   54.720000] eth0: SMSC911x/921x identified at 0xc8a00000, IRQ: 116
[   54.720000] eth0: SMSC911x MAC Address: 12:34:ff:e7:80:fe
[   54.750000] eth0: link down
[   54.220000] eth0: link up, 100Mbps, full-duplex, lpa 0xC5E1
[   54.210000] eth1: SMSC911x/921x identified at 0xc8c00000, IRQ: 117
[   54.210000] eth1: SMSC911x MAC Address: 82:dc:a8:6c:3a:d7
[   54.240000] eth1: link down
[   52.460000] ip_tables: (C) 2000-2006 Netfilter Core Team
[   52.710000] Netfilter messages via NETLINK v0.30.
[   52.750000] ip_conntrack version 2.4 (1024 buckets, 8192 max) - 228
bytes per conntrack
[   54.990000] dahdi: Telephony Interface Registered on major 196
[   54.990000] dahdi: Version: 2.4.1.2
[   52.020000] FXO mode set to [0] [FCC]
[   52.630000] Found card: SPI FXO with 2 channel(s) available
[   53.650000] dahdi_echocan_mg2: Registered echo canceler 'MG2'
[   54.760000] dahdi: Registered tone zone 0 (United States / North Ame=
rica)
[   53.830000] JFFS2 notice: (698) check_node_data: wrong data CRC in
data node at 0x0e7e3000: read 0xb509b86d, calculated 0x8d351ed0.
[   53.460000] JFFS2 notice: (712) check_node_data: wrong data CRC in
data node at 0x0a7e2800: read 0xc8ea41f6, calculated 0xec7ee507.

--
Ye
