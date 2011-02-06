From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 19:31:42 -0400
Message-ID: <1297035102.3928.28.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>  <20110206174446.6abdcf58@catus>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110206174446.6abdcf58@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

On Sun, 2011-02-06 at 17:44 +0100, Marek Kierdelewicz wrote:
> >> I have 120 users now but, that number should be increasing. Which
> >> method do you recommend?
> >I think that you should forget the per-user stuff as per my other email
> >and classify traffic. Just my personal opinion - I'd be interested to
> >hear what others think.
> 
> Well. It all depends on the bussiness constrains. Per-user shaping is
> sometimes necessary while it's definitely more complex and
> resource-consuming. My personal opinion - with >100 users shaping rules
> should be script-generated instead of written by hand.
> 

I don't know which is the best solution for a WISP, since it would be
adding and deleting customers regularly. Per-user shaping might be
necessary for most ISPs, I think, because they sell different plans for
different necesities.

I think batch rules should be script-generated and deleted as customers
come and go.


> Best regards,
> Marek Kierdelewicz

