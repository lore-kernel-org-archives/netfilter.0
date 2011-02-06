From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 12:28:32 -0400
Message-ID: <1297009712.3928.5.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296909335.1695.14.camel@andybev>
	 <1296958657.3695.22.camel@debian-laptop.OptimumWireless>
	 <1297007648.1613.4.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297007648.1613.4.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-02-06 at 15:54 +0000, Andrew Beverley wrote:
> > Just wondering, I have a total of 15Mbps for our total bandwidth. If I
> > devide that into 512kbps then I can only have about 29 users at that
> > rate.
> 
> You could use HTB's "ceil" parameter for each leaf class to specify the
> max rate per user - that value can be anything up to and including the
> maximum rate of the root qdisc. It's the total of all the "rate"
> parameters of the leaf classes that should add up to the root's total.
> 

If I have users on different packages then how would I accomplish that?

> >  Don't know if I'm doing the math correctly but, how many users
> > should a 15Mbps line should serve without problems?
> 
> Well obviously it depends on what your users are doing, but I think
> 15Mbps should be fine for 2-300 users. I have a 4Mbps ADSL line shared
> between 150 users. It's not the fastest, but it works for general use,
> because bulk traffic gets classified at a lower priority than web
> browsing.
> 

I don't think we have a problem if all users use their connection for
general use. But, I can't tell users what to do and not do, if you know
what I mean. As mentioned earlier, I have user downloading p2p all day
long, there are others using voip, there are others that use it for
gaming, others chatting, etc... So, I thought if I limit users'
bandwidth to a certain amount that I could just have them use whatever
they're assigned and they can do whatever they want with that amount of
bandwidth.

> Andy
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

