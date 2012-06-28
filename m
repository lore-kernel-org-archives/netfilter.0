From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: general question about DNAT-rule
Date: Thu, 28 Jun 2012 17:37:41 -0400
Message-ID: <1340919461.3336.373.camel@denise.theartistscloset.com>
References: <zarafa.4fec9479.280e.5ab9092960b1b61e@zarafa.cubewerk.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <zarafa.4fec9479.280e.5ab9092960b1b61e@zarafa.cubewerk.int>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Bauer <stefan.bauer@cubewerk.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 2012-06-28 at 19:29 +0200, Stefan Bauer wrote:
> Dear Users,
> 
> please help me to understand the processing of packages when a DNAT-rule is setup.
> With DNAT on a Router the destination address is changed so a package with 
> SRC: 1.2.3 and DST 4.5.6 
> will become
> SRC: 1.2.3 and DST 7.8.9
> 
> If the receiver answers it is
> 
> SRC: 7.8.9 and DST 1.2.3
> 
> so if this packages is arriving on 1.2.3 it will get dropped as the sender was talking to 4.5.6 and not 7.8.9.
> 
> Now to my question - is a SNAT-rule mandatory on the Router or is there some other process of "reverse-NAT" the answer packages to the initial sender?
> 
> I want to understand what is happening with the packages and answer-packages in detail.
> 
> thank you in advance
<snip>
Hi, Stefan.  A pleasant surprise to see you here, too.  The nat table
will use conntrack.  Thus, netfilter will remember that the original
packet was addressed to 4.5.6 and rewrite the source address as 4.5.6
and not 7.8.9.

You would only need an SNAT rule if 7.8.9 was initiating and you wanted
its source address to be 4.5.6.

You will have to be careful about internal versus external name
resolution and which interfaces are doing NAT so you don't create a
problem where internal addresses cannot get to 7.8.9.  Good luck - John

