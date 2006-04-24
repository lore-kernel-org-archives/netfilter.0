From: Massimiliano Hofer <max@nucleus.it>
Subject: Re: condition patch with kernel 2.6.16
Date: Mon, 24 Apr 2006 18:23:02 +0200
Message-ID: <200604241823.02998.max@nucleus.it>
References: <iurp42dko5m7g69adrioode1kptovoqlps@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <iurp42dko5m7g69adrioode1kptovoqlps@4ax.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Andrew Schulman <andrex@alumni.utexas.net>

On Monday 24 April 2006 5:40 pm, Andrew Schulman wrote:

> I've been successfully using the condition patch with 2.6-series kernels,
> up through kernel 2.6.15.  It was simple to make it work:  I just removed
> the line 'Requires: linux < 2.6.0' from the condition/info file, and then
> the patch applied and worked just fine.

I did too and it worked, but on closer inspection of the code I saw that it 
worked by chance.

> Now I'm trying to do the same with kernel 2.6.16, and the patch fails:
>
> # ./runme --kernel-path=/usr/src/linux
> --iptables-path=/usr/src/netfilter/iptables-1.3.1 --batch condition

2.6.16 needs some minor changes on a few function declarations, anyway I just 
finished a more extensive rework of the code so that it's really supposed to 
work for 2.6. Stephane (the original author) told me he never had the time to 
update it and was glad to hand it down to some else.

> The condition patch seems like a very important and useful one, and simple
> in principle.  2.6 kernels have been in production use for well over a
> year. Is "condition" ever going to be definitively ported to 2.6?

There are different views on its usufulness. I agree with you, but other 
people think that influencing packet filtering from /proc is a hack.
I can see their argument, but think the alternatives are worse.
Anyway this is mostly subjective, so I don't want to start a flame war or 
blame anyone. I'll set up a repository in a few days and it will be linked as 
an external project.
Meanwhile I'll send a copy of my latest patch to you privately. You are 
encouraged to test it.

-- 
Saluti,
   Massimiliano Hofer
        Nucleus

