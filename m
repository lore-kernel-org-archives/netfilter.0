From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Netfilter NAT port mapping question
Date: Wed, 5 Oct 2011 01:22:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110050110350.29622@frira.zrqbmnf.qr>
References: <alpine.DEB.2.02.1110042312450.20951@aurora>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1110042312450.20951@aurora>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@vger.kernel.org


On Tuesday 2011-10-04 23:23, Sven-Haegar Koch wrote:
>
>The question is, in the following case, does Netfilter "use" two 
>external ports or are/can both connections be mapped to the same 
>external source port?

>Connections before SNAT:
>
>  10.1.2.3 port 1024  -> 8.8.8.8 port 80
>  10.1.2.10 port 1024 -> 9.9.9.9 port 80
>
>After SNAT is it:
>[1]
>  a.b.c.d port 1024 -> 8.8.8.8 port 80
>  a.b.c.d port 1025 -> 9.9.9.9 port 80
>
>or
>[2]
>  a.b.c.d port 1024 -> 8.8.8.8 port 80
>  a.b.c.d port 1024 -> 9.9.9.9 port 80

For NFCT, simple uniqueness suffices (i.e. [2]), though while I am
reading the source, it seems like it ignores local sockets (not so
nice, especially when CTs from local sockets are not tracked).
