From: Andrew Beverley <andy@andybev.com>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Sun, 20 Nov 2011 13:46:19 +0000
Message-ID: <1321796779.2382.956.camel@andybev-desktop>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
	 <1321480803.2382.62.camel@andybev-desktop>
	 <op.v419zu1bx1lyi3@debiandesk2.net>  <op.v42q5wazx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321796779;
	bh=dmna0t9hIipIDL53qbbhSx8P+vjELkTewxwCDNLA02c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=LPGLNt/X7MNpVxZ9Ys/kY2meQxmLn9N9hqegfn7YciB38XDaeg650MV2IBY/AArg9
	 nF0VwwXVeKWefnUQtU4u3ZG9GtYfxwdGZ9e8L6IYUu5muCNWS9kGErkbs7sjYM5Gwa
	 2HV2RVHkzOyI248PlIoPv3ITvpsTHLiiL6xeXq7o=
In-Reply-To: <op.v42q5wazx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Wed, 2011-11-16 at 23:06 -0600, Lloyd Standish wrote:
> I was under the impression that one could define an HTB qdisc, then set
>  up bandwidth classes for of it, then use u32 filters matching on LAN
>  IP numbers to assign the flows for several IPs to the same HTB class. 
>  I tried that and found that the total bandwidth of the class is shared
>  among the connections, which is not what I wanted or expected!
> 
> Apparently for bandwidth-limiting to work there needs to be a HTB class
>  declared for *each* user IP number!  This certainly makes sense if the
>  sum of classes' rates should total the rate of the containing HTB.
> 
> Andy, you wrote:
> "My personal opinion is that you shouldn't limit per user. You should
> instead prioritise traffic properly. This way you'll have a lot less
> classes and a lot less overhead."
> 
> Now I understand what you mean by "a lot less classes"!
> 
> Unless someone corrects me, I will assume that there is no way to use
>  filters to assign several "flows" (by user IP) to the same class, such
>  that each flow gets the class's full configured rate.

No, I don't think there is any other way. You can use the "flow"
parameter to balance per user IP within a class, but you won't be able
to use that to hard-limit to a particular bandwidth for the IP, just the
overall rate limit of the class:

$TC filter add dev eth0 parent 30: protocol ip \
        handle 1 flow hash keys dst divisor 1024

> This leads me to another question: Consider the case where there are 50
>  users, each with 1 Mbit download rate, but statistics show that all 50
>  *never* require the full bandwidth, and that a total 35 Mbit total
>  connection rate is sufficient.  Should in this case the HTB qdisc be
>  configured to have total 35 Mbit (or slightly less), even though the
>  sum of all classes' rates will be 50 Mbit?

The way to achieve this is to set a root limit of 35 Mbit, then make
sure that all the "rate" values add up to that. You can then set a
"ceil" value to allow the leaf classes to burst up to 1 Mbit.

> 
> This might answer my question, or it is an error on the lartc site:
> 
> http://lartc.org/howto/lartc.qdisc.classful.html#AEN903 shows an
>  example in which the sum of classes' rates is higher than the total
>  HTB qdisc rate:

I personally think that is a mistake. Everything I have read in the past
states that the leaf classes should add up to the total root rate.

Andy


