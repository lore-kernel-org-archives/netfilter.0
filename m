From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: iptables or routing problem
Date: Wed, 22 Oct 2003 13:03:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8D75@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


I dunno if this is a routing problem or my iptables.

route:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
192.168.9.0     *               255.255.255.0   U     0      0        0 =
eth0
192.168.0.0     *               255.255.0.0     U     0      0        0 =
eth1
127.0.0.0       *               255.0.0.0       U     0      0        0 =
lo
default         192.168.10.240  0.0.0.0         UG    0      0        0 =
eth1


ifconfig:
eth0      Link encap:Ethernet  HWaddr 00:02:55:EE:C3:91
          inet addr:192.168.9.1  Bcast:192.168.255.255  =
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:377635 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7192 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:216836627 (206.7 Mb)  TX bytes:808284 (789.3 Kb)
          Interrupt:10 Base address:0xa000

eth1      Link encap:Ethernet  HWaddr 00:10:5A:D0:19:16
          inet addr:192.168.8.232  Bcast:192.168.255.255  =
Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1914380 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1522009 errors:0 dropped:0 overruns:0 carrier:1
          collisions:2946 txqueuelen:100
          RX bytes:480613108 (458.3 Mb)  TX bytes:1246359355 (1188.6 Mb)
          Interrupt:10 Base address:0xb800

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:40969 errors:0 dropped:0 overruns:0 frame:0
          TX packets:40969 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:5714853 (5.4 Mb)  TX bytes:5714853 (5.4 Mb)

iptables:
LOGGED: IN=3Deth1 OUT=3D MAC=3D00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00 =
SRC=3D192.168.8.11 DST=3D192.168.9.1 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D63630 DF PROTO=3DTCP SPT=3D2138 DPT=3D3128 WINDOW=3D64240 =
RES=3D0x00 SYN URGP=3D0
LOGGED: IN=3Deth1 OUT=3D MAC=3D00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00 =
SRC=3D192.168.8.11 DST=3D192.168.9.1 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D63746 DF PROTO=3DTCP SPT=3D2140 DPT=3D3128 WINDOW=3D64240 =
RES=3D0x00 SYN URGP=3D0
LOGGED: IN=3Deth1 OUT=3D MAC=3D00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00 =
SRC=3D192.168.8.11 DST=3D192.168.9.1 LEN=3D48 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D63825 DF PROTO=3DTCP SPT=3D2142 DPT=3D3128 WINDOW=3D64240 =
RES=3D0x00 SYN URGP=3D0


How come iptables still says eth1 is being used by 192.168.9.1? This has =
been my biggest problem. I hope to restrict in iptables that eth0 is =
used by 192.168.9.1 for security reasons.

I have no forwarding or any routing settings yet with iptables but a =
simple logging just to find out if the network interfaces work properly.


fritz <www.mesedilla.com>=20
---=20
+ Basta Ikaw Lord

----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.=20

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


