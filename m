From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 18:20:16 +0000
Message-ID: <1329502816.30413.28.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop>
	 <op.v9saw7z7x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v9saw7z7x1lyi3@debiandesk2.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329502820;
	bh=xe6KM6UoiMdTGi0tgjnLi6cCz61UdxO2m5hakHieA+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=JKZ2zMQhhba2Va4bZ6daaPCSzk2ZPJsOO34JQLI7MPSL8u2kzUlqKu5AujSA5nuoO
	 gCly2jCzn9p8mLYUxkuzOppblItBXDGKSXAdQQq0T68EGhGSpBTdCTw4sTGeK0cSCQ
	 jgfjA+0xKZgXTdFl62qVukx9sB0s5VeKxfMfHBew=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "Rob Sterenborg (lists)" <lists@sterenborg.info>, "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On Thu, 2012-02-16 at 12:28 -0600, Lloyd Standish wrote:
> Andy, your setup looks very good.  I am interested in using a similar
> system to limit bittorrent.  However, I cannot use rate-limiting, since
> each user (LAN host) is already rate-limited in his or her router, and
> the rates of each user vary somewhat.  It's possible to move the
> rate-limiting from the radios to the router, but I want to avoid
> maintaining a class and filters for each user.
> 
> To clarify, all users of our small ISP (including me) are members of a
> wireless LAN.  We have radios in our houses which connect us to the
> ISP's radio located on a distant radio tower.  The radios in our homes
> do rate-limiting.  The wireless signal from these home radios is
> transmitted via a wireless bridge to a single Linux router about 40
> miles away.  I administer that router.  It has several small uplinks,
> and the router code does load-balancing over them.  Effectively, all
> this is equivalent to a simple LAN directly connected to a netfilter
> load-balancing router.
> 
> It seems to me that instead of rate-limiting in order to control
> bittorrent, I could instead simply prioritize via the QOS marker.  Any
> traffic detected as bittorent would get the lowest priority.  Do you
> think this would give satisfactory results?

Interesting use-case. There's 2 different aspects to this:

1. Using PRIO to prioritise. I don't see why that wouldn't work, using 1
class for bittorrent and 1 class for everything else. In general though,
it's recommended to use something slightly less brutal. I've had very
good results doing similar things with HTB. The bonus is that you get a
lot more flexibility.

2. Doing the prioritisation elsewhere to the rate limiting. This doesn't
work, as you can only prioritise when you have too much traffic,
otherwise all the packets just pass straight through. So, if you were to
do this, you'd have to force a queue at your router, probably by
rate-limiting (maybe with HTB as above). This is the same as when you
traffic shape inbound traffic - you have to rate-limit to a slower speed
than the uplink to force a queue. I'm struggling to get my head around
this properly, so am not sure whether that could also work somehow with
rate-limiting at the user's radio.

Andy


