From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: A little question about the RATEEST target.
Date: Fri, 16 Oct 2009 13:17:07 +0200
Message-ID: <4AD85633.7050901@unipex.it>
References: <4AD4A58D.9010305@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD4A58D.9010305@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: whiplash <whiplash@bofhland.org>

whiplash wrote:
> Hi.

Hi,

> The simple question is: where are the results saved, actually? :)

If I read correctly the sources, into ram.

> In other words, is there any way to access and collect such data to
> pass them to some userspace tool, like rrdtool, for example?
> 

Like also you can read, there is no direct possibility... There is no
external (proc|sys) interfaces. May be if someone create a simple patch...

P.s. $KERNEL_SRC/net/netfilter/xt_rateest.c|xt_RATEEST.c

Michele
