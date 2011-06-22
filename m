From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables HL bug ?
Date: Wed, 22 Jun 2011 15:41:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106221536570.14179@frira.zrqbmnf.qr>
References: <BANLkTi=W1uCCMceOT64RMXyK-Q7fFGgmSA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=W1uCCMceOT64RMXyK-Q7fFGgmSA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Christian S. Perone" <christian.perone@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-06-20 20:47, Christian S. Perone wrote:

>Does someone knows why is ip6tables showing this error:
>
># ip6tables -t mangle -A POSTROUTING -j HL --hl-inc 1
>ip6tables v1.3.5: HL: increasing by 0?
>Does someone knows if this is a known bug ?
>
>Details:
>Kernel 2.6.17, powerpc
>ip6tables v1.3.5

Yes, because it's old. Terribly old.
(A different HL bug in 1.4.11 has been spotted and is pending fixure.)

