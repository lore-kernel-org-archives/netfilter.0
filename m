From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Tough suspected MTU problem
Date: Thu, 31 Aug 2006 11:36:29 -0500
Message-ID: <1157042189.2280.35.camel@davila.nicaraguaopensource.com>
References: <feca60390608300703i185c6f34n48e5c402f22f07fa@mail.gmail.com>
Reply-To: davila@nicaraguaopensource.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <feca60390608300703i185c6f34n48e5c402f22f07fa@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Ben DiDonc <ben.didonc@gmail.com>
Cc: netfilter@lists.netfilter.org

Are you tried to set the mtu to a lower value?

ip link set mtu <value> dev <device>

You can begin with a value of 1450 and then decrease until have a
successfully configuration. In some case, I was in need to put the mtu
value to 1200 to give space to new headers (because of the encryptation
data).

Hope this helps,

Jorge D=E1vila.

El jue, 31-08-2006 a las 00:03 +1000, Ben DiDonc escribi=F3:
> Hi everyone,
> I setup a RedHat 9.0 as a NAT boxto connect my home network to the
> internet via an ADSL connection. I have had the following problem
> since the first day I used this setup.
>=20
> Here s what happens:
> Typically, any unencrypted protocol (HTTP, POP, SMTP ,...) work fine
> from the home network through the NAT box. Things start to misbehave
> when I start using SSH and HTTPS. I often make use of port forwarding
> over SSH to connect securely to server at my office. Specially I find
> X and VNC forwarding over SSH specially useful. Typically, apps
> relying on SSH or HTTPS stop working randomly. I did several packet
> capture from clients on the LAN and the same patterns repeat over
> time: a couple of TCP segments get lost on their way from or to the
> local LAN, followed by a couple of duplicated ACKs, sometimes lost
> segments are re-transmitted, and often TCP connections are reset with
> RST segments.
> Here is an ethereal packet capture done from one of the clients
> accessing a web page over HTTPS:
>=20
> Source                Destination           Protocol Info
>=20
> 192.168.2.11      www.xxx.yyy.zzz   TCP      44301 > https [ACK]
> Seq=3D985 Ack=3D16315 Win=3D39264 Len=3D0 TSV=3D141646089 TSER=3D6267976
>=20
> www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP Previous segment
> lost] [TCP segment of a reassembled PDU]
>=20
> 192.168.2.11      www.xxx.yyy.zzz   TCP      [TCP Dup ACK 343#1] 44301
> > https [ACK] Seq=3D985 Ack=3D16315 Win=3D39264 Len=3D0 TSV=3D141646089
> TSER=3D6267976 SLE=3D17663 SRE=3D19011
>=20
>  www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassembl=
ed PDU]
>=20
> 192.168.2.11     www.xxx.yyy.zzz    TCP      [TCP Dup ACK 343#2] 44301
> > https [ACK] Seq=3D985 Ack=3D16315 Win=3D39264 Len=3D0 TSV=3D141646104
> TSER=3D6267976 SLE=3D17663 SRE=3D20359
>=20
>  www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassembl=
ed PDU]
>=20
> 192.168.2.11     www.xxx.yyy.zzz    TCP      [TCP Dup ACK 343#3] 44301
> > https [ACK] Seq=3D985 Ack=3D16315 Win=3D39264 Len=3D0 TSV=3D141646104
> TSER=3D6267976 SLE=3D17663 SRE=3D21122
>=20
> www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP Retransmission] [TCP
> segment of a reassembled PDU]
>=20
> 192.168.2.11      www.xxx.yyy.zzz    TCP      44301 > https [ACK]
> Seq=3D985 Ack=3D21122 Win=3D41960 Len=3D0 TSV=3D141646170 TSER=3D6268058
>=20
> 192.168.2.11     www.xxx.yyy.zzz    TLS      Encrypted Alert
>=20
> 192.168.2.11     www.xxx.yyy.zzz    TCP      44301 > https [RST, ACK]
> Seq=3D1022 Ack=3D21122 Win=3D41960 Len=3D0 TSV=3D141646170 TSER=3D6268058
>=20
> www.xxx.yyy.zzz    192.168.2.11      TCP      https > 44301 [ACK]
> Seq=3D21122 Ack=3D1022 Win=3D7520 Len=3D0 TSV=3D6268073 TSER=3D141646170
>=20
> 192.168.2.11     www.xxx.yyy.zzz     TCP      44301 > https [RST] Seq=3D1=
022 Len=3D0
>=20
> www.xxx.yyy.zzz 192.168.2.11        TCP      [TCP segment of a reassemble=
d PDU]
>=20
> 192.168.2.11      www.xxx.yyy.zzz   TCP      41993 > 14048 [ACK] Seq=3D0
> Ack=3D2 Win=3D3157 Len=3D0 TSV=3D141646824 TSER=3D2152091
>=20
> 192.168.2.11      www.xxx.yyy.zzz   TCP      [TCP segment of a reassemble=
d PDU]
>=20
> www.xxx.yyy.zzz 192.168.2.11        TCP      14048 > 41993 [ACK] Seq=3D2
> Ack=3D2 Win=3D17136 Len=3D0 TSV=3D2152102 TSER=3D141646959
>=20
> 192.168.2.11      www.xxx.yyy.zzz   TCP      44302 > https [SYN] Seq=3D0
> Len=3D0 MSS=3D1460 TSV=3D141647170 TSER=3D0 WS=3D2
>=20
> This NEVER happens when browsing from the NAT box (no lost segments,
> no duplicated ACKs, no nothing !).
> Now I did a bit of homework and looked for solutions (this is how I
> got to suspect an MTU prb).
>=20
> According to the following post:
>  http://lists.netfilter.org/pipermail/netfilter/2005-May/060409.html
> I tried adding a rule similar to "iptables -A FORWARD -p tcp
> --tcp-flags SYN,RST SYN  -j TCPMSS --clamp-mss-to-pmtu" without
> success.
>=20
> This FAQ:
> http://www.snailbook.com/faq/mtu-mismatch.auto.html
> suggests to change the MTU on both the SSH client and server... also
> tried but no sucess...
>=20
> I would appreciate any help !
>=20
> I have included some details below, and can provide more if needed:
>=20
> On the LAN client:
> root@compi:/home/regina# ifconfig
> eth0      Link encap:Ethernet  HWaddr 00:00:39:B9:7F:D1
>           inet addr:192.168.2.11  Bcast:192.168.2.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:64059 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:66342 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:23778577 (22.6 MiB)  TX bytes:9689437 ( 9.2 MiB)
>=20
> root@compi:/home/regina# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use I=
face
> 192.168.2.0     *                255.255.255.0   U     0      0        0 =
eth0
> default            192.168.2.1     0.0.0.0         UG    0      0        =
0 eth0
>=20
>=20
> On the NAT box:
> [root@localhost linux-2.6.16.16]# ifconfig
> eth0      Link encap:Ethernet  HWaddr 00:80:C8:55:E6:31
>           inet addr:192.168.1.1  Bcast: 192.168.1.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:11391682 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:8968237 errors:1 dropped:0 overruns:0 carrier:1
>           collisions:0 txqueuelen:1000
>           RX bytes:1392859320 (1328.3 Mb)  TX bytes:3202265438 (3053.9 Mb)
>           Interrupt:12
>=20
> eth1      Link encap:Ethernet  HWaddr 00:40:F4:37:6D:E8
>           inet addr: 192.168.2.1  Bcast:192.168.2.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>            RX packets:10497062 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:13216604 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:3370675360 (3214.5  Mb)  TX bytes:2761537508 (2633.6 M=
b)
>           Interrupt:9 Base address:0x6200
>=20
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:A.B.C.D  P-t-P:W.X.Y.Z  Mask:255.255.255.255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
>           RX packets:53271 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:53617 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:3
>           RX bytes:17557087 (16.7 Mb)  TX bytes:7327649 (6.9 Mb)
>=20
> [root@localhost linux-2.6.16.16]# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use I=
face
> lns2.tsv.rawnet *               255.255.255.255 UH    0      0        0 p=
pp0
> 192.168.2.0     *               255.255.255.0    U     0      0        0 =
eth1
> 192.168.1.0     *               255.255.255.0   U     0      0        0 e=
th0
> 169.254.0.0      *               255.255.0.0     U     0      0        0 =
eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         E.F.G.H        0.0.0.0         UG    0      0        0 pp=
p0
>=20
> [root@localhost linux-2.6.16.16]# netstat -in
> Kernel Interface table
> Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-O=
VR Flg
> eth0       1500   011392238      0      0      0 8968809      1      0
>      0 BMRU
> eth1       1500   010497698      0      0      013217215      0      0
>      0 BMRU
> lo        16436   0   94438      0      0      0   94438      0      0
>      0 LRU
> ppp0       1492   0   53824      0      0      0   54186      0      0
>      0 MOPRU
>=20
> Thanks again for your help.
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com


