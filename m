From: Matthew Strait <quadong@users.sourceforge.net>
Subject: Re: I found what I was looking for l7-filter.sf.net.
Date: Sun, 15 Feb 2004 17:46:10 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.60.0402151740250.2096@dsl093-017-216.msp1.dsl.speakeasy.net>
References: <20040209224943.27665.qmail@web11906.mail.yahoo.com>
 <20040215155502.GN15567@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040215155502.GN15567@sunbeam.de.gnumonks.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: Mike Mestnik <cheako911@yahoo.com>, "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>, l7-filter-developers@lists.sourceforge.net

> Although I'm not a fan of doing stuff like this inside the kernel, I
> think it is still a valid candidate for patch-o-matic (ng). However,
> this is up to the original software authors.

We would be interested in getting l7-filter into patch-o-matic-ng.

> - put all the new struct ip_conntrack members into a seperate
>   sub-structure (like the 'nat' and 'helper' substructures do)
> - think about type usage.  Use unsigned int for stuff like numpackets,
>   since it is not likely to become negative ;)
> - Adhere to CodingStyle (tab-width indent, ...)
> - Add sufficient GPL notices to every

Sure.

> - use arch-independent types in ipt_childlevel_info, or it will break
>   on sparc64 and other archs

I'm slightly confused here.  Other include/linux/netfilter_ipv4/ipt_*.h
files use "int" and "char", too.  However, if the Right Thing to do is to
use "u_int32_t" and "u_int8_t", I don't have a problem with that.

> - don't put regexp.c/ressub.c into linux/include/linux/regexp.  This
>   belongs together with the iptables module

Ok.  We put it there because we felt that it might be used by other parts
of the kernel someday, but either way is fine with me.  Is it ok to keep
the various regexp files together in net/ipv4/netfilter/regexp ?

> - Please decouple the 'childlevel' match and submit it seperately.  We
>   could even submit it to the kernel soon.

Ok.  I'll send that along shortly.

> - I can't see any locking in your code, and I don't think it's SMP safe

I'm not experienced in this.  Could you point me at some docs or examples
of how to do this?

> - Did you consider basing your work on top of libqsearch?
>   (http://www.cartel-securite.fr/pbiondi/libqsearch.html)

I actually hadn't heard of that before.  I've now looked at the
documentation for it, but I'm still not clear on whether it does regular
expressions out of the box, or whether we'd have to graft that on.  Given
that I'd rather our patch not be dependent on another patch, I think I'll
stick to the way we do it now unless that's a major barrier to getting
included in patch-o-matic.

Thanks for the critique.

-Matthew

