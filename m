From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Fri, 2 Jan 2009 20:49:08 +0100
Message-ID: <20090102204908.7ec18094@catlap>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jorge Bastos <jorge.decimal@gmail.com>
Cc: netfilter@vger.kernel.org

>Hi,

Hi Jorge & List,

>I just joined the mailing list.

It's mailing list for netfilter not Linux QoS. I think your issue is
more suitable for lartc mailing list (is lartc list alive by the way?
anyone?).

>I'm using tc to do traffic shaping for about 6 years
>Since kernels >= 2.6.27 it just stoped working, and started shaping
>traffic to 1/2kb /sec.
>How could this be debug? I don't see other place to request for help
>other than this one, and I was adviced to ask for help here too.

Try attaching qdiscs (sfp/pfifo/bfifo) below each htb class. Please
send some more information (tc script, scenario, result of "tc -s -d
class sh dev XXX" command).

Regards,
Marek Kierdelewicz
