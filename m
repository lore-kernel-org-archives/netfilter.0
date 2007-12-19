From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: hashsize in nf_conntrack_ipv4
Date: Wed, 19 Dec 2007 03:13:41 +0000
Message-ID: <BAY122-W8237C00B08D4A997705B6BE5C0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org



kernel version 2.6.23.9

when i load nf_conntrack_ipv4 with cmdline "modprobe ip_conntrack hashs=
ize=3D10000" ,=20
i got a err msg=20
         "FATAL: Error inserting nf_conntrack_ipv4 (/lib/modules/2.6.23=
=2E9/kernel/net/ipv4/netfilter/nf_conntrack_ipv4.ko):   =20
         Unknown symbol in module, or unknown parameter (see dmesg)"   =
,=20
and endline in dmesg output=20
         "nf_conntrack_ipv4: Unknown parameter `hashsize' "

so,how can i set the buckets number when i loading ip_conntrack ?
_________________________________________________________________
MSN=CA=A5=B5=AE=C0=F1=CE=EF=BB=F0=C8=C8=B5=C7=B3=A1=A3=AC=C3=E2=B7=D1=B7=
=A2=B7=C5=D6=D0=A3=AC=BF=EC=C0=B4=C1=EC=C8=A1=B0=C9=A3=A1
http://im.live.cn/emoticons/?ID=3D18
