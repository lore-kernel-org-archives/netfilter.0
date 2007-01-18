From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Filtering in PREROUTING
Date: Thu, 18 Jan 2007 08:25:07 -0600
Message-ID: <45AF8343.7000006@riverviewtech.net>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169069905.10134.18.camel@len.t-t-l.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

george wrote:
> I've seen a few places telling me that you shouldn't filter in the
> mangle table.  However, it seems sensible to me to drop junk packets in
> PREROUTING rather than have to duplicate those rules in both INPUT and
> FORWARD.

Rather than taking an absolutely closed minded approach and trying to 
convince you that I disagree and why, I'll ask this:

Are your (any one posting to this thread) statements based on things you 
your self have experienced, or been told, or seen others experience, or 
are they based on theory by the fact that you could improve efficiency 
by filtering in the very first possible place?

What sort of system(s) are you using for your firewalls / routers?
What sort of bandwidth are they filtering?
How many rules are in your rule set(s)?

I ask, because I'd like to hear constructive discussion on both sides of 
the fence.

I personally have always done my filtering in the filter table.  I can 
also say that I have never had a system even come close to weakening 
under load.  Granted most of my firewalls / routers are 233 MHz - 1 GHz 
systems (what ever is laying around) with at least a quarter gig of 
memory.  I'm also only filtering / firewalling for SOHO (DSL / Cable) or 
possibly a 10 / 100 network between subnets.  I have had one system that 
was filtering a full bleat 100 BaseT network and it never showed any 
signs of failure or even slow down.

That being said, I could see why you might want to filter in 
mangle:PREROUTING on a 486 with 16 MB RAM.

Thoughts / opinions / comments / critiques  are welcomed and encouraged.



Grant. . . .

