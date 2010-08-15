From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptable and tproxy target
Date: Sun, 15 Aug 2010 14:14:22 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008151411310.11278@obet.zrqbmnf.qr>
References: <AANLkTikh647zs7Te95G7Yrf_Ys6rJTERTyg357574Yn+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikh647zs7Te95G7Yrf_Ys6rJTERTyg357574Yn+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-08-13 15:41, Mamadou Tour=C3=A9 wrote:

>Hi,
>all i'm using tproxy target in my iptable rule:
>ex:
>iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY
>--tproxy-mark 0x1/0x1 --on-port 3129
>
>now in my mangle POSTROUTING i'd like make some action on packet mark
>with --tproxy-mark 0x1/0x1.
>for exemple ACCEPT all packet mark with --tproxy-mark 0x1/0x1.
>
>How could i do that.

Using -m mark. But the packet won't appear in POSTROUTING anyhow, so=20
there is little point in using -m mark.
