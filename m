From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 16:13:46 +0000
Message-ID: <1297008826.1613.22.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus> <4D4C0B8F.10005@unipex.it>
	 <20110205155829.3a5ebc7b@catus>  <1296923860.1695.20.camel@andybev>
	 <1296958325.3695.15.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297008842; bh=x4fUtGGwiV9x/FRsXbTSkP3J6ED7jPciPzi9u
	D7P1W4=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=VPH1heSE
	g/cWDcJpA2dyt10ky/U9mKeyTWPYM2mqfokV4Wtv7/HcxFyVqjOf0K9iwcG7WhTeUM+
	JvS/OyLf8Ew5oYm+ekaCPlP8fGi9aHk/7JJ/lXAxx+LEymdOhXMpQmN3+VJfaB4m+xD
	r2ZjshvCVsLed82IniuJMiKyblU/8=
In-Reply-To: <1296958325.3695.15.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: Marek Kierdelewicz <marek@piasta.pl>, Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org

On Sat, 2011-02-05 at 22:12 -0400, Optimum Wireless Services wrote:
> Thank you all for replying and sorry for the late reply.

No problem.

> > Optimum Wireless Services - what is your aim? Do you really want to
> > limit bandwidth per user, or do you instead want to provide each user
> > with a fair share of bandwidth and fast internet access? If it is the
> > latter, you are better to not mark per user, but instead mark the
> > traffic type and use tc's hash functionality to share the bandwidth
> > between client IP address, rather than the default which is per
> > connection.
> > 
> 
> What I would love to do is offer "fast internet access" and at the same
> time sell packages to users: 512/128, 768/256, 1024/512, etc...

Well it is probably possible to achieve this, but I'd be tempted to say
that it's a little ambitious in your circumstances, given that you are
limited to a 15Mbps line.

>  If an
> user has a specific package, I would like this user to have a nice
> internet experience with low pings, and little lagging and not
> 'interfere' with the other users (might be impossible). 
> 
> So, what I'm trying to do is not have issues with one user hogging our
> internet line.

Okay... well I'd recommend forgetting the different speeds per user to
keep things simpler, and instead concentrate on classifying your traffic
to offer *everyone* a fast experience.

> 
> Dont know how a fair share bandwidth might work on our network since I
> have some users downloading p2p all day long. 

There's various ways of classifying P2P: OpenDPI and L7-filter being 2
of them. However, I personally just use connlimit and ipset to look for
lots of connection to high port numbers. It probably wrongly classifies
some traffic, but I haven't had any complaints so far :)

> 
> I've noticed that at peak times (7pm - 11pm) our internet service is so
> slow I'm embarrassed to even say. 

There's your answer - you need to classify traffic. Even if you limit
everyone to, say, 1Mbps, you only need more than 15 users for it to slow
down again.

> Also, another thing I noticed (this one not time specific) when running
> iptraf is that my external interface measures almost our max/total
> bandwidth of 15Mbps and our internal interface is only at 4Mbps. So,
> that tells me that not much is passing through squid or there are some
> big time downloading going on.

Or that your tc setup is wrong... Did you try tc-viewer?

> 
> So, to tell you the truth I don't know which way to go if limit bw per
> user or what. I'm just trying to keep our network running as smooth as
> possible.

Okay, well I've used a solution based on Jesper Dangaard Brouer's
excellent ADSL-Optimizer project. I classify traffic as: low-latency (eg
SSH), general (web, email), bulk (large downloads), other, and P2P. Each
of these are marked accordingly and then filtered into HTB.

I've started to document my stuff at
http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux
but haven't finished yet. If you give me a couple of weeks I'll try and
get it updated.

Andy


