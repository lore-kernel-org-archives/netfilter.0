From: Kerin Millar <kerframil@gmail.com>
Subject: Re: High ksoftirqd CPU load, high latency
Date: Fri, 02 Mar 2012 11:52:16 +0000
Message-ID: <jiqc9s$245$1@dough.gmane.org>
References: <4F50981E.8020107@allenta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F50981E.8020107@allenta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

On 02/03/2012 09:51, Roberto Suarez Soto wrote:
>      we've got a load problem in a firewall we administer, and we
> believe it could be related to iptables. But we don't know for sure, and
> don't know either how to confirm or deny it. I'm quite at a loss, and
> would like to get the list's opinion/ideas/voodoo magic/hints on the
> issue. Thanks in advance!
>
>      The symptoms are:
>
>      - High ksoftirqd load in one CPU (the one assigned to the LAN
> ethernet's IRQ)

For this issue, I've found that irqbalance works wonders. I recommend 
using version 1.0 or greater and running it as a daemon. To get the best 
out of it, I'd also recommend building a kernel with the following patch.

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=da8d1c8

The patch should apply cleanly to the 2.6.32 series. Here's an 
explanation as to why the patch is useful:-

https://code.google.com/p/irqbalance/source/detail?r=32a7757a0314

You can look at /proc/interrupts to determine whether your card supports 
multiqueue and is exposing distinct interrupts per tx/rx queue.

Cheers,

--Kerin

