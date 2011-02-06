From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 17:02:09 +0000
Message-ID: <1297011729.1613.50.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
	 <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297011756; bh=ck9EXRXwEDT3Eu085+KLjoV2AX3E1mmxYut9E
	Dy4rlw=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=IAT8u8kE
	iwgwWVH39axGlzH3k1tmZA71/IpFNt2niog38Wn8Z5m85Sp7WAr0sjvgFi08asMzNeY
	bZu7MgLFZazFStjBT544OQZ9u20a3sQHUXzL3Rp7dtzgL4DLMyPD6oOYdfpeKS5QJo3
	mlBtQVs64whiZ2hAqpef1wzoC+6Jo=
In-Reply-To: <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-06 at 12:35 -0400, Optimum Wireless Services wrote:
> > 
> > I think that you should forget the per-user stuff as per my other email
> > and classify traffic. Just my personal opinion - I'd be interested to
> > hear what others think.
> 
> I just need a way that would allow users to experience a reliable
> connection that would always be 15% +- the contracted bandwidth.
> 

You could buy some more upstream bandwidth ;-)

Have you tried the scripts that Marek posted? That's your answer to
limit per user.

> This turned to be more complicated than what I first thought. 
> 
> After adding the new ruleset, I added this little script to try to
> prioritize some traffic, just installed it so, don't know yet how would
> traffic behave:

<snip>

Herein lies your problem. If you want to prioritise traffic *and* limit
per user, then it starts to get complicated. The rules that you posted
will indeed rate limit different types of traffic, but you would need to
do these in conjunction with your other HTB rules for the different
users.

So you would need separate classes for users and traffic type. They'd
have to be parents/children of each other, but which way round and how
you would do it I do not know.

All I'm saying is that you need to take this one step at a time. Getting
a magic solution that does everything is not going to happen straight
away (unless somebody tells me otherwise).

So, try the per user stuff on its own first. Maybe try the traffic
prioritisation on its own as well. Check the results and take it from
there.

BTW - I don't think the traffic prioritisation scripts you posted will
have much affect anyway: they are only really looking at DNS lookups and
SSH, which isn't going to solve your problems.

Andy


