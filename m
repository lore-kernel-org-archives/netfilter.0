From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to change source address of packets destined for the box?
Date: Fri, 26 Mar 2010 00:17:53 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1003260013500.6000@obet.zrqbmnf.qr>
References: <bf5857901003251607w7b1ab8bcjbe03326f8a54ef9c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf5857901003251607w7b1ab8bcjbe03326f8a54ef9c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Lele <ajay.lele@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-03-26 00:07, Ajay Lele wrote:
>
>For a peculiar VPN address management scenario, I want to change
>source address of incoming packet destined for the box (inner IP
>packet in the IPsec tunnel terminated on the box) to a certain value.
>With iptables, SNAT can be configured only for POSTROUTING chain which
>won't be hit in this case as the packet is destined for the box.

Do the SNAT on the tunnel entry point, not the exit point.

>Googling showed an old thread which discusses similar issue.. looks
>like at that time there was no other way to achieve this. Does it
>still hold good?
>http://lists.netfilter.org/pipermail/netfilter-devel/2001-March/000717.html

Citing Gung So from that post:
| this will allow you to
| later move the protocol state around _without_ breaking the connection

A much more proper thing to do in Gung So's case is to use things 
like SHIM6.
