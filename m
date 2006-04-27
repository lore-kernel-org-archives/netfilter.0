From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: CONFIG_KMOD in x86_64/defconfig (was Re: iptables is
	complaining with bogus unknown error 18446744073709551615)
Date: Thu, 27 Apr 2006 22:01:57 +0200
Message-ID: <1146168118.2894.44.camel@laptopd505.fenrus.org>
References: <200604210738.k3L7cBGO010103@mailgw.aecom.yu.edu>
	 <a06230901c075ca078b8d@[129.98.90.227]> <20060427135119.GB5177@rama>
	 <a06230904c07687df0a33@[129.98.90.227]>  <20060427192430.GE21823@rama>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030204AbWD0UCM@vger.kernel.org>
In-Reply-To: <20060427192430.GE21823@rama>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Harald Welte <laforge@netfilter.org>
Cc: Maurice Volaski <mvolaski@aecom.yu.edu>, netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

On Thu, 2006-04-27 at 16:24 -0300, Harald Welte wrote:
> On Thu, Apr 27, 2006 at 11:41:40AM -0400, Maurice Volaski wrote:
> > >On Wed, Apr 26, 2006 at 09:12:38PM -0400, Maurice Volaski wrote:
> > >> Automatic kernel module loading! That is an option and it's off by
> > >> default. When it's off, attempts to load kernel modules are ignored
> > >> internally, and that's why iptables was failing. It tried to load
> > >> xt_tcpudp, but was ignored by the kernel.
> > >What do you mean by "it's an option" and "is off by default".  I would
> > >claim that any major linux distribution that I've seen in the last ten
> > >years has support for module auto loading (enabled by default).
> > 
> > Distribution vendors are free to change it to whatever they want, I guess, but it's OFF by 
> > default in the official kernel (.config).
> 
> apparently architecture-specific:
> 
> grep KMOD arch/i386/defconfig
> CONFIG_KMOD=y
> 
> grep KMOD arch/x86_64/defconfig
> CONFIG_KMOD is not set
> 
> don't know why x86_64 turns it off by default.  the help message says
> 'if unsure, say Y' (which makes sense!)


also defconfig is really irrelevant... you should look at what the
Kconfig has to say
