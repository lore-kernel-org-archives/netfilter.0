From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: OT 3com nic prob
Date: Mon, 20 Oct 2003 12:58:24 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E70A8D60@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


I have a new problem. Although not entirely iptables related, I use it =
for iptables.
I have 2 network cards: 1 built-in intel with the motherboard and 1 3com =
3c509x.
I was gonna use the 2 nics for iptables.

Now the problem comes when assigning ip addresses and rules based on =
network cards.

eth0: 192.168.247.233 - internal lan, no gateway
eth1: 192.168.247.232 - external access, with gateway access

I have squid running on the server. When people try to use squid on =
192.168.247.233 they can connect properly but I notice on =
/var/log/kernel that IN=3Deth1 DST=3D192.168.247.233=20

And "route" gives me:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
192.168.0.0     *               255.255.0.0     U     0      0        0 =
eth1
192.168.0.0     *               255.255.0.0     U     0      0        0 =
eth1
127.0.0.0       *               255.0.0.0       U     0      0        0 =
lo
default         192.168.247.1   0.0.0.0         UG    0      0        0 =
eth1

I can't seem to find my eth0 in the route function.


ifconfig produces the correct settings:
eth0      Link encap:Ethernet  HWaddr 00:02:55:EE:C3:91
          inet addr:192.168.247.233  Bcast:192.168.255.255  =
Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:5966 errors:0 dropped:0 overruns:0 frame:0
          TX packets:177 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:3947472 (3.7 Mb)  TX bytes:21673 (21.1 Kb)
          Interrupt:10 Base address:0xa000

eth1      Link encap:Ethernet  HWaddr 00:10:5A:D0:19:16
          inet addr:192.168.247.232  Bcast:192.168.255.255  =
Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:26729 errors:0 dropped:0 overruns:0 frame:0
          TX packets:21025 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:6420599 (6.1 Mb)  TX bytes:17324985 (16.5 Mb)
          Interrupt:10 Base address:0xb800

On pinging 192.168.247.233, it produces a successful result but when I =
pull the plug on eth1 it stops working. So why does ifconfig say =
192.168.247.233 is on eth0 when I pull the rj45 on eth1 it stops =
responding?

/etc/modules.conf says:
alias eth0 eepro100
alias eth1 3c59x

Hope you can help me again. Thanks.



fritz <www.mesedilla.com>
---
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


