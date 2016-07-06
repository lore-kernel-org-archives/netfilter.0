From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 15:13:40 -0400
Message-ID: <20160706151340.646b2093@playground>
References: <loom.20160705T084958-392@post.gmane.org>
	<f51a7158-07dc-ea52-6da0-17c3b659aa97@gmail.com>
	<20160706142100.GA30556@Mail.DDoS-Mitigator.net>
	<6a0dd625-fe5a-d3df-bf33-75a39613fa5b@gmail.com>
	<20160706174540.GA610@Mail.DDoS-Mitigator.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u66JDhRM007714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1467832423; i=@wpi.edu;
	bh=BagldsfvjUD9/aG0VW3tiUl70JHGCJEChzTNr9hHZl4=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=E80KkJ1JhxQQfRtbucXoibTYr8/hG9cUtrf1f8dDjFFdYFmpwI0GaPuk5QZ20trqv
	 glgpWtE0PyPihsD59HMoWiGmfiqPf2nbKIAC+ARRzENfkBsGsJPNSqcy6PVfh7PdjZ
	 O16aOjWCRiuvNJ5fD92Ac+uy6+Aq5A6KNfyna1EY=
In-Reply-To: <20160706174540.GA610@Mail.DDoS-Mitigator.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 6 Jul 2016 10:45:40 -0700
alvin.ml@Mail.DDoS-Mitigator.net wrote:

> 
> hi antonio
> 
> On 07/06/16 at 05:36pm, Antonio Prado wrote:
> > 
> > at BGP level, when an AS is DDoSed with a 10Gbps rate (or maybe more),
> 
> 10Gbps ( bits/sec ) is not that big of an ISP but still not ez to DDoS
> 
> it seems, some of the ISPs like to use RTBH for DDoS mitigation, but,
> that'd still imply they received the DDoS packets in order that they
> can /dev/null it ...
> 
> i wonder why they don't traceroute back to the original attacker
> and have the local law enforcement come knocking on the door ..
> i ISP know where all the packets is coming from that they in turn 
> fwd to the next hop

Because it's distributed. Mayhap they send bad packets 'from' your IP to servers around the world, and those servers reply to your IP; this type of DDoS could be mostly prevented by ISPs rejecting packets that could not have originated from their networks. Mayhap they use a 'bot farm.

The only real positive action one can take is to drop, without logging, INVALID packets as early as possible: in the first rule in mangle:PREROUTING. They are not, and cannot be, associated with a valid conn, cannot be sent anywhere and, thus should be dropped as soon as they are identified as INVALID. (In fact, there ought to be a netfilter /proc or /sys control to do this, akin to the 'drop ICMP ECHO packets' control.) NEW packets can be rate-limited, perhaps to 100%-200% of normal expected traffic. Outside that, the only recourse is to ask the upstream provider to rate-limit downlink data to you until the DDoS subsides; this will only reduce the load on your server and free up some bandwidth.

Years ago, I was asked to put a load on a web server (vBulletin); the admin was tracking down a problem. With a mere 3Mb/s uplink, I was able to bring the server to its knees using my Debian desktop system. It doesn't necessarily take much to DDoS a system; there was a popular firewall system on which bootup and shutdown could be delayed (or frozen) with a mere 51k byte/s traffic load on any interface.
