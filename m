From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: condition patch with kernel 2.6.16
Date: Mon, 24 Apr 2006 12:38:28 -0400
Message-ID: <smvp42dtpur554sj6spi7kshm4nv886nf6@4ax.com>
References: <iurp42dko5m7g69adrioode1kptovoqlps@4ax.com>
	<200604241823.02998.max@nucleus.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

> On Monday 24 April 2006 5:40 pm, Andrew Schulman wrote:
> 
> > I've been successfully using the condition patch with 2.6-series kernels,
> > up through kernel 2.6.15.  It was simple to make it work:  I just removed
> > the line 'Requires: linux < 2.6.0' from the condition/info file, and then
> > the patch applied and worked just fine.
> 
> I did too and it worked, but on closer inspection of the code I saw that it 
> worked by chance.

OK, that's good to know.

> > Now I'm trying to do the same with kernel 2.6.16, and the patch fails:
> >
> > # ./runme --kernel-path=/usr/src/linux
> > --iptables-path=/usr/src/netfilter/iptables-1.3.1 --batch condition
> 
> 2.6.16 needs some minor changes on a few function declarations, anyway I just 
> finished a more extensive rework of the code so that it's really supposed to 
> work for 2.6. Stephane (the original author) told me he never had the time to 
> update it and was glad to hand it down to some else.

OK, that's very good.  I'll be glad to test it.  I need to upgrade to kernel
2.6.16 to try to solve some other problems, and right now the condition
patch is holding me back.  I could rewrite my firewall without it, but I'd
rather just have a working condition patch.

> > The condition patch seems like a very important and useful one, and simple
> > in principle.  2.6 kernels have been in production use for well over a
> > year. Is "condition" ever going to be definitively ported to 2.6?
> 
> There are different views on its usufulness. I agree with you, but other 
> people think that influencing packet filtering from /proc is a hack.
> I can see their argument, but think the alternatives are worse.

Well I wasn't aware of that argument.  I think the condition functionality
is sensible and useful.  When a condition value changes, I have a choice of
either (1) cleaning out and rebuilding my whole firewall; (2) finding and
changing the specific affected iptables rules; or (3) changing a value in
/proc/net/ipt_condition.  Of these I find (3) to be the most convenient and
natural.

Thanks, Andrew.


