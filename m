From: pramod_bhandiwad@sifycorp.com
Subject: ip_conntrack LIST_DELETE in ip_conntrack_core.c crashes the system
Date: Tue, 09 Mar 2004 15:04:54 +0600 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078824894.404d8fbece4e8@SifyCorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

We have a system running with RH Linux kernel 2.4.25     
and iptables 1.2.9 with ipt_quota patch. It also does traffic shaping using HTB. The system freezes randomly without any trace in any of the logs and has to be hard booted. The last message in the kernel logs was 
"LIST_DELETE: ip_conntrack_core.c:302 `&ct->tuplehash[IP_CT_DIR_REPLY]'(f004eb10) not in &ip_conntrack_hash[hr]"

We have tried compiling the kernel in Debug mode but its not yielded any useful information. Netfilter also is running in Debug mode.

Is there any fix or workaround
available?


dmesg 
---------

Linux version 3.4.25 (root@theseus) (gcc version 3.2.3) #1 Sat Mar 6 12:06:24 IST 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000007fff0000 (usable)
 BIOS-e820: 000000007fff0000 - 000000007ffff000 (ACPI data)
 BIOS-e820: 000000007ffff000 - 0000000080000000 (ACPI NVS)
 BIOS-e820: 00000000fec00000 - 00000000fed00000 (reserved)
 BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
 BIOS-e820: 00000000ffb80000 - 0000000100000000 (reserved)
1151MB HIGHMEM available.
896MB LOWMEM available.
On node 0 totalpages: 524272
zone(0): 4096 pages.
zone(1): 225280 pages.
zone(2): 294896 pages.
Kernel command line: ro root=/dev/sda5
Initializing CPU#0
Detected 2399.641 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 4784.12 BogoMIPS
Memory: 2069640k/2097088k available (1549k kernel code, 27060k reserved, 538k data, 84k init, 1179584k highmem)
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 8, 1048576 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 131072 (order: 7, 524288 bytes)
Page-cache hash table entries: 524288 (order: 9, 2097152 bytes)
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 512K
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
CPU:             Common caps: bfebfbff 00000000 00000000 00000000
CPU: Intel(R) Xeon(TM) CPU 2.40GHz stepping 09

lspci
-------

00:00.0 Host bridge: Intel Corp.: Unknown device 254c (rev 01)
00:02.0 PCI bridge: Intel Corp. e7500 HI_B Virtual PCI-to-PCI Bridge (F0) (rev 01)
00:1d.0 USB Controller: Intel Corp. 82801CA/CAM USB (Hub  (rev 02)
00:1e.0 PCI bridge: Intel Corp. 82801BA/CA PCI Bridge (rev 42)
00:1f.0 ISA bridge: Intel Corp. 82801CA ISA Bridge (LPC) (rev 02)
00:1f.1 IDE interface: Intel Corp. 82801CA IDE U100 (rev 02)
00:1f.3 SMBus: Intel Corp. 82801CA/CAM SMBus (rev 02)
01:02.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
02:1c.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 04)
02:1d.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 04)
02:1e.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 04)
02:1f.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 04)
03:01.0 Ethernet controller: Intel Corp. 82557/8/9 [Ethernet Pro 100] (rev 08)
03:02.0 Ethernet controller: Intel Corp. 82557/8/9 [Ethernet Pro 100] (rev 08)
04:01.0 Ethernet controller: Intel Corp.: Unknown device 100f (rev 01)
04:04.0 SCSI storage controller: Adaptec: Unknown device 801f (rev 03)
04:04.1 SCSI storage controller: Adaptec: Unknown device 801f (rev 03)




