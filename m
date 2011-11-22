From: general@upit-systems.com
Subject: Critical problem nfq_get_packet_hw function
Date: Tue, 22 Nov 2011 22:36:42 +0400
Message-ID: <201111222236.42405.general@upit-systems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=upit-systems.com; s=default;
	h=Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:To:From; bh=9bz/EUetb/Oi1t7fgQ0Z0f1Hw7aOzhlD0iG5A/P86QE=;
	b=kKeWkUThZyhFb+m8zDvrm8K0zuPlixbhLcL9zh959fDseeTCSIzfEqpkUBEDFfbk/7yyHbo/ep5u1Z/BxUQoC2BWXn2gaxioNFqKw9SJ6FDQv2oNYZUMLGHhg6fFFHjM;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hello.=20
Help me please!

I use netfilter for the project traffpro (billing system), has faced su=
ch=20
problem, at obtaining MAC of a source address I obtain the normal data,=
 but at=20
loading increase I start to receive instead of MAC addresses:
(The first parameter MAC the address real, second parameter that functi=
on=20
nfq_get_packet_hw () returns me, the third parameter length of the rece=
ived=20
address)

90 e6 ba 10 21 ff =3D 40 0 7f 6 90 39 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 38 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 37 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 33 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 32 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 29 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 90 28 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f d8 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f d7 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f d6 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f d0 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f cf len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f ce len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f ca len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f c9 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f c0 len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f bf len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f 6d len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f 6c len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f 6b len: 6=20
90 e6 ba 10 21 ff =3D 40 0 7f 6 8f 65 len: 6=20

The problem was showed only on 2=D1=85 computers, attempts to replace t=
he=20
distribution kit linux haven't resulted in the positive result (were us=
ed for=20
tests Fedora 14 - 16, Ubuntu server 10.04).

Such problem servers only 2, on remaining servers operation excellent a=
t any=20
loadings.

The only thing that it identical at these two problem servers:=20

07:00.0 Ethernet controler: INTEL CORPORATION 82576 Gigabit Network Con=
nection=20
(rev 01)
07:00.1 Ethernet controler: INTEL CORPORATION 82576 Gigabit Network Con=
nection=20
(rev 01)

Configuration of one of problem servers:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 26
model name      : Intel(R) Xeon(R) CPU           E5504  @ 2.00GHz
stepping        : 5
cpu MHz         : 1600.000
cache size      : 4096 KB



00:00.0 Host bridge: Intel Corporation 5520 I/O Hub to ESI Port (rev 13=
)
00:01.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express=
 Root=20
Port 1 (rev 13)
00:03.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express=
 Root=20
Port 3 (rev 13)
00:07.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express=
 Root=20
Port 7 (rev 13)
00:09.0 PCI bridge: Intel Corporation 5520/5500/X58 I/O Hub PCI Express=
 Root=20
Port 9 (rev 13)
00:14.0 PIC: Intel Corporation 5520/5500/X58 I/O Hub System Management=20
Registers (rev 13)
00:14.1 PIC: Intel Corporation 5520/5500/X58 I/O Hub GPIO and Scratch P=
ad=20
Registers (rev 13)
00:14.2 PIC: Intel Corporation 5520/5500/X58 I/O Hub Control Status and=
 RAS=20
Registers (rev 13)
00:1a.0 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB UH=
CI=20
Controller #4
00:1a.7 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB2 E=
HCI=20
Controller #2
00:1c.0 PCI bridge: Intel Corporation 82801JI (ICH10 Family) PCI Expres=
s Root=20
Port 1
00:1c.4 PCI bridge: Intel Corporation 82801JI (ICH10 Family) PCI Expres=
s Root=20
Port 5
00:1d.0 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB UH=
CI=20
Controller #1
00:1d.1 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB UH=
CI=20
Controller #2
00:1d.2 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB UH=
CI=20
Controller #3
00:1d.7 USB Controller: Intel Corporation 82801JI (ICH10 Family) USB2 E=
HCI=20
Controller #1
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
00:1f.0 ISA bridge: Intel Corporation 82801JIR (ICH10R) LPC Interface=20
Controller
00:1f.2 SATA controller: Intel Corporation 82801JI (ICH10 Family) SATA =
AHCI=20
Controller
02:00.0 VGA compatible controller: Matrox Graphics, Inc. MGA G200e [Pil=
ot]=20
ServerEngines (SEP1) (rev 02)
06:00.0 RAID bus controller: Hewlett-Packard Company Smart Array G6=20
controllers (rev 01)
07:00.0 Ethernet controller: Intel Corporation 82576 Gigabit Network=20
Connection (rev 01)
07:00.1 Ethernet controller: Intel Corporation 82576 Gigabit Network=20
Connection (rev 01)
fe:00.0 Host bridge: Intel Corporation Xeon 5500/Core i7 QuickPath=20
Architecture Generic Non-Core Registers (rev 05)
fe:00.1 Host bridge: Intel Corporation Xeon 5500/Core i7 QuickPath=20
Architecture System Address Decoder (rev 05)
fe:02.0 Host bridge: Intel Corporation Xeon 5500/Core i7 QPI Link 0 (re=
v 05)
fe:02.1 Host bridge: Intel Corporation Xeon 5500/Core i7 QPI Physical 0=
 (rev=20
05)
fe:02.4 Host bridge: Intel Corporation Xeon 5500/Core i7 QPI Link 1 (re=
v 05)
fe:02.5 Host bridge: Intel Corporation Xeon 5500/Core i7 QPI Physical 1=
 (rev=20
05)
fe:03.0 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller (rev 05)
fe:03.1 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Target Address Decoder (rev 05)
fe:03.2 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller RAS Registers (rev 05)
fe:03.4 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Test Registers (rev 05)
fe:04.0 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 0 Control Registers (rev 05)
fe:04.1 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 0 Address Registers (rev 05)
fe:04.2 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 0 Rank Registers (rev 05)
fe:04.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 0 Thermal Control Registers (rev 05)
fe:05.0 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 1 Control Registers (rev 05)
fe:05.1 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 1 Address Registers (rev 05)
fe:05.2 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 1 Rank Registers (rev 05)
fe:05.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 1 Thermal Control Registers (rev 05)
fe:06.0 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 2 Control Registers (rev 05)
fe:06.1 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 2 Address Registers (rev 05)
fe:06.2 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 2 Rank Registers (rev 05)
fe:06.3 Host bridge: Intel Corporation Xeon 5500/Core i7 Integrated Mem=
ory=20
Controller Channel 2 Thermal Control Registers (rev 05)

Thanks!
