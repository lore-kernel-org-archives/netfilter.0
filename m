From: k-yo@digmore.net
Subject: unexpected behavior of ebtables' BROUTING target redirect
Date: Thu, 28 Aug 2014 11:28:34 +0200
Message-ID: <50558c54090512288e32c423bbf06fb4@digmore.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have a bridge with a single ebtables rule to redirect all=20
IPv4-containing frames to layer 3 filtering:

# ebtables -t broute -A BROUTING -p IPV4 -j redirect --redirect-target=20
DROP --log-level notice --log-prefix "br_br_br:   "

then, if I send a frame containing IPv4 from one host to another one=20
connected on another port of the bridge, I am supposed to get the=20
destination MAC address to be the one of the bridge port it entered the=
=20
bridge if I believe the documentation.

Or, logging packets with iptables, I see the source MAC address to=20
become the bridge port address, and the destination MAC address the one=
=20
of the host the message came from.

I am lost on this issue, it does not make sense to me and wonder where =
I=20
failed=E2=80=A6

Thanks a lot for any help, see below for details.

---- log on the bridge -----

Aug 28 11:15:08 spy kernel: [ 4952.682369] br_br_br:   IN=3Deth0 OUT=3D=
 MAC=20
source =3D 08:00:27:d5:24:36 MAC dest =3D 08:00:27:17:49:6d proto =3D 0=
x0800
Aug 28 11:15:08 spy kernel: [ 4952.682406] ip_raw_pre: IN=3Deth0 OUT=3D=
=20
MAC=3D08:00:27:df:b7:98:08:00:27:d5:24:36:08:00 SRC=3D192.168.142.103=20
DST=3D192.168.142.254 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D1 P=
ROTO=3DTCP=20
SPT=3D20 DPT=3D80 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0
Aug 28 11:15:08 spy kernel: [ 4952.682443] ip_man_pre: IN=3Deth0 OUT=3D=
=20
MAC=3D08:00:27:df:b7:98:08:00:27:d5:24:36:08:00 SRC=3D192.168.142.103=20
DST=3D192.168.142.254 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D1 P=
ROTO=3DTCP=20
SPT=3D20 DPT=3D80 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0
Aug 28 11:15:08 spy kernel: [ 4952.682464] ip_nat_pre: IN=3Deth0 OUT=3D=
=20
MAC=3D08:00:27:df:b7:98:08:00:27:d5:24:36:08:00 SRC=3D192.168.142.103=20
DST=3D192.168.142.254 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D1 P=
ROTO=3DTCP=20
SPT=3D20 DPT=3D80 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0

---- ip a on bridge ----

2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=20
master br0 state UP qlen 1000
     link/ether 08:00:27:df:b7:98 brd ff:ff:ff:ff:ff:ff
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=20
master br0 state UP qlen 1000
     link/ether 08:00:27:d8:32:61 brd ff:ff:ff:ff:ff:ff
4: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state=20
UP
     link/ether 08:00:27:d8:32:61 brd ff:ff:ff:ff:ff:ff
