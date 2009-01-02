From: bsilva <bsilva@sonic.net>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Fri, 2 Jan 2009 12:44:02 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0901021241290.15698@bolt.sonic.net>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>
 <20090102204908.7ec18094@catlap>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090102204908.7ec18094@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Jorge Bastos <jorge.decimal@gmail.com>, netfilter@vger.kernel.org

As of last month at least, the LARTC mailing list is dead.  As near as I
can tell, this is the best list for tc questions, although if I'm wrong,
I'd love to hear about it.  I'm working on a QoS project as well.


Brad


On Fri, 2 Jan 2009, Marek Kierdelewicz wrote:

> >Hi,
>
> Hi Jorge & List,
>
> >I just joined the mailing list.
>
> It's mailing list for netfilter not Linux QoS. I think your issue is
> more suitable for lartc mailing list (is lartc list alive by the way?
> anyone?).
>
> >I'm using tc to do traffic shaping for about 6 years
> >Since kernels >= 2.6.27 it just stoped working, and started shaping
> >traffic to 1/2kb /sec.
> >How could this be debug? I don't see other place to request for help
> >other than this one, and I was adviced to ask for help here too.
>
> Try attaching qdiscs (sfp/pfifo/bfifo) below each htb class. Please
> send some more information (tc script, scenario, result of "tc -s -d
> class sh dev XXX" command).
>
> Regards,
> Marek Kierdelewicz
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
