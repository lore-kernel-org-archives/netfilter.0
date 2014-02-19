From: Mark Fox <mark.fox@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 19 Feb 2014 02:34:22 +0000 (UTC)
Message-ID: <loom.20140219T022735-831@post.gmane.org>
References: <loom.20140218T183628-993@post.gmane.org> <5303B490.6070606@solutti.com.br> <loom.20140218T205158-486@post.gmane.org> <201402181710.01163.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Neal Murphy <neal.p.murphy <at> alum.wpi.edu> writes:

> Perhaps this will help.
> 
> [...]

It does. Especially this:

>  This allows
>  almost anyone, almost anywhere, to determine which services are available
>  on which systems, and to attack them (SQL attacks on RDBMS servers, SQL
>  injection attacks on web servers, &cet.) or to allow malware (viruses,
>  trojans, &cet.) to propagate through your private internetwork of LANs.

What I think I may have not made clear is that I'm not dealing with LANs
here. It's a single LAN, with everything thrown onto it. That's what threw
me for a loop. It's not fire-walling between networks. It's fire-walling to
and from the same network.

Perhaps I've made the mistake of spending most of my time thinking about
protecting hosts on one network from hosts on different networks, but not
much time thinking about hosts on the same network.

In any case, it seems pretty obvious that, given the all-eggs-in-one-basket
state of the network, really tight fire-walling is in order.

