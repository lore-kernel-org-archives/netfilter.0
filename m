From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: ifup: Delaying eth0 initialization.
Date: Tue, 24 Dec 2002 10:28:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c2ab61$1cfdfce0$8c01a8c0@sundaram>
References: <H7D5MZ$I9Or4RCoD4e51vPZvonZ6tDR2AGxyE1hroSPZ3lJTgKD@bol.com.br> <OE30pOUd0j7Mtb9z9tj00009428@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

Hi,

We have redhat 7.1 installed on the laptop, while booting the machine its
giving  "network: Bringing up interface eth0:  failed" error message but
network is working ( I was able to use telnet, ssh service from other
computer). We are using Linksys network card.

How will I disable this error message.

boot.log file output:

Dec 23 17:50:48 ptce sysctl: net.ipv4.ip_forward = 0
Dec 23 17:50:48 ptce sysctl: net.ipv4.conf.all.rp_filter = 1
Dec 23 17:50:48 ptce sysctl: kernel.sysrq = 0
Dec 23 17:50:48 ptce network: Setting network parameters:  succeeded
Dec 23 17:50:48 ptce network: Bringing up interface lo:  succeeded
Dec 23 17:50:48 ptce ifup: Delaying eth0 initialization.
Dec 23 17:50:48 ptce network: Bringing up interface eth0:  failed
Dec 23 17:50:51 ptce pcmcia:  cardmgr.
Dec 23 17:50:52 ptce rc: Starting pcmcia:  succeeded


[root@ptce log]# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:04:5A:A0:B8:F5
          inet addr:192.168.1.253  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:38421 errors:0 dropped:0 overruns:0 frame:0
          TX packets:533 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:1711 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1711 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0


[root@ptce log]# lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX - 82443BX/ZX Host bridge
(rev 03
)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX - 82443BX/ZX AGP bridge (rev
03)
00:03.0 CardBus bridge: Texas Instruments PCI1225 (rev 01)
00:03.1 CardBus bridge: Texas Instruments PCI1225 (rev 01)
00:07.0 Bridge: Intel Corporation 82371AB PIIX4 ISA (rev 02)
00:07.1 IDE interface: Intel Corporation 82371AB PIIX4 IDE (rev 01)
00:07.2 USB Controller: Intel Corporation 82371AB PIIX4 USB (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB PIIX4 ACPI (rev 03)
00:08.0 Multimedia audio controller: ESS Technology ES1983S Maestro-3i PCI
Audio
 Accelerator (rev 10)
00:08.1 Communication controller: ESS Technology ES1983S Maestro-3i PCI
Modem Ac
celerator (rev 10)
01:00.0 VGA compatible controller: ATI Technologies Inc Rage Mobility P/M
AGP 2x
 (rev 64)


alias parport_lowlevel parport_pc
alias sound-slot-0 maestro3
post-install sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -L >/dev/null
2>&1
 || :
pre-remove sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -S >/dev/null
2>&1 |
| :
alias usb-controller usb-uhci
options i810 xfreeversion=41
options i810 xfreeversion=41



[root@ptce log]# lsmod
Module                  Size  Used by    Not tainted
parport_pc             17476   1  (autoclean)
lp                      8576   0  (autoclean)
parport                33536   1  (autoclean) [parport_pc lp]
autofs                 11172   1  (autoclean)
appletalk              23628   0  (autoclean)
ipx                    19604   0  (autoclean)
pcnet_cs               13316   1
8390                    8004   0  [pcnet_cs]
ds                      8416   2  [pcnet_cs]
yenta_socket           12000   2
pcmcia_core            49888   0  [pcnet_cs ds yenta_socket]
ipchains               40040   0
usb-uhci               24324   0  (unused)
usbcore                71072   1  [usb-uhci]



