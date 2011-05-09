From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 09 May 2011 22:45:33 +0100
Message-ID: <1304977533.1921.305.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304977535; bh=F9syGFrl1rzo11bPZNr0guT0KWjzFWuDhf7oG
	DK9icw=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=ZgQJAM7X
	t8Wqq5cnVQXCXQEPTet8CEtmCHmiVXntu+MoR8TaDx9IT+nw4UF4rBjIRHBLYDW1Pkb
	94DP0Qh532L4rn2umO5YwKsT7YloiN7GjESADhu7FAH+PzrIzsAFaOOdyLVwQfBA/L2
	GGhCsV3r1tupkvN/sM/QERxqy1YjM=
In-Reply-To: <4DC7F632.9020105@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Mon, 2011-05-09 at 15:12 +0100, Ed W wrote:
> Hi, I have a slightly peculiar requirement to track very accurate *per
> user* traffic for a small remote userbase.  The internet connections
> these users have available will be one or more of: a) circuit switched
> satellite phone (ie per second billing), data volume billed (ie GPRS
> style) satellite phone or a 3G cell phone - all of these will have non
> trivial bandwidth costs and we want to attribute very exact costs back
> on a per user basis.
> 
> To do this I'm using a small custom built embedded router, and we will
> use some form of 802.11x or captive portal style user authentication but
> I have two areas I need advice on solving:
> 
> 1) Best way to do per user traffic accounting *per* internet gateway. ie
> each gateway will have quite radically different costs to run and so we
> need to also count traffic per route.  My current thinking is to use
> packet marking to choose the route and my tests suggest that I can
> pickup this mark via conntrack and therefore account using ulogd/pmacct
> or similar?  Anyone got any thoughts on other ways to slice this or
> anything I am missing?

That sounds good. Using marks is a pretty flexible way of achieving most
things. I don't think I fully understand your setup though without a
diagram. How are you identifying individual users within each route? By
IP address?

> 2) How to account for traffic passing through a "proxy".  eg I want to
> run a local DNS resolver, but try to match the external DNS traffic back
> to the user that caused it?

Obviously if you just want to know what traffic is going to/from an IP
address, then you can use the INPUT/OUTPUT chains rather than the
FORWARD chain. I assume that it is not that simple though.

>  I think I could probably modify the code of
> a suitable resolver to apply a packet mark to upstream data, but I
> wasn't able to find how to apply "marks" from userspace applications
> from a quick google - can someone point me to a reference?

Not sure of a reference, but you can use:

setsockopt(fd, SOL_SOCKET, SO_MARK, ...)

Contact the netfilter-dev list for more advice on that.

>   Does anyone
> have any other ideas on how I might do this?  I will also use a couple
> of other proxies for http (probably Squid) and email traffic - will need
> to apply a similar solution there (perhaps TPROXY with squid?)

I wrote a similar patch for Squid (released in V3.2), which allows
packets to be marked before Squid, and Squid to reapply the mark on
retransmission. Marks can also be applied for locally cached files. If
it helps the patch is at:

http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925

Andy


