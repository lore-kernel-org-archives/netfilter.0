From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Wed, 05 Nov 2008 11:31:10 -0600
Message-ID: <4911D85E.2080109@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <49119087.5060307@thehaxbys.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49119087.5060307@thehaxbys.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/05/08 06:24, John Haxby wrote:
> Perhaps the problem is that the good people on this list know just 
> too much about the finer points of routing and the caveats and 
> wrinkles that you occasionally need to avoid special purpose 
> problems.

*nod* (guilty) *nod*

> For the most part, though, it's actually quite simple.   And I know 
> that some of the things I will say are wrong in some cases and I 
> would hope that someone will explain to me where they're wrong and 
> maybe we'll all be enlightened.

I don't see any thing wrong with what you have said.  I might have used 
different wording, but we are two different humans.  :)

<snip>

I do have a quick comment to add about the routing table though.  The 
routing table is ordered with the most specific match first (what you 
were getting at by the number of zeros).  So when the routing table is 
searched, the first route to be found, the most specific one, is the 
proper one.  The reason you might have a more specific route and a less 
specific route is if you have a fast high latency satellite connection 
to and a slow low latency dial up or leased line connection back to 
corporate.  You would want the bulk of (non interactive) traffic to go 
through the faster high latency connection for most things but still 
have smaller interactive (think terminal type) traffic go over the 
slower lower latency dial up / leased line.  To be able to do this you 
would put the destination server equipment for the interactive traffic 
be in a smaller ""special part of the larger address range.  Then you 
tell the router that it has access to the smaller range over the dial up 
and the rest of the address range across the satellite.

The more specific routes can be used to override less specific routes.

> Does that help or has it left you even more confused?

I'm guessing that it left Daniel with more to think about and to 
formulate more questions.  Which is in and of it self a good thing as 
that is the normal process of learning.  :)



Grant. . . .
