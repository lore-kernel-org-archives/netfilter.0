From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: Ip Forwarding
Date: Sat, 30 Oct 2004 18:29:53 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041030172953.GB22583@metastasis.org.uk>
References: <20041028172521.3B3CB672@mail.817west.com>
	<20041028182603.GA5067@bender.817west.com>
	<20041030105514.GK20919@metastasis.org.uk>
	<1099149957.3668.16.camel@hubcap.ljm.dom>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1099149957.3668.16.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Oct 30, 2004 at 11:25:57AM -0400, Jason Opperisano wrote:
> On Sat, 2004-10-30 at 06:55, Nick Drage wrote:
> > If you've got 128 public IPS doesn't that mean you want a netmask of
> > 255.255.255.128?  Alternatively 255.255.255.192 is a /26, giving you
> > 207.145.24.129 to 207.145.24.190?

<snip>

> typo.  then i continued to use it for the rest of my example.  sorry for
> the confusion.

The original poster said 255.255.255.192 for his netwask but said he has
128 public IPs... so the typo wasn't yours, I should have been clearer.

> > I think the original poster meant connections outbound... at least I
> > hope so, inbound port 80 connections to all hosts is probably a bad
> > idea.
> 
> depends whether you read minds better than i do.  since he said "hosting
> company" i assumed all the traffic he was trying to allow was inbound.

That's a very good point :)

<snip>

> > d) use something like PPPoE on the external interface of the firewall,
> > which would mean you could use the existing IP ranges without
> > modification?
> 
> that would probably fall under C.  not sure why PPPoE would be necessary
> for that.

I've probably misunderstood PPPoE.  I thought it was possible to have

      <----- External IP
Router
  | 
  |  Some kind of layer two magic where all traffic that isn't for the
  |  hosts themselves is passed between the router and the firewall
  |
Firewall
  |   <-----Internal IP
  |
Internal network

Where "PPPoE" is the "layer two magic", effectively the Router and
Firewall are one device as far as layer 3 is concerned, and pass all
traffic not meant for themselves to the other device.

<snip>

> > > C can cause problems if certain situations.  B is a nice compromise,
> > > basically it would involve:
> > > 
> > >   router:
> > > 	inside interface:  207.145.24.129/30
> > > 	static route:      207.145.24.128/26 via 207.145.24.130
> > 
> > Will the router support this?  You're telling it that 207.145.24.130 is
> > on the local network on the other side of its inside interface, and on
> > the other side of 207.145.24.130... in a way.  I'm not sure, this just
> > looks, well, icky.
> 
> icky as it may look, it's called Variable Length Subnet Masking (VLSM):
> 
>   http://www.tcpipguide.com/free/t_IPVariableLengthSubnetMaskingVLSM.htm

Heh, I'm familiar with VLSM, but I've never seen overlapping subnets
before... well, not overlapping subnets relating to networks directly
connected to a device.

> > This will work... except no internal hosts will be able to talk to
> > the router directly... 
> 
> um--that the point.  i'm not sure if i actually understood the OP's
> question--i was answering "how do i stick a layer 3 firewall into an
> existing network where all hosts use the router as the default
> gateway."
> 
> if the hosts could talk to the router directly--there wouldn't be much
> point in having the firewall.
> 
> > which might be OK, but for management and monitoring everything will
> > have to come from the firewall.
> 
> why?

Sorry, as you point out, this is a hosting company, so I would expect
that none of the servers need to talk to the router, any hosts set up to
monitor it will be elsewhere.

As for the last bit, "will have to come from the firewall" should be
"will have to come from a host that is not behind the firewall", which
does open up the range of possible hosts rather a lot.

> > As all the hosts think that everything from 207.145.24.129-190 is on
> > the local network they will arp for 207.145.24.129 - the router -
> > rather than sending the traffic to the firewall.
> 
> the firewall is their default gateway (190)--they don't need to talk
> to the router.  if something needs to talk to the router directly (for
> SNMP mgmt or something) add a static route to it that points
> 207.145.24.128/30 via 207.145.24.190.
> 
> again--i was only trying to explain the option that actually required
> a lengthy explanation.  the best solution is still A.

Thanks for the explanation, it makes sense to me now... Joe?

-- 
Recedite, plebes! Gero rem imperialem!


