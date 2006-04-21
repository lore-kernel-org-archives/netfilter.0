From: "Nick Warne" <nick.warne@gmail.com>
Subject: Re: iptables is complaining with bogus unknown error 18446744073709551615
Date: Fri, 21 Apr 2006 19:26:31 +0100
Message-ID: <7c3341450604211126g7e431307q251f9ea49c0ebf91@mail.gmail.com>
References: <a06230910c06e2510acfa@129.98.90.227> <20060421111530.GE5286@rama>
	 <a06230913c06e96f75f32@129.98.90.227>
Reply-To: nick@linicks.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932302AbWDUS0f@vger.kernel.org>
In-Reply-To: <a06230913c06e96f75f32@129.98.90.227>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maurice Volaski <mvolaski@aecom.yu.edu>
Cc: Harald Welte <laforge@netfilter.org>, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

I also ask the same - this 'config' problem/option has been posted on
the list previously, I believe.

I was about to update my gateway box to 2.6.16.9 this weekend, and I
do not build modules on that - so what do I need to do to ensure this
xt_tcpudp is built in?

Is '> make oldconfig' enough to pull this in?

Nick

On 21/04/06, Maurice Volaski <mvolaski@aecom.yu.edu> wrote:
> Thank you for your reply.
>
> >Hi Maurice.
> >
> >Didn't you report this bug already to bugzilla.netfilter.org (and maybe
> >eben to the bugme.osdl.org)?  Reporting a bug in three distinct places,
> >even though it has been replied to at one place is not really going to
> >use developer resources efficiently, don't you think?
>
> Sorry, to post it multiple times. Actually, two places netfilter and
> then kernel bugzilla. I made the second report after it appeared
> there'd would be no feedback to the first one and another kernel
> revision had been issued with the problem still evident. (The first
> feedback on the netfilter report crossed in the mail with the kernel
> report.)
>
> >However, your problem seems to be something different.  I suspect that
> >all rules with '-p tcp' or '-p udp' don't work, whereas others do.  You
> >seem to be missing the xt_tcpudp.ko module, which implements that
> >feature in 2.6.17-rcX kernels.
>
> Yep, that's it. How could one know that there is such a module called
> xt_tcpudp.ko, especially since there is no corresponding config
> option? Wouldn't up-to-date and complete documentation explain how to
> set up the kernel config and indicate which modules should be loaded?
>
> On the other hand, shouldn't this module be loading automatically?
> --
>
> Maurice Volaski, mvolaski@aecom.yu.edu
> Computing Support, Rose F. Kennedy Center
> Albert Einstein College of Medicine of Yeshiva University
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
