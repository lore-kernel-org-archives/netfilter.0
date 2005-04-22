From: Jason Opperisano <opie@817west.com>
Subject: Re: DROP
Date: Fri, 22 Apr 2005 10:28:45 -0400
Message-ID: <20050422142845.GA4408@bender.817west.com>
References: <42634792.2070307@eccotours.dyndns.org>
	<20050418133542.GA15413@bender.817west.com>
	<426901FD.4040301@hcjb.org.ec>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <426901FD.4040301@hcjb.org.ec>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Apr 22, 2005 at 08:54:05AM -0500, Stephen J. McCracken wrote:
> Jason Opperisano wrote:
> >On Mon, Apr 18, 2005 at 07:37:22AM +0200, Brent Clark wrote:
> 
> >>I was wondering, if was adviseable to set the default policy for tables 
> >>nat and mangle to DROP.
> >
> >no.  *all* packets traverse the filter chains--do your filtering
> >there.
> 
> Just to better understand, don't all packets also pass the mangle table 
> and only the first packet of a connection the nat table?

yes--all packets will traverse mangle, and --state NEW packets traverse
nat.

there's nothing wrong with doing some pre-filter scrubbing of absolute
stupidity in mangle, but the filter table is there for a reason
(filtering).

-j

--
"Bad Cockroach: Man, I'm going to cut you up so bad, that you... you
 gonna wish I didn't cut you up so bad."
        --Family Guy

