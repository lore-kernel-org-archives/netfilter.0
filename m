From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 05:00:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Tuesday 2010-12-14 04:46, ratheesh k wrote:

>In udp , there is no mss discovey.So , if we=C2=A0 set DF bit in IP pa=
cket =C2=A0=C2=A0 and
>suppose an intermediate router does have disabled icmp-reply (thru ipt=
ables
>)=C2=A0 and=C2=A0 have less MTU than the sender.
>
>Then , router=C2=A0 will drop the packet ,How client know to fragment =
the=C2=A0 udp
>packet ?

It won't, that's why ICMP should not be blocked.
