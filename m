From: Lars =?UTF-8?Q?T=C3=A4uber?= <taeuber@bbaw.de>
Subject: Valid packets blocked as invalid?
Date: Wed, 18 Apr 2007 15:19:41 +0200
Message-ID: <20070418151941.c689b07c.taeuber@bbaw.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi everybody!

I just subscribed and haven't found any hints on the net.

We here have some packets dropped as invalid, but I don't understand why =
they are invalid and which part of iptables/kernel marks it as invalid.
So I ask for a hint where to look first or how to debug this. I'm a bit f=
amiliar with ethereal/wireshark.

The situation:

- Linux hippo1 2.6.18.8-0.1-default #1 SMP Fri Mar 2 13:51:59 UTC 2007 i6=
86 athlon i386 GNU/Linux
- openSUSE 10.2 (i586)
- iptables v1.3.6

eth0, eth1, lo and
eth2 =3D 194.95.188.7 / 255.255.255.192 !!

2 different networks are connected to eth2:
 194.95.188.0   / 26 (directly) and
 194.95.188.192 / 26 through gateway 194.95.188.25

routes:

 Kernel IP routing table
 Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
 194.95.188.192  194.95.188.25   255.255.255.192 UG    0      0        0 =
eth2
 194.95.188.0    0.0.0.0         255.255.255.192 U     0      0        0 =
eth2

important iptables rules (in this order):

 $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
 $IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
 $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

 # drop packets that do not match any valid state=20
 #
 $IPTABLES -N drop_invalid
 $IPTABLES -A OUTPUT   -m state --state INVALID  -j drop_invalid
 $IPTABLES -A INPUT    -m state --state INVALID  -j drop_invalid
 $IPTABLES -A FORWARD  -m state --state INVALID  -j drop_invalid
 $IPTABLES -A drop_invalid  -j LOG  --log-level debug --log-prefix "RULE =
-1 -- DENY "
 $IPTABLES -A drop_invalid  -j DROP


and now the bad log entry:

 kernel: RULE -1 -- DENY IN=3Deth2 OUT=3Deth2 SRC=3D194.95.188.38 DST=3D1=
94.95.188.233 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3D=
TCP SPT=3D80 DPT=3D49272 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0

This is answer of a packet that gets through the firewall because of this=
 rules:

 $IPTABLES -A FORWARD -i eth2 -s 194.95.188.192/26 -m state --state NEW -=
j ACCEPT=20
 $IPTABLES -A FORWARD -p tcp -m tcp -m multiport -d 194.95.188.38 --dport=
s 80,22,10080,10180 -m state --state NEW -j ACCEPT


Could someone tell me what happens here?

Thank you and best regards.
Lars

--=20
                            Informationstechnologie
Berlin-Brandenburgische Akademie der Wissenschaften
J=C3=A4gerstrasse 22-23                     10117 Berlin
Tel.: +49 30 20370-352           http://www.bbaw.de

