From: Mike Mestnik <cheako911@yahoo.com>
Subject: Re: I found what I was looking for l7-filter.sf.net.
Date: Sun, 15 Feb 2004 18:47:48 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040216024748.5228.qmail@web11908.mail.yahoo.com>
References: <Pine.LNX.4.60.0402151740250.2096@dsl093-017-216.msp1.dsl.speakeasy.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0402151740250.2096@dsl093-017-216.msp1.dsl.speakeasy.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Strait <quadong@users.sourceforge.net>, Harald Welte <laforge@netfilter.org>
Cc: Mike Mestnik <cheako911@yahoo.com>, "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>, l7-filter-developers@lists.sourceforge.net

There are alot of ppl working on this it's good to see activity like this.

--- Matthew Strait <quadong@users.sourceforge.net> wrote:
> > - I can't see any locking in your code, and I don't think it's SMP safe
> 
> I'm not experienced in this.  Could you point me at some docs or examples
> of how to do this?
> 
Documentation/spinlocks.txt describes how/why/when.  I have some non linux related experience with
this.  Basically if you do a ctr++;(on 2 CPUs) there is a read and write if one CPU reads 5 the
other CPU needs to wait for the first to write 6 to memory or you will get 6 not 7.

> > - Did you consider basing your work on top of libqsearch?
> >   (http://www.cartel-securite.fr/pbiondi/libqsearch.html)
> 
> I actually hadn't heard of that before.  I've now looked at the
> documentation for it, but I'm still not clear on whether it does regular
> expressions out of the box, or whether we'd have to graft that on.  Given
> that I'd rather our patch not be dependent on another patch, I think I'll
> stick to the way we do it now unless that's a major barrier to getting
> included in patch-o-matic.
> 
Looks cool, I'd be interested in seeing this implemented just for the benchmarks.  It looks like
it precompiles the expressions, so I guess any input could be used with the correct ?user space?
interpretor.

> Thanks for the critique.
Thanks for l7.
> 
> -Matthew
-Mike

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

