From: Shawn <core@enodev.com>
Subject: Re: Routing Public IPs over NAT Address Space
Date: 14 Jul 2003 17:38:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058222304.24132.166.camel@localhost>
References: <200307142037.h6EKbDjk022585@discmail.com>
	 <1058215783.24180.128.camel@localhost>
	 <000901c34a54$be16cf20$0f00a8c0@tandem>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c34a54$be16cf20$0f00a8c0@tandem>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

To follow up on a private reply, it can be troublesome to have NAT
gateways in between the big "I" and customers anyway.

I think what you're saying is you want your linux router to forward
public subnets to private subnets over at some customer site. Problem
is, if they want to administer their own DNS, they have to figure out
how to correctly configure DNS views, so internal resolvers don't
resolve to external addresses, etc etc. BIG TROUBLE!!!

I suggest simply routing whatever public traffic, or, in addition to
that, implement an MPLS infrastructure if you/they care about privacy.

On Mon, 2003-07-14 at 17:10, A. Clausen wrote:
> ----- Original Message ----- 
> From: "Shawn" <core@enodev.com>
> To: <techlists@alberni.net>
> Cc: "Netfilter Mailing List" <netfilter@lists.netfilter.org>
> Sent: Monday, July 14, 2003 13:23
> Subject: Re: Routing Public IPs over NAT Address Space
> 
> 
> > Please describe precisely, what you want to accomplish. An example:
> >
> > I would like for hosts out on the public internet to be able to connect
> > to my nnn.nnn.nnn.0/24 through my router, whose internet facing
> > interface is responsible for routing said nnn.nnn.nnn.0/24, but where
> > nnn.nnn.nnn.0/24 lies across some 10.0.0.0/24 which is "directly
> > connected" to the other interface of said router.
> >
> > There are folks out there that would like to help you, but if you can't
> > be bothered to take the time to describe your question with enough
> > specificity (and with correct terms), no one can help.
> 
> Sorry about that.  I'll be more specific.
> 
> I work for a small ISP, and we are selling residential and business wireless
> service.  Thus far, using iptables NAT, we've had no problems.  It works
> well and permits MSN Messenger and the like to work.  For those people who
> want a public IP, I simply do forwarding, and this works very well.
> 
> However, we've had some inquiries about a few businesses who want actual
> subnets (for mail servers, web servers, or whatever).  The problem with NAT
> is that I can't guarantee there will be a helper for every protocol.  What I
> was wondering was whether I could allocate a subnet and get it across the
> private (NAT) network to their router.  I have my doubts as to whether this
> is possible, but not being an expert I thought I'd ask.
> 
> My thoughts are that VPN may be the way to go.

