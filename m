From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 19:27:25 -0400
Message-ID: <1297034845.3928.23.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
	 <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
	 <1297011729.1613.50.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297011729.1613.50.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Thanks again for replying.

On Sun, 2011-02-06 at 17:02 +0000, Andrew Beverley wrote:
> On Sun, 2011-02-06 at 12:35 -0400, Optimum Wireless Services wrote:
> > > 
> > > I think that you should forget the per-user stuff as per my other email
> > > and classify traffic. Just my personal opinion - I'd be interested to
> > > hear what others think.
> > 
> > I just need a way that would allow users to experience a reliable
> > connection that would always be 15% +- the contracted bandwidth.
> > 
> 
> You could buy some more upstream bandwidth ;-)

I wish we could buy more bandwidth but, is extremely expensive where I'm
at (Dominican Republic).

> 
> Have you tried the scripts that Marek posted? That's your answer to
> limit per user.

Havent tried that script yet, will be doing so, later tonight or
tomorrow.

> 
> > This turned to be more complicated than what I first thought. 
> > 
> > After adding the new ruleset, I added this little script to try to
> > prioritize some traffic, just installed it so, don't know yet how would
> > traffic behave:
> 
> <snip>
> 
> Herein lies your problem. If you want to prioritise traffic *and* limit
> per user, then it starts to get complicated. The rules that you posted
> will indeed rate limit different types of traffic, but you would need to
> do these in conjunction with your other HTB rules for the different
> users.
> 

I just added those prioritising rules so, I will be removing them
immediately. Is hard to really notice how the ruleset are working since
there isn't an utility that can graph or show the actual traffic. I was
looking for tc-viewer but, can't find a link where to download it from.

> So you would need separate classes for users and traffic type. They'd
> have to be parents/children of each other, but which way round and how
> you would do it I do not know.
> 

I figured I added the prio rules to the same parent rule I already had.
Thought that was the correct way to do it. So, I should create another
parent rule for ie; 3, and add the children under that to do traffic
prioritizing.


> All I'm saying is that you need to take this one step at a time. Getting
> a magic solution that does everything is not going to happen straight
> away (unless somebody tells me otherwise).

I agree with you.

> 
> So, try the per user stuff on its own first. Maybe try the traffic
> prioritisation on its own as well. Check the results and take it from
> there.
> 
> BTW - I don't think the traffic prioritisation scripts you posted will
> have much affect anyway: they are only really looking at DNS lookups and
> SSH, which isn't going to solve your problems.
> 

I wanted to speed up dns lookups, icmps, SYN ACK flags, and ssh, for now
and later on add voip since I have an asterisk server on our network as
well.

I will remove the prioritising script and leave the last created ruleset
and see how things behave.

> Andy
> 
> 

