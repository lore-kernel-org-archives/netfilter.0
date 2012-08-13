From: Luigi Rizzo <rizzo@iet.unipi.it>
Subject: Re: new ipfw/dummynet releases available (also netmap enabled)
Date: Mon, 13 Aug 2012 13:25:57 +0200
Message-ID: <20120813112557.GA79489@onelab2.iet.unipi.it>
References: <20120813110651.GA79223@onelab2.iet.unipi.it> <alpine.LNX.2.01.1208131259340.27005@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1208131259340.27005@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On Mon, Aug 13, 2012 at 01:01:10PM +0200, Jan Engelhardt wrote:
> On Monday 2012-08-13 13:06, Luigi Rizzo wrote:
> 
> >I have updated the ipfw/dummynet code for Linux, which should now compile
> >cleanly also on recent version of the OS. You can find it at
> >
> >	http://info.iet.unipi.it/~luigi/dummynet/
> >
> >(dummynet is a packet scheduler/link emulator that works together
> >with ipfw, a flexible packet classifier).
> 
> The most important aspect you seemed to have forgotten: if it runs only 
> with ipfw, what relevance does that have to Linux?

As it says in the first line you quoted, the code includes
a linux version of both ipfw and dummynet.

The in-kernel version uses the netfilter hooks for packet I/O;
the userspace version (mentioned later in the message) uses netmap.

cheers
luigi
