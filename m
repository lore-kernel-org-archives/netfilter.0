From: Jason Opperisano <opie@817west.com>
Subject: Re: Ip Forwarding
Date: Sat, 30 Oct 2004 11:25:57 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1099149957.3668.16.camel@hubcap.ljm.dom>
References: <20041028172521.3B3CB672@mail.817west.com>
	<20041028182603.GA5067@bender.817west.com>
	<20041030105514.GK20919@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041030105514.GK20919@metastasis.org.uk>
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
To: netfilter@lists.netfilter.org

On Sat, 2004-10-30 at 06:55, Nick Drage wrote:
> If you've got 128 public IPS doesn't that mean you want a netmask of
> 255.255.255.128?  Alternatively 255.255.255.192 is a /26, giving you
> 207.145.24.129 to 207.145.24.190?
> 
> http://jodies.de/ipcalc
> 
> is your friend :)

typo.  then i continued to use it for the rest of my example.  sorry for
the confusion.

> I think the original poster meant connections outbound... at least I
> hope so, inbound port 80 connections to all hosts is probably a bad
> idea.

depends whether you read minds better than i do.  since he said "hosting
company" i assumed all the traffic he was trying to allow was inbound.

> > > and I would also like to specify certain
> > > ports for certain ips for dns, ftp, remote desktop, etc.
> 
> Then again - OP, any chance for some clarification?
> 
> <snip>
> 
> Is there any chance of
> 
> d) use something like PPPoE on the external interface of the firewall,
> which would mean you could use the existing IP ranges without
> modification?

that would probably fall under C.  not sure why PPPoE would be necessary
for that.

> Not that I really know if/how this would work, asking the question to
> learn rather than to advise....
> 
> > the "best" solution is A, but will cost some extra $$$.
> 
> How come?  Do ISPs tend to charge for IP space these days?

yes.  nobody rides for free.

> > C can cause problems if certain situations.  B is a nice compromise,
> > basically it would involve:
> > 
> >   router:
> > 	inside interface:  207.145.24.129/30
> > 	static route:      207.145.24.128/26 via 207.145.24.130
> 
> Will the router support this?  You're telling it that 207.145.24.130 is
> on the local network on the other side of its inside interface, and on
> the other side of 207.145.24.130... in a way.  I'm not sure, this just
> looks, well, icky.

icky as it may look, it's called Variable Length Subnet Masking (VLSM):

  http://www.tcpipguide.com/free/t_IPVariableLengthSubnetMaskingVLSM.htm

> >   firewall:
> > 	outside interface:  207.145.24.130/30
> > 	inside interface:   207.145.24.190/26
> > 	default gateway:    207.145.24.129
> 
> Yes, but where's 207.145.24.129?  It falls within the network on both
> interfaces.  

it's on the outside interface.  longest prefix length route always win. 
both the firewall and router know this.  the hosts on the inside will be
the ones that assume 129 - 131 are on the same network as them.  this
would be the "icky" part.

> I expect the firewall will route traffic the correct way
> because its the most specific route, but I don't like the idea of doing
> this with directly connected networks.
> 
> > default gateway of hosts on the 207.145.24.128/26 network:
> > 207.145.24.190
> 
> This will work... except no internal hosts will be able to talk to the
> router directly... 

um--that the point.  i'm not sure if i actually understood the OP's
question--i was answering "how do i stick a layer 3 firewall into an
existing network where all hosts use the router as the default gateway."

if the hosts could talk to the router directly--there wouldn't be much
point in having the firewall.

> which might be OK, but for management and monitoring
> everything will have to come from the firewall.

why?

>   As all the hosts think
> that everything from 207.145.24.129-190 is on the local network they
> will arp for 207.145.24.129 - the router - rather than sending the
> traffic to the firewall.

the firewall is their default gateway (190)--they don't need to talk to
the router.  if something needs to talk to the router directly (for SNMP
mgmt or something) add a static route to it that points
207.145.24.128/30 via 207.145.24.190.

again--i was only trying to explain the option that actually required a
lengthy explanation.  the best solution is still A.

-j

-- 
Jason Opperisano <opie@817west.com>


