From: Gary Hodder <vk2kcf@miacomputers.com>
Subject: Re: Forwarding intranet ip's
Date: 21 Oct 2002 19:35:52 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035192954.2615.104.camel@sandy.vk2kcf.ampr.org>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi Ferry,

Trying to route clients 192.168.150 net to the router box on 192.168.151
net.
The forward chain has
iptables -t filter -A FORWARD -s 192.168.150.0/255.255.255.0 -j ACCEPT
Tried iptables -t filter -A FORWARD -i eth0 -s
192.168.150.0/255.255.255.0 -o eth1 -j ACCEPT
A client machine on 192.168.150 net can ping the 192.168.151.3 interface
but go no further.
150 net go through a 10/100 nway switch.
151 net goes through a dechub 900 with 900dm hub modules.


[root@sandy /]# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:40:95:30:4B:76
          inet addr:192.168.150.3  Bcast:192.168.150.255 
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:316759 errors:0 dropped:0 overruns:0 frame:0
          TX packets:388607 errors:0 dropped:0 overruns:11 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:35469436 (33.8 Mb)  TX bytes:123078370 (117.3 Mb)
          Interrupt:10 Base address:0x2000

eth1      Link encap:Ethernet  HWaddr 00:40:F4:28:A0:E7
          inet addr:192.168.151.3  Bcast:192.168.151.255 
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:22265 errors:0 dropped:0 overruns:0 frame:0
          TX packets:21585 errors:0 dropped:0 overruns:0 carrier:0
          collisions:64 txqueuelen:100
          RX bytes:19189798 (18.3 Mb)  TX bytes:6134499 (5.8 Mb)
          Interrupt:11 Base address:0x4000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:1786 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1786 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:164845 (160.9 Kb)  TX bytes:164845 (160.9 Kb)

[root@sandy /]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.151.0   0.0.0.0         255.255.255.0   U     0      0        0
eth1
192.168.150.0   0.0.0.0         255.255.255.0   U     0      0        0
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0
lo
0.0.0.0         192.168.151.1   0.0.0.0         UG    0      0        0
eth1

[root@sandy /]# lsmod
Module                  Size  Used by    Not tainted
msdos                   5364   0  (autoclean)
vfat                    9588   0  (autoclean)
fat                    31864   0  (autoclean) [msdos vfat]
udf                    85472   0  (autoclean)
nls_iso8859-1           2844   2  (autoclean)
isofs                  25652   0  (autoclean)
inflate_fs             17892   0  (autoclean) [isofs]
sg                     31276   0  (autoclean)
nfs                    67328   0  (autoclean)
floppy                 49340   0
sr_mod                 15096   0  (autoclean)
iptable_filter          1644   1  (autoclean)
iptable_mangle          2072   0  (autoclean) (unused)
iptable_nat            15224   0  (autoclean) (unused)
ip_conntrack           18400   1  (autoclean) [iptable_nat]
ip_tables              11672   5  [iptable_filter iptable_mangle
iptable_nat]
autofs4                 9340   1  (autoclean)
parport_pc             21672   1  (autoclean)
lp                      6720   0  (autoclean)
parport                23936   1  (autoclean) [parport_pc lp]
via82cxxx_audio        19036   1
uart401                 6628   0  [via82cxxx_audio]
ac97_codec              9928   0  [via82cxxx_audio]
sound                  55732   0  [via82cxxx_audio uart401]
soundcore               3780   0  [via82cxxx_audio sound]
nfsd                   66576   8  (autoclean)
lockd                  46480   1  (autoclean) [nfs nfsd]
sunrpc                 60188   1  (autoclean) [nfs nfsd lockd]
ip_vs                  74328   0  (autoclean)
af_packet              13000   2  (autoclean)
8139too                14472   2  (autoclean)
mii                     1152   0  (autoclean) [8139too]
supermount             14340   1  (autoclean)
ide-cd                 28712   0
cdrom                  26848   0  [sr_mod ide-cd]
ide-scsi                8212   0
scsi_mod               90372   3  [sg sr_mod ide-scsi]
usb-uhci               21676   0  (unused)
usbcore                58304   1  [usb-uhci]
rtc                     6560   0  (autoclean)
ext3                   74004   3
jbd                    38452   3  [ext3]

[root@sandy /]# uname -a
Linux sandy.xxxxx.xxxx 2.4.19-16mdk #1 Fri Sep 20 18:15:05 CEST 2002
i686 unknown unknown GNU/Linux
Athlon 1000, 512mb ram.
Box is Linux Mandrake 9.0.
This is all behind another Linux router/firewall.

Gary.

On Mon, 2002-10-21 at 16:23, Ferry van Steen wrote:
> Where are you trying to route to, what are the IP's/Netmasks from the
> network cards and what lines do you have in the FORWARD chain? I saw
you
> already did echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> 
> > -----Oorspronkelijk bericht-----
> > Van: Gary Hodder [mailto:vk2kcf@miacomputers.com] 
> > Verzonden: zondag 20 oktober 2002 3:22
> > Aan: netfilter
> > Onderwerp: Forwarding intranet ip's
> > 
> > 
> > Hi all,
> > 
> > I am wanting to route 192.168.x.x ip's, the Linux kernel will 
> > not do this and hasn't for a while. Is there a iptables rule 
> > to do this or a hack that will turn it back on in the kernel? 
> > I want to do all the ip accounting at the border router and 
> > masq from there.
> > 
> > Thanks
> > Gary.
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> 





