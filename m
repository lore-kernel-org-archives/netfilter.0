From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: iptables and virtual NIC
Date: Thu, 28 Jul 2011 13:53:00 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107281351310.15776@frira.zrqbmnf.qr>
References: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Kumar Swamy <kswamy@barracuda.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2011-07-28 12:05, Kumar Swamy wrote:

>Hello folks,=20
>
>I am a newbie to iptables and experimenting some stuff.=C2=A0 So pleas=
e excuse me, if this has already been discussed.
>
>I have a linux gateway which has a physical interface (eth0 ) and mult=
iple virtual interfaces ( eth0:1, eth0:2), each has dynamic IP configur=
ed.
>I want to create an iptables rule for =C2=A0IP masquerading on eth0 , =
but=20
>packets going out on other interfaces should be left untouched. Is thi=
s=20
>possible?

Those are no interfaces. You are being deceived. My hint -
stop using ifconfig.
