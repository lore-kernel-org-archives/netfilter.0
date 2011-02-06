From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 16:15:53 +0000
Message-ID: <1297008953.1613.24.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297008965; bh=+hHIDss7wL7x4KplQ2iHnHvsa04uAkDTfiMcl
	dWO7fc=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=EpbBQo5x
	0L9Ww1IhvWUjemgNIVoFl9cAZ6ae3bHbPea4uutaoQHnEEY85ZPuFSwLXWQ4dzmz+Xd
	FeKh4t6FfCeakJbVSxFXGLobvAkHmoWJ9T2uTtdM+XjYRGDcZnvKKkzeQ1MwTf0VI4w
	6c41uz/c/x5Qg/Qn1qNHLJz8AfzhY=
In-Reply-To: <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org

On Sat, 2011-02-05 at 22:14 -0400, Optimum Wireless Services wrote:
> On Sat, 2011-02-05 at 12:27 +0000, Andrew Beverley wrote:
> > On Sat, 2011-02-05 at 02:07 -0400, Optimum Wireless Services wrote:
> > > Now, for the upload I cant get it shape with squid running in the
> > > middle. If I remove squid then, traffic shaping works ok.
> > > 
> > 
> > If you are doing egress shaping on the internet facing interface for the
> > upload (which I assume you are - you can't use HTB on ingress), then it
> > will not work for Squid. That's because Squid's traffic leaving the
> > server is coming from the server's IP address, not from the client's IP
> > address (Squid is generating the traffic, not the client). Therefore,
> > your filter will never match the traffic. Normal traffic from a client
> > is forwarded and retains its source IP address.
> > 
> 
> Do you think I should go back to this method?
> 
> I have 120 users now but, that number should be increasing. Which method
> do you recommend?

I think that you should forget the per-user stuff as per my other email
and classify traffic. Just my personal opinion - I'd be interested to
hear what others think.

Andy


