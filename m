From: =?iso-8859-15?Q?Fran=E7ois_Legal?= <francois.legal@thom.fr.eu.org>
Subject: ipsec not always routing/transmitting the packets
Date: Wed, 28 May 2008 16:25:14 +0200 (CEST)
Message-ID: <43242.80.118.132.195.1211984714.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I set up an ipsec tunnel between 2 private networks, using two machines
running Linux 2.6 + racoon for IKE.

The tunnel works quite correctly, however, I have sometimes (well this
happens usually actually) the packets from private IP of one gateway no=
t
going through the tunnel. Traffic from lan host on both side work very
well. It's just that traffic from one gateway to the other that sometim=
es
gets lost.

Both machines also act as router/firewall (using netfilter) to provide
internet access to each private lans.

Config is :

Host A:
eth0 =3D 1.1.1.1 (lan)
eth1 =3D 80.1.1.1 (inet)

Host B:
eth0 =3D 2.1.1.1 (lan)
eth1 =3D 192.168.1.10 (semi private behind a NAT box) 80.1.1.2

I could then track the packets using the LOG target and here is what
happens :
if I do the following on host A

ping -I eth0 2.1.1.1 -c 1

I can see the packet get out of host A :
May 28 16:16:46 firewall kernel: OPT1: IN=3D OUT=3Deth1 SRC=3D1.1.1.1
DST=3D2.1.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3D=
ICMP TYPE=3D8
CODE=3D0 ID=3D31821 SEQ=3D1
May 28 16:16:46 firewall kernel: POSTN: IN=3D OUT=3Deth1 SRC=3D1.1.1.1
DST=3D2.1.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3D=
ICMP TYPE=3D8
CODE=3D0 ID=3D31821 SEQ=3D1
May 28 16:16:46 firewall kernel: OPT1: IN=3D OUT=3Deth1 SRC=3D80.1.1.1
DST=3D80.1.1.2 LEN=3D152 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D45571 DF =
PROTO=3DESP
SPI=3D0xd934b73

then get in on host B :
May 28 16:16:46 blg-srv-01 kernel: IPT1: IN=3Deth3 OUT=3D
MAC=3D00:1a:64:d2:ae:62:00:1d:68:48:77:62:08:00 SRC=3D80.1.1.1
DST=3D192.168.1.10 LEN=3D152 TOS=3D0x00 PREC=3D0x00 TTL=3D54 ID=3D45571=
 DF PROTO=3DESP
SPI=3D0xd934b73
May 28 16:16:46 blg-srv-01 kernel: PRER: IN=3Deth3 OUT=3D
MAC=3D00:1a:64:d2:ae:62:00:1d:68:48:77:62:08:00 SRC=3D1.1.1.1 DST=3D2.1=
=2E1.1
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DICMP TYPE=3D=
8 CODE=3D0 ID=3D31821
SEQ=3D1
May 28 16:16:46 blg-srv-01 kernel: PREN: IN=3Deth3 OUT=3D
MAC=3D00:1a:64:d2:ae:62:00:1d:68:48:77:62:08:00 SRC=3D1.1.1.1 DST=3D2.1=
=2E1.1
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DICMP TYPE=3D=
8 CODE=3D0 ID=3D31821
SEQ=3D1
May 28 16:16:46 blg-srv-01 kernel: IPT1: IN=3Deth3 OUT=3D
MAC=3D00:1a:64:d2:ae:62:00:1d:68:48:77:62:08:00 SRC=3D1.1.1.1 DST=3D2.1=
=2E1.1
LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DICMP TYPE=3D=
8 CODE=3D0 ID=3D31821
SEQ=3D1

then the reply gets out of host B :
May 28 16:16:46 blg-srv-01 kernel: OPT1: IN=3D OUT=3Deth3 SRC=3D192.168=
=2E1.10
DST=3D1.1.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D57410 PROTO=
=3DICMP TYPE=3D0
CODE=3D0 ID=3D31821 SEQ=3D1

but now the source address changed

May 28 16:16:46 blg-srv-01 kernel: OPT1: IN=3D OUT=3Deth3 SRC=3D192.168=
=2E1.10
DST=3D80.1.1.1 LEN=3D152 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D13335 PRO=
TO=3DESP
SPI=3D0x589e47e

then the reply get's back in host A :
May 28 16:16:46 firewall kernel: IPT1: IN=3Deth1 OUT=3D
MAC=3D00:30:05:02:83:2d:00:07:cb:06:70:9c:08:00 SRC=3D80.1.1.2 DST=3D80=
=2E1.1.1
LEN=3D152 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D13335 PROTO=3DESP SPI=3D=
0x589e47e

but as the source address is changed in the reply packet, it is not mat=
ched.

This happens with ICMP, but I suspect it also happens with other protoc=
ol
(UDP and TCP) because I have some services (bind and samba for instance=
)
that reports failed or lost connexion.

The weird thing in this, is that sometimes (often) it works correctly, =
but
sometimes not.

Anybody can help ?

--=20
=46ran=E7ois Legal


Message scanned by ClamAV engine (http://www.clamav.net)
--------------------------------------------------------
