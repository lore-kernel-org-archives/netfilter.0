From: "J R" <mrjre@hotmail.com>
Subject: getting, somewhere...still, need, help, with, NAT, tcp
Date: Tue, 25 Jun 2002 15:59:53 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <F1506Dcu4nODENdwDWJ00021ba3@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

Hi guys I didnt respond to the previous thread I started a few days ago=20
because all the mail was going straight into my junk mail box and I didnt=20
know...sorry I couldn't read it all and so what I am writing might be a bit=
=20
redundant for all of you, but with a bit of help and a lot of stress I have=
=20
found out what my problem is, however I dont know what to do about it.

Situation:  I have pcanywhere running on a lan and want to connect to it=20
over the net through my linux machine.  I have successfully done this=20
without a problem with mandrake linux using a shell script.  However I have=
=20
tried another linux distro (Gentoo) on another box with a similar setup,=20
running the same shell script for the iptable rules and with a kernel custo=
m=20
built with all netfilter options enabled.  However, when I try to connect=20
through this machine, it will not connect.  I then generated log entries an=
d=20
checked both the logs of the working machine vs the non working machine and=
=20
am given the following information:

working machine:

Jun 25 11:18:58 blitzware kernel: IN=3Deth0 OUT=3D=20
MAC=3D00:50:ba:d4:88:94:00:04:27:ef:28:2d:08:00 SRC=3Dxx.xx.xx.xx=20
DST=3Dyy.yy.yy.yy LEN=3D30 TOS=3D0x
00 PREC=3D0x00 TTL=3D53 ID=3D40962 PROTO=3DUDP SPT=3D20097 DPT=3D5632 LEN=
=3D10

Jun 25 11:18:58 blitzware kernel: IN=3Deth0 OUT=3D=20
MAC=3D00:50:ba:d4:88:94:00:04:27:ef:28:2d:08:00 SRC=3Dxx.xx.xx.xx=20
DST=3Dyy.yy.yy.yy LEN=3D52 TOS=3D0x
00 PREC=3D0x00 TTL=3D53 ID=3D41474 DF PROTO=3DTCP SPT=3D20098 DPT=3D5631 WI=
NDOW=3D60352=20
RES=3D0x00 SYN URGP=3D0

non-working machine:

Jun 25 09:38:56 mymachine kernel: IN=3Deth0 OUT=3D=20
MAC=3D00:50:ba:23:bb:7d:00:04:27:ef:28:2d:08:00 SRC=3Dxx.xx.xx.xx
DST=3Dyy.yy.yy.yy LEN=3D30 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D24066 PROTO=
=3DUDP=20
SPT=3D19907 DPT=3D5632 LEN=3D10

As you can see, for the working machine there are both tcp and udp entries =

from iptables, but in the non working machine there is no tcp entry.  Can=20
anyone help me understand why there isnt, and what I can do to ensure there=
=20
will be a tcp entry and that tcp will work?

The script I use is simple, as follows:

#!/bin/sh
iptables -F
iptables -t nat -F
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp --dport 5631 -i eth0 -j LOG --log-leve=
l=20
info
iptables -t nat -A PREROUTING -p tcp --dport 5632 -i eth0 -j LOG --log-leve=
l=20
info
iptables -t nat -A PREROUTING -p udp --dport 5631 -i eth0 -j LOG --log-leve=
l=20
info
iptables -t nat -A PREROUTING -p udp --dport 5632 -i eth0 -j LOG --log-leve=
l=20
info
iptables -t nat -A PREROUTING -p tcp --dport 5631 -i eth0 -j DNAT --to=20
192.168.1.1:5631
iptables -t nat -A PREROUTING -p tcp --dport 5632 -i eth0 -j DNAT --to=20
192.168.1.1:5632
iptables -t nat -A PREROUTING -p udp --dport 5631 -i eth0 -j DNAT --to=20
192.168.1.1:5631
iptables -t nat -A PREROUTING -p udp --dport 5632 -i eth0 -j DNAT --to=20
192.168.1.1:5632

If anyone can help I would appreciate it.

Jeff


_________________________________________________________________
Join the world=92s largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com


