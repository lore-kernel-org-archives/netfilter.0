From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Tue, 08 Feb 2011 00:58:37 +0000
Message-ID: <1297126717.1742.36.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>  <20110206174446.6abdcf58@catus>
	 <1297035102.3928.28.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297126727; bh=9yqmNvkqA909FXmOfbrjW7Aa9xsoeXth8D/R2
	z1vRo4=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=pjJf0TNg
	n54cHzfv9O36kVGHT727I0KPwOQKvRhrAxjPtDPRoyHtX+tohuVAZxwuvCVFYDteMcU
	fxJud4Ac9/fEp9UCI2g+77FJoA3N1p6BFF6mWZq6i37IOQbZwkfeWPRFTSg2MSo7zk7
	+4A99Fvz2lfRE3Uz4W3js4uAJlSL4=
In-Reply-To: <1297035102.3928.28.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org

On Sun, 2011-02-06 at 19:31 -0400, Optimum Wireless Services wrote:
> On Sun, 2011-02-06 at 17:44 +0100, Marek Kierdelewicz wrote:
> > >> I have 120 users now but, that number should be increasing. Which
> > >> method do you recommend?
> > >I think that you should forget the per-user stuff as per my other email
> > >and classify traffic. Just my personal opinion - I'd be interested to
> > >hear what others think.
> > 
> > Well. It all depends on the bussiness constrains. Per-user shaping is
> > sometimes necessary while it's definitely more complex and
> > resource-consuming. My personal opinion - with >100 users shaping rules
> > should be script-generated instead of written by hand.
> > 
> 
> I don't know which is the best solution for a WISP, since it would be
> adding and deleting customers regularly. Per-user shaping might be
> necessary for most ISPs, I think, because they sell different plans for
> different necesities.
> 
> I think batch rules should be script-generated and deleted as customers
> come and go.

You could batch create, say, 200 leaf classes. Any that were unused
would just have their bandwidth shared between other customers, just as
if somebody turned their computer off.

Andy


