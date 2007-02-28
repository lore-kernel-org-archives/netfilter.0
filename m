From: Gustavo Michels <gustavo.michels@gmail.com>
Subject: PPTP VPN: Unknown GRE version 5
Date: Wed, 28 Feb 2007 12:58:49 -0300
Message-ID: <200702281258.49341.gustavo.michels@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_5aa5FFwqkd6T0oE"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:user-agent:mime-version:content-type:message-id;
	b=R48faXtsbPyNtP4wK9C/Rhm3IH4XC7sczSeJJWkg1I0BbbQjdG9eyG/z2RMVYp3dupW19ZUhSHYZaXEmEPkL0YLbapwDEA+RZNgy3mXL/oXOGopFwBvSRcmK3ivBatxCJjEP3IU8phQqcEvRE7hZO2QB9ZsRjOfcIc0NiRxWRO4=
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
To: netfilter@lists.netfilter.org

--Boundary-00=_5aa5FFwqkd6T0oE
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings to all,

I'm experiencing some problems while trying to connect to a PPTP VPN server. 
Here's the scenario:

   Clients ------->------- WRT54GL router ------->------- PPTP VPN Server
172.16.0.0/24              172.16.0.1                          66.150.105.18

The Linksys WRT54GL router is running a custom firmware (DD-WRT v24 [1]) which 
is essentially Linux (dmesg attached) with netfilter and iptables (not sure 
which iptables version, but it's 1.2.9 or later). The WAN connection is DHCP 
cable modem.

# uname -a
Linux gateway 2.4.34 #753 Thu Feb 15 16:56:46 CET 2007 mips unknown

The router has PPTP VPN passthrough enabled which, in essence, loads the 
ip_nat_pptp, ip_conntrack_pptp, ip_conntrack_proto_gre and ip_nat_proto_gre 
modules and adds these two rules to the FORWARD chain (full iptables output 
also attached):

ACCEPT     gre  --  172.16.0.0/24        anywhere
ACCEPT     tcp  --  172.16.0.0/24        anywhere            tcp dpt:1723

So far, so good, I'm able to connect to the VPN and everything is ok. The 
problem is, whenever I start a network intensive application (such as the 
bittorrent client Azureus [2]), the connection dies after a couple of minutes. 
By "dead" I mean no more traffic, though the VPN remains connected (not "hung 
up"). I can still ping the VPN gateway, but that's all I can do. I need to 
manually disconnect and reconnect in order to use the VPN resources again.

When I lose VPN connectivity, the router's log get flooded by these messages:

Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:16 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:17 gateway user.warn kernel: unknown GRE version 5
Feb 26 01:59:17 gateway user.warn kernel: unknown GRE version 5

I do get a quick burst of the above messsages even when I still have 
connectivity. This quick burst usually happens once or twice, but short 
after, the connectivity is gone.

Just doing low traffic stuff such as web browsing does not yield any issues 
and I stay connected normally.

Now the bad part: if I remove the router and connect the cable modem directly 
to the computer, I get zero problems. So, it looks like the problem lies on 
the router.

Does anyone know what these "unknown GRE version 5" mean? Some have said the 
router doesn't seem to support GRE version 5, but how can I be sure of that?

I also asked for help in two places: in the VPN forum [3] and in the DD-WRT 
forum [4]. There's also another thread on another forum [5], where other 
WRT54G users have the same issue, though on different firmware (Tomato, but 
still Linux). You may look at those threads for further reference of this 
issue.

Any help is greatly welcomed.

Thanks
Gustavo

[1] http://www.dd-wrt.com
[2] http://azureus.sourceforge.net
[3] http://www.secureix.com/phpBB2/viewtopic.php?p=453
[4] http://www.dd-wrt.com/phpBB2/viewtopic.php?t=11641
[5] http://www.linksysinfo.org/forums/showthread.php?t=51331
[6] http://www.polarcloud.com/tomato

--Boundary-00=_5aa5FFwqkd6T0oE
Content-Type: text/plain;
  charset="us-ascii";
  name="dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="dmesg.txt"

# dmesg
CPU revision is: 00029008
Linux version 2.4.34 (root@linux) (gcc version 3.4.4 (OpenWrt-2.0)) #753 Thu Feb 15 16:56:46 CET 2007
sbinfo: 0 -1 17
Setting the PFC to its default value
Determined physical RAM map:
 memory: 01000000 @ 00000000 (usable)
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock2 rootfstype=squashfs,jffs2 noinitrd console=ttyS0,115200
CPU: BCM5352 rev 0 at 200 MHz
Using 100.000 MHz high precision timer.
Calibrating delay loop... 199.47 BogoMIPS
Dentry cache hash table entries: 2048 (order: 2, 16384 bytes)
Inode cache hash table entries: 1024 (order: 1, 8192 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
Checking for 'wait' instruction...  unavailable.
POSIX conformance testing by UNIFIX
PCI: no core
PCI: Fixing up bus 0
Initializing RT netlink socket
Starting kswapd
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
squashfs: version 3.0 (2006/03/15) Phillip Lougher
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at 0xb8000300 (irq = 3) is a 16550A
ttyS01 at 0xb8000400 (irq = 3) is a 16550A
Software Watchdog Timer: 0.05, timer margin: 60 sec
PCI: Setting latency timer of device 00:01.0 to 64
imq driver loaded.
Universal TUN/TAP device driver 1.5 (C)1999-2002 Maxim Krasnyansky
Physically mapped flash: Found an alias at 0x400000 for the chip at 0x0
Physically mapped flash: Found an alias at 0x800000 for the chip at 0x0
Physically mapped flash: Found an alias at 0xc00000 for the chip at 0x0
Physically mapped flash: Found an alias at 0x1000000 for the chip at 0x0
Physically mapped flash: Found an alias at 0x1400000 for the chip at 0x0
Physically mapped flash: Found an alias at 0x1800000 for the chip at 0x0
Physically mapped flash: Found an alias at 0x1c00000 for the chip at 0x0
cfi_cmdset_0001: Erase suspend on write enabled
0: offset=0x0,size=0x2000,blocks=8
1: offset=0x10000,size=0x10000,blocks=63
Using word write method
Flash device: 0x400000 at 0x1c000000
bootloader size: 262144
Physically mapped flash: Filesystem type: squashfs, size=0x2fa967
Creating 5 MTD partitions on "Physically mapped flash":
0x00000000-0x00040000 : "cfe"
0x00040000-0x003f0000 : "linux"
0x000cdc24-0x003d0000 : "rootfs"
mtd: partition "rootfs" doesn't start on an erase block boundary -- force read-only
0x003f0000-0x00400000 : "nvram"
0x003d0000-0x003f0000 : "ddwrt"
Initializing Cryptographic API
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
ip_conntrack version 2.1 (512 buckets, 4096 max) - 336 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
IPP2P v0.8.2 loading
ipt_random match loaded
netfilter PSD loaded - (c) astaro AG
ipt_osf: Startng OS fingerprint matching module.
ipt_IPV4OPTSSTRIP loaded
ip_conntrack_rtsp v0.01 loading
ip_nat_rtsp v0.01 loading
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
All bugs added by David S. Miller <davem@redhat.com>
VFS: Mounted root (squashfs filesystem) readonly.
Mounted devfs on /dev
diag boardtype: 00000467
PCI: Setting latency timer of device 00:05.0 to 64
sbinfo: 0 -1 17
eth1: Broadcom BCM4320 802.11 Wireless Controller 4.80.53.0
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications AB.
vlan0: add 01:00:5e:00:00:01 mcast address to master interface
vlan0: dev_set_promiscuity(master, 1)
device eth0 entered promiscuous mode
device vlan0 entered promiscuous mode
device eth1 entered promiscuous mode
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17
vlan1: Setting MAC address to  00 18 39 7a 94 7c.
vlan1: add 01:00:5e:00:00:01 mcast address to master interface
vlan1: dev_set_promiscuity(master, 1)
device vlan1 entered promiscuous mode
vlan1: dev_set_allmulti(master, 1)
device br0 entered promiscuous mode
vlan1: dev_set_allmulti(master, 1)
vlan1: add 01:00:5e:7f:ff:fa mcast address to master interface
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17
HTB init, kernel part version 3.17

--Boundary-00=_5aa5FFwqkd6T0oE
Content-Type: text/plain;
  charset="us-ascii";
  name="iptables.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="iptables.txt"

# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     0    --  anywhere             anywhere            state RELATED,ESTABLISHED
DROP       udp  --  anywhere             anywhere            udp dpt:route
DROP       udp  --  anywhere             anywhere            udp dpt:route
ACCEPT     udp  --  anywhere             anywhere            udp dpt:route
logaccept  tcp  --  anywhere             gateway.casa        tcp dpt:www
logaccept  tcp  --  anywhere             gateway.casa        tcp dpt:ssh
ACCEPT     icmp --  anywhere             anywhere
ACCEPT     igmp --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere            state NEW
logaccept  0    --  anywhere             anywhere            state NEW
DROP       0    --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     gre  --  172.16.0.0/24        anywhere
ACCEPT     tcp  --  172.16.0.0/24        anywhere            tcp dpt:1723
ACCEPT     0    --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere
logdrop    0    --  anywhere             anywhere            state INVALID
TCPMSS     tcp  --  anywhere             anywhere            tcp flags:SYN,RST/SYN tcpmss match 1461:65535 TCPMSS set 1460
lan2wan    0    --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere            state RELATED,ESTABLISHED
ACCEPT     udp  --  anywhere             BASE-ADDRESS.MCAST.NET/4 udp
ACCEPT     tcp  --  anywhere             hobbit.casa         tcp dpt:3389
TRIGGER    0    --  anywhere             anywhere            TRIGGER type:in match:0 relate:0
trigger_out  0    --  anywhere             anywhere
ACCEPT     0    --  anywhere             anywhere            state NEW
DROP       0    --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain advgrp_1 (0 references)
target     prot opt source               destination

Chain advgrp_10 (0 references)
target     prot opt source               destination

Chain advgrp_2 (0 references)
target     prot opt source               destination

Chain advgrp_3 (0 references)
target     prot opt source               destination

Chain advgrp_4 (0 references)
target     prot opt source               destination

Chain advgrp_5 (0 references)
target     prot opt source               destination

Chain advgrp_6 (0 references)
target     prot opt source               destination

Chain advgrp_7 (0 references)
target     prot opt source               destination

Chain advgrp_8 (0 references)
target     prot opt source               destination

Chain advgrp_9 (0 references)
target     prot opt source               destination

Chain grp_1 (0 references)
target     prot opt source               destination

Chain grp_10 (0 references)
target     prot opt source               destination

Chain grp_2 (0 references)
target     prot opt source               destination

Chain grp_3 (0 references)
target     prot opt source               destination

Chain grp_4 (0 references)
target     prot opt source               destination

Chain grp_5 (0 references)
target     prot opt source               destination

Chain grp_6 (0 references)
target     prot opt source               destination

Chain grp_7 (0 references)
target     prot opt source               destination

Chain grp_8 (0 references)
target     prot opt source               destination

Chain grp_9 (0 references)
target     prot opt source               destination

Chain lan2wan (1 references)
target     prot opt source               destination

Chain logaccept (3 references)
target     prot opt source               destination
ACCEPT     0    --  anywhere             anywhere

Chain logdrop (1 references)
target     prot opt source               destination
DROP       0    --  anywhere             anywhere

Chain logreject (0 references)
target     prot opt source               destination
REJECT     tcp  --  anywhere             anywhere            tcp reject-with tcp-reset

Chain trigger_out (1 references)
target     prot opt source               destination

--Boundary-00=_5aa5FFwqkd6T0oE--

