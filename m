From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Classify target and non-terminating targets
Date: Wed, 28 May 2008 22:15:29 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805282214420.19264@fbirervta.pbzchgretzou.qr>
References: <Pine.LNX.4.64.0805281502500.25731@auliya.ldc.usb.ve>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0805281502500.25731@auliya.ldc.usb.ve>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LDC - Jairo Eduardo Lopez <jairo@ldc.usb.ve>
Cc: netfilter@vger.kernel.org

On Wednesday 2008-05-28 21:37, LDC - Jairo Eduardo Lopez wrote:

> Hello all,
>
> I haven't been able to find the answer for myself so I'm hoping you guys
> can help me out. I've searched the mayority of documents on the web
> concerning the transversal of packets through the iptables chains but
> this question still eludes me.
>
> I need to know if the CLASSIFY target in iptables is non-terminating. I
> was also wondering if you can also point me to information to understand
> the classification and queuing of packets in the Linux kernel.

All targets in the Linux kernel that are limited to the mangle table are 
non-terminating.
