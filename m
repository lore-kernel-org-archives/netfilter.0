From: "Ulla Grimm" <ug428@gmx.de>
Subject: dnat - ipsec ( legible, forget the first mail)
Date: Sun, 30 Nov 2003 01:29:10 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23019.1070152150@www64.gmx.net>
References: <2713.1070151647@www22.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hallo,

I like to handle packages comming through an ipsec tunnel with dnat.
But that works not completly.
It looks as if the replypackages on the PREROUTED request aren't handeld.
Or did I have just problems to understand it?
Would be great if somebody can help me.
Sorry, my english isn't very well and my computer knowlage even worse, but I
wrote this for my husband who can't speak english at all.
I really hope somebody can help us so my husband can do other things than
hacking on his machine.=20

0     0    DNAT    all  --  ipsec0 *    10.10.200.0/24    172.28.2.162

Nov 29 16:59:39 fw kernel: IN=3Dipsec0 OUT=3Deth0 SRC=3D10.10.200.50
DST=3D192.168.168.80 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D0 DF PRO=
TO=3DICMP
TYPE=3D8 CODE=3D0
ID=3D30478 SEQ=3D62721
Nov 29 16:59:39 fw kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.168.80
DST=3D10.10.200.50 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D17742 PROT=
O=3DICMP TYPE=3D0
CODE=3D0
ID=3D30478 SEQ=3D62721

here more information:

Computer A:   IP 192.168.168.80
                     Reliant Unix

Gateway A:   eth0 192.168.168.59
                    eth1 130.168.100.1 # extern und ipsec-dev
                    Kernel 2.4.4-SuSE, FreeSWAN 1.92 + X509

Gateway B:   eth0 10.10.200.20
                    ippp0 130.168.200.2 # extern and ipsec-dev
                    Kernel 2.4.4-SuSE, FreeSWAN 1.92

Computer B:   IP 10.10.200.50
                      Linux Gentoo

Computer A likes to reach Computer A via IP 172.28.2.162.

Gatway A: ipsec.conf excerpt=20
conn gg
          right=3D130.168.200.2
          rightsubnet=3D10.10.200.0/24
          left=3D130.168.100.1
          leftnexthop=3D130.168.100.101
         # leftsubnet=3D192.168.168.0/24
          leftsubnet=3D172.28.2.160/28
          leftupdown=3D/usr/local/lib/ipsec/gg_ud.sh
          authby=3Dsecret
          auto=3Dadd
          pfs=3Dno

Gateway B: ipsec.conf excerpt
conn gg
         right=3D130.168.200.2
         rightsubnet=3D10.10.200.0/24
         rightnexthop=3D130.168.1.1
         left=3D130.168.100.1
         # leftsubnet=3D192.168.168.0/24#!/bin/sh
         leftsubnet=3D172.28.2.160/28
         authby=3Dsecret

The connection works if the excluded leftsubnet are used and leftupdown is
excluded, Computer B can reach Computer A.

Gatway A:>cat /usr/local/lib/ipsec/gg_ud.sh
#!/bin/sh
#
case "$PLUTO_VERB:$1" in
up-client:)
iptables -t nat -A PREROUTING -i $PLUTO_INTERFACE -s
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -d 172.28.2.162 -j DNAT --to
192.168.168.80
;;
down-client:)
   iptables -t nat -D PREROUTING -i  $PLUTO_INTERFACE -s
$PLUTO_PEER_CLIENT_NET/$PLUTO_PEER_CLIENT_MASK -d 172.28.2.162 -j DNAT --to
192.168.168.80
;;
:status)
   iptables -t nat -nvL PREROUTING
;;
esac

The tunnel get established:

Gateway A:> ipsec eroute
0          172.28.2.160/28    -> 10.10.200.0/24     =3D>
tun0x1006@130.168.200.2

Gateway A:> iptables -t nat -nvL PREROUTING
Chain PREROUTING (policy ACCEPT 435120 packets, 38864020 bytes)
 pkts bytes target     prot opt in        out  source              =20
destination
 0     0       DNAT      all    --  ipsec0  *    10.10.200.0/24  =20
172.28.2.162    to:192.168.168.80

Gateway B:> ipsec eroute
0          10.10.200.0/24     -> 172.28.2.160/28    =3D>
tun0x1004@130.168.100.1

a ping for testing,=20
Computer B:>ping 172.28.2.162
PING 172.28.2.162 (172.28.2.162): 56 octets data


Gateway A:> ipsec eroute
0          172.28.2.160/28    -> 10.10.200.0/24     =3D>
tun0x1008@130.168.200.2

Gateway A:> iptables -t nat -nvL PREROUTING
Chain PREROUTING (policy ACCEPT 435490 packets, 38906905 bytes)
 pkts bytes target     prot opt in         out  source              =20
destination
 155 13020 DNAT     all    --   ipsec0  *     10.10.200.0/24    172.28.2.162
      to:192.168.168.80

Gateway B:> ipsec eroute
278        10.10.200.0/24     -> 172.28.2.160/28    =3D>
tun0x1006@130.168.100.1

Gateway A:> iptables -I FORWARD -j LOG
Gateway A:> tail -f /var/log/messages
Nov 29 16:59:39 fw kernel: IN=3Dipsec0 OUT=3Deth0 SRC=3D10.10.200.50
DST=3D192.168.168.80 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D0 DF PRO=
TO=3DICMP
TYPE=3D8 CODE=3D0
ID=3D30478 SEQ=3D62721
Nov 29 16:59:39 fw kernel: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.168.80
DST=3D10.10.200.50 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D17742 PROT=
O=3DICMP TYPE=3D0
CODE=3D0
ID=3D30478 SEQ=3D62721

Thanks Ulla



--=20
Neu bei GMX: Preissenkung f=FCr MMS-Versand und FreeMMS!

Ideal f=FCr alle, die gerne MMS verschicken:
25 FreeMMS/Monat mit GMX TopMail.
http://www.gmx.net/de/cgi/produktemail

+++ GMX - die erste Adresse f=FCr Mail, Message, More! +++


