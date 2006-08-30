From: "Ben DiDonc" <ben.didonc@gmail.com>
Subject: Tough suspected MTU problem
Date: Thu, 31 Aug 2006 00:03:33 +1000
Message-ID: <feca60390608300703i185c6f34n48e5c402f22f07fa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everyone,
I setup a RedHat 9.0 as a NAT boxto connect my home network to the
internet via an ADSL connection. I have had the following problem
since the first day I used this setup.

Here s what happens:
Typically, any unencrypted protocol (HTTP, POP, SMTP ,...) work fine
from the home network through the NAT box. Things start to misbehave
when I start using SSH and HTTPS. I often make use of port forwarding
over SSH to connect securely to server at my office. Specially I find
X and VNC forwarding over SSH specially useful. Typically, apps
relying on SSH or HTTPS stop working randomly. I did several packet
capture from clients on the LAN and the same patterns repeat over
time: a couple of TCP segments get lost on their way from or to the
local LAN, followed by a couple of duplicated ACKs, sometimes lost
segments are re-transmitted, and often TCP connections are reset with
RST segments.
Here is an ethereal packet capture done from one of the clients
accessing a web page over HTTPS:

Source                Destination           Protocol Info

192.168.2.11      www.xxx.yyy.zzz   TCP      44301 > https [ACK]
Seq=985 Ack=16315 Win=39264 Len=0 TSV=141646089 TSER=6267976

www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP Previous segment
lost] [TCP segment of a reassembled PDU]

192.168.2.11      www.xxx.yyy.zzz   TCP      [TCP Dup ACK 343#1] 44301
> https [ACK] Seq=985 Ack=16315 Win=39264 Len=0 TSV=141646089
TSER=6267976 SLE=17663 SRE=19011

 www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassembled PDU]

192.168.2.11     www.xxx.yyy.zzz    TCP      [TCP Dup ACK 343#2] 44301
> https [ACK] Seq=985 Ack=16315 Win=39264 Len=0 TSV=141646104
TSER=6267976 SLE=17663 SRE=20359

 www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassembled PDU]

192.168.2.11     www.xxx.yyy.zzz    TCP      [TCP Dup ACK 343#3] 44301
> https [ACK] Seq=985 Ack=16315 Win=39264 Len=0 TSV=141646104
TSER=6267976 SLE=17663 SRE=21122

www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP Retransmission] [TCP
segment of a reassembled PDU]

192.168.2.11      www.xxx.yyy.zzz    TCP      44301 > https [ACK]
Seq=985 Ack=21122 Win=41960 Len=0 TSV=141646170 TSER=6268058

192.168.2.11     www.xxx.yyy.zzz    TLS      Encrypted Alert

192.168.2.11     www.xxx.yyy.zzz    TCP      44301 > https [RST, ACK]
Seq=1022 Ack=21122 Win=41960 Len=0 TSV=141646170 TSER=6268058

www.xxx.yyy.zzz    192.168.2.11      TCP      https > 44301 [ACK]
Seq=21122 Ack=1022 Win=7520 Len=0 TSV=6268073 TSER=141646170

192.168.2.11     www.xxx.yyy.zzz     TCP      44301 > https [RST] Seq=1022 Len=0

www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassembled PDU]

192.168.2.11      www.xxx.yyy.zzz   TCP      41993 > 14048 [ACK] Seq=0
Ack=2 Win=3157 Len=0 TSV=141646824 TSER=2152091

192.168.2.11      www.xxx.yyy.zzz   TCP      [TCP segment of a reassembled PDU]

www.xxx.yyy.zzz 192.168.2.11        TCP      14048 > 41993 [ACK] Seq=2
Ack=2 Win=17136 Len=0 TSV=2152102 TSER=141646959

192.168.2.11      www.xxx.yyy.zzz   TCP      44302 > https [SYN] Seq=0
Len=0 MSS=1460 TSV=141647170 TSER=0 WS=2

This NEVER happens when browsing from the NAT box (no lost segments,
no duplicated ACKs, no nothing !).
Now I did a bit of homework and looked for solutions (this is how I
got to suspect an MTU prb).

According to the following post:
 http://lists.netfilter.org/pipermail/netfilter/2005-May/060409.html
I tried adding a rule similar to "iptables -A FORWARD -p tcp
--tcp-flags SYN,RST SYN  -j TCPMSS --clamp-mss-to-pmtu" without
success.

This FAQ:
http://www.snailbook.com/faq/mtu-mismatch.auto.html
suggests to change the MTU on both the SSH client and server... also
tried but no sucess...

I would appreciate any help !

I have included some details below, and can provide more if needed:

On the LAN client:
root@compi:/home/regina# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:00:39:B9:7F:D1
          inet addr:192.168.2.11  Bcast:192.168.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:64059 errors:0 dropped:0 overruns:0 frame:0
          TX packets:66342 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:23778577 (22.6 MiB)  TX bytes:9689437 ( 9.2 MiB)

root@compi:/home/regina# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
192.168.2.0     *                255.255.255.0   U     0      0        0 eth0
default            192.168.2.1     0.0.0.0         UG    0      0        0 eth0


On the NAT box:
[root@localhost linux-2.6.16.16]# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:80:C8:55:E6:31
          inet addr:192.168.1.1  Bcast: 192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:11391682 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8968237 errors:1 dropped:0 overruns:0 carrier:1
          collisions:0 txqueuelen:1000
          RX bytes:1392859320 (1328.3 Mb)  TX bytes:3202265438 (3053.9 Mb)
          Interrupt:12

eth1      Link encap:Ethernet  HWaddr 00:40:F4:37:6D:E8
          inet addr: 192.168.2.1  Bcast:192.168.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:10497062 errors:0 dropped:0 overruns:0 frame:0
          TX packets:13216604 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:3370675360 (3214.5  Mb)  TX bytes:2761537508 (2633.6 Mb)
          Interrupt:9 Base address:0x6200

ppp0      Link encap:Point-to-Point Protocol
          inet addr:A.B.C.D  P-t-P:W.X.Y.Z  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:53271 errors:0 dropped:0 overruns:0 frame:0
          TX packets:53617 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:17557087 (16.7 Mb)  TX bytes:7327649 (6.9 Mb)

[root@localhost linux-2.6.16.16]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
lns2.tsv.rawnet *               255.255.255.255 UH    0      0        0 ppp0
192.168.2.0     *               255.255.255.0    U     0      0        0 eth1
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0
169.254.0.0      *               255.255.0.0     U     0      0        0 eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         E.F.G.H        0.0.0.0         UG    0      0        0 ppp0

[root@localhost linux-2.6.16.16]# netstat -in
Kernel Interface table
Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500   011392238      0      0      0 8968809      1      0
     0 BMRU
eth1       1500   010497698      0      0      013217215      0      0
     0 BMRU
lo        16436   0   94438      0      0      0   94438      0      0
     0 LRU
ppp0       1492   0   53824      0      0      0   54186      0      0
     0 MOPRU

Thanks again for your help.

