From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables limit --limit limitations
Date: Mon, 26 May 2008 13:20:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805261319140.19084@fbirervta.pbzchgretzou.qr>
References: <f08c15d10805170020i2ac5a207g969c0ed5bf10867c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f08c15d10805170020i2ac5a207g969c0ed5bf10867c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2008-05-17 09:20, Payam Chychi wrote:

>Hi,
>
>Has anyone experienced any limitations when implementing the "limit
>--limit $value/sec"  ? I can only get 1000 packets/sec with a value of
>1000 or 10000  with a burst of 5. Ive been able to increase the
>packets to almost 7500 packers/sec when using a value of 10000 with a
>burst of 20.
>
>Ive also tried increasing the HZ for High res timer on the kernel to
>1000 and enabled dynamic ticks (thanks to kuzin)
>any thoughts or ideas on this? I would greatly appreciate any feedback...


It is known that the algorithm in limit and hashlimit are not quite 
accurate. Though, we seem to be out of solutions, too.

