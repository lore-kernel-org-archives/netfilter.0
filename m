From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 08 Nov 2007 16:23:05 -0600
Message-ID: <47338C49.7070102@riverviewtech.net>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>	 <1194559495.19115.105.camel@grateful.d.umn.edu> <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/08/07 16:17, Bradley Kite wrote:
> Linux machine has eth1, 192.168.1.50/30, connected to a router
> (192.168.1.49/30). Behind this router are many other networks/subnets.
> I'm trying to get the linux box to NAT all of them, not just addresses
> within this tiny /30 subnet (as is the case now).

This should not be a problem.  Unless .... (See below.)

> Hmm. The pre-routing couters are increasing, but that is all. When I
> ping from the router then the post-routing counters increase (because
> its directly connected).

Ok...

> This was my assumption too but I must be missing something.

Could this by chance be a reverse path filtering issue?  Is it possible 
that the firewall is not allowing the traffic from the non directly 
connected /30 to go through.

If you look at the counters in the filter:FORWARD chain do you see the 
traffic passing or is it even making it that far?



Grant. . . .
