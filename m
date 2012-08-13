From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: new ipfw/dummynet releases available (also netmap enabled)
Date: Mon, 13 Aug 2012 13:01:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208131259340.27005@frira.zrqbmnf.qr>
References: <20120813110651.GA79223@onelab2.iet.unipi.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120813110651.GA79223@onelab2.iet.unipi.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luigi Rizzo <rizzo@iet.unipi.it>
Cc: netfilter@vger.kernel.org

On Monday 2012-08-13 13:06, Luigi Rizzo wrote:

>I have updated the ipfw/dummynet code for Linux, which should now compile
>cleanly also on recent version of the OS. You can find it at
>
>	http://info.iet.unipi.it/~luigi/dummynet/
>
>(dummynet is a packet scheduler/link emulator that works together
>with ipfw, a flexible packet classifier).

The most important aspect you seemed to have forgotten: if it runs only 
with ipfw, what relevance does that have to Linux?
