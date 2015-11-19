From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: "raw" table versus "filter" table
Date: Wed, 18 Nov 2015 19:17:20 -0500
Message-ID: <20151118191720.007e3f79@playground>
References: <564CF1D6.9000709@digi-value.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU tAJ0HMg5018343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1447892242; i=@wpi.edu;
	bh=NDipM1FZc1bVx4GuaRbs7D3oSipj7bigZb5UOeKsh0A=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=dxuUB4Pw9LwmtgDOno9ibuOVRn8Yc4OIc6aVJi4rYb8v7CvsCWk0EQlOp+1YOVUz2
	 xgjp88c1auByXDVFwEDkPjrCcalfhZQkqERHV3F/LiEOt+BplZzEUcxQQtbo7LSsXd
	 xGkRstr3UiXoRPOSQEOOIskLjoEZI7fO9CxN5tIY=
In-Reply-To: <564CF1D6.9000709@digi-value.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 18 Nov 2015 22:47:02 +0100
David TAILLANDIER - DIGI VALUE <david.taillandier@digi-value.fr> wrote:

> 
> Hi,
> 
> according to the well-known netfilter schematic:
> http://inai.de/images/nf-packet-flow.png
> the "raw" table is processed before the "filter" table.
> 
> I tested it with some usual commands without problem:
>     iptables --table raw --append PREROUTING --source 1.2.3.4 --jump REJECT
>     iptables --table raw --append PREROUTING --in-interface lo --jump ACCEPT
> 
> - the packets are handled sooner, without the need to go though
>   conntrack+mangle+nat+routing. So less CPU/memory stress (and in turn
>   lightly compensated by the fact the iptable_raw module has to be
>   loaded ?)
> - only one rule in case the box is also a router (won't be ok for
>   every rules, obviously) because there is no need to add the same rule
>   for filter/forward
> 
> The documentations I found always describe the raw table to be used in
> strict cases. But none give even the smallest justification.
> 
> --> Is there any reasons not to use the raw table, apart dogmatic ones ?

Don't have an answer, but I'll have to look into 'raw' for Smoothwall Express. I'll use pert near *anything* that will reduce 'wasteful' CPU load. Combined with ipset, it should be possible to drop all packets to and from 'banned' public IPs using fewer CPU cycles. I already drop INVALID in mangle:PREROUTING. Dropping packets to and from banned addresses in raw:PREROUTING and rejecting packets to banned IPs in raw:OUTPUT would reduce unneeded processing. Of course, this idea depends on whether ipset can be used in the raw table.

One drawback is that NAT doesn't have a chance to re-address these packets. But this might not be too bad, since one doesn't want any traffic to or from banned IPs anyway.

Neal
