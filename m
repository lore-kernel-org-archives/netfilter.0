From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: SNAT: Large TCP/IP message transfers get RST and client sees a
 broken  pipe
Date: Tue, 23 Mar 2010 03:35:02 +0100 (CET)
Message-ID: <alpine.LSU.2.01.1003230326510.12017@obet.zrqbmnf.qr>
References: <9178cda71003221916i22398d3fybf8150e5fe4265af@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9178cda71003221916i22398d3fybf8150e5fe4265af@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Terry C <tc5716@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-03-23 03:16, Terry C wrote:
>
>The problem noticed is that when large messages are sent from the
>back-end servers via the router, we see that the router every so often
>sends an RST[...]
>
>Any idea why this may be happening? This router Linux machine is
>running a 2.6.21 kernel.

Out of curiosity, does the problem go away with a kernel >= 2.6.25?
I used to have hangs or RSTs too once upon a few years back, and
the issue is most likely a run of kernels (RHEL 2.6.18 being no
exception as usual) where things don't work - in my case TCP SACK
and TCP DSACK.
