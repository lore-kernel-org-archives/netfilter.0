From: Joe Thompson <jt@techforless.com>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: 02 Apr 2004 15:07:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080943679.3421.4.camel@4100.internal.techforless.com>
References: <c4kjrg$lqm$1@gatekeeper.tmr.com>
	 <1080941765.17616.61.camel@localhost>
	 <200404022250.54788.Antony@Soft-Solutions.co.uk>
Reply-To: jt@techforless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404022250.54788.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

What is the architecture between the rest of the world and your
firewall?  Is it possible to use BGP and only one of the public
subnets?  This would in effect move the redundancy of the public side to
the router(s) allowing you to use standard method's at the firewall.

We run a similar situation with one of our subnets, we have two circuits
from separate provider's who were both gracious enough to add the routes
in they're tables, if we lose one connection the rest of the world just
uses the other route in and we of course use the other route out.  The
downside is getting both upstream providers to cooperate in routing, the
upside is that you can utilize both links and keep things simple from an
addressing perspective.

Joe

On Fri, 2004-04-02 at 14:50, Antony Stone wrote:
> On Friday 02 April 2004 10:36 pm, John A. Sullivan III wrote:
> 
> > On Fri, 2004-04-02 at 15:57, Bill Davidsen wrote:
> > >
> > > All I want to do is send packets out the interface which matches the
> > > source IP, and I don't think there's any reasonable way to get there
> > > without patches or BSD.
> >
> > Hmmm . . . I admit to not having tried this and only giving it five
> > minute's thought but I'm not sure I see the problem.  Well, I see why
> > one can't be guaranteed to send the packet out the same interface but
> > I'm not sure why that is a problem.
> 
> Some ISPs block packets with source addresses not matching their own network 
> range, as a contribution to blocking spoofed packets.
> 
> > In the case of an interface or ISP failure, I assume you would disable
> > the interface which would eliminate the route.
> 
> That's not necessarily a difficult task (bringing it back up again afterwards 
> is not entirely trivial, however), but if the problem can be solved without 
> sending all outbound traffic across a single connection, and leaving the 
> other one largely idle, it would be a better solution.
> 
> Regards,
> 
> Antony.


