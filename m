From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables / ebtables IP address intercept
Date: Tue, 03 Aug 2010 15:23:49 -0500
Message-ID: <4C587AD5.5060500@riverviewtech.net>
References: <B02D1E8884632086B0CC9CAF@Ximines.local> <4C5849B6.2030002@riverviewtech.net> <9EA7C5060C8C8A2B321AD23C@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9EA7C5060C8C8A2B321AD23C@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/03/10 13:06, Alex Bligh wrote:
> Indeed, and (crucially) backtraffic flows the same way (except 
> backwards). R2 also does SNAT & DNAT as well as routing. Also B1 and 
> R2 are the same box (i.e. B1/R2 is a brouter)

*nod*

> Note it's intercepting traffic to Server X (somewhere behind R1), not 
> traffic to S1.

OK.

Either way, B1 is intercepting traffic and re-routing it elsewhere.

Are you saying that the new destination of the traffic is also out R1?

I.e. the following topology?

{S1}--- BBI ---(R1)---[B1]---{C1}

Where BBI is the BigBadInternet

> This needs to work irrespective of the L3 configuration of C1 and R1, 
> so that doesn't work.

Ok.

That means that the NATing is going to be ""fun.

> What I'm doing to get the outbound traffic working is the SNAT and 
> DNAT which is sufficient as B1/R2 are one box. However, the 
> backtraffic for SNAT assumes there is an L3 route on R2 to determine 
> egress interface.

Agreed.

> What I want is to match on (e.g.) CONNMARK and set 
> the output interface at the IPTABLES level. I can't do that, except 
> by copying CONMARK into MARK then using ip rules to policy route. I 
> don't particularly want to do that as it's not really very scalable.

I'm thinking that IPTables' Bridge NetFilter option will allow us to do 
something else.

> This fails because though S1's IP address is restored by the SNAT of 
> the backtraffic, the default route for S1's IP address is out some 
> other interface (normally B1/R2's default route).

*nod*

> That is not necessary. SNAT means the outbound packets (inbound to 
> S1) contain B1/R2's source IP address, so provided S1 can reach that 
> (which is by assumption true as S1 is elsewhere on the internet and 
> B1/R2 has a public IP or something that passes for one), backtraffic 
> from S1 contains B1/R2's IP address as a destination, and it thus 
> reaches B1/R2 subsequently.

Agreed.

>> R2 needs to get traffic between multiple layer 3 networks.
> 
> Not quite sure what that means as that's what a router does by 
> definition!

Sorry.  Re-reading what I wrote, I see that I wasn't as clear as I 
needed to be.

I was thinking that a device that was not in one (or both) of the layer 
3 networks would need to alter the layer 3 traffic so end systems could 
communicate.

More specifically, using a layer 2 device to alter the layer 3 IP 
addresses, and possibly the layer 2 MAC addresses.  (This is where the 
IPTables' Bridge NetFilter option comes in to play.)

> Yes, that's what I'm doing.

*nod*

> Sadly it's necessary.

Ok.

This complicates things.

(Time to do some thinking about IPTables' Bridge NetFilter options.)

> The step I am having difficulty with is after the SNAT/DNAT has been 
> undone on reverse traffic, it needs to know which interface (which 
> may be a bridge) to push the traffic out of.

Here in lies your problem.

You are going to have to have a route (of some sort) to get back from B1 
to C1.

Now /what/ said route is, doesn't matter.  Which is a good thing.

> I don't think ebtables 
> is much use here because it hits the routing step after SNAT/DNAT 
> which causes the problem, and the backtraffic never hits a bridge.

I don't know if EBTables its self is going to play that much (more) of a 
role in your configuration.  That being said, bridging is going to 
continue to play a considerable role.

> That's what I am doing :-)

*nod*

(Again, most of the differences between B1 and R2 were to differentiate 
between the layers in my head as I was figuring things out.)

 From this point on, I'm going to refer to B1 and R2 collectively as BR1.

> You are on the right track, but sadly how to get this working with 
> iptables still eludes me.

Now the fun begins.  (Now we are getting in to something that I haven't 
messed with in a very long time.)

{S1}--- BBI ---(R1)---[BR1]---{C1}

Here's my idea is to bridge the r1 and c1 interfaces together in to the 
br1 bridge and route modified packets.  The key being the "modified 
packets".

It is (or was last time I needed to do it years ago) to use IPTables' 
Bridge NetFilter option to allow IPTables (a layer 3 toolbox) to operate 
on bridged (a layer 2 operation) packets before they entered the logical 
bridge interface (as seen by the routing code).  Thus we could modify 
packets that came in to the bridge's the physical c1 interface before 
they went out the bridge's logical br1 interface on up to the routing 
code.  (Here in lies the magic.)  -  We use IPTables' Bridge NetFilter 
option to NAT the unknown layer 3 IP addresses in to a known IP address 
for routing to work with.  Conceptually it would function like this:

  - Bridge / EBTables* receives / intercepts the IP packet.
       C1 -> S1
  - Bridge NetFilter code modifies the IP packet.
       C1' -> S1
  - IPTables DNATs/SNATs the packet.
       BR1 -> S1
  - Kernel sends the packet out to S1.
       BR1 -> S1

Similarly the reply traffic would take the reverse process.

  - Kernel receives the IP packet.
       S1 -> BR1
  - IPTables unSNATs / unDNATs the IP packet.
       S1 -> C1'
  - Bridge NetFilter code unmodifies the IP packet.
       S1 -> C1
  - Bridge sends the IP packet out to C1.
       S1 -> C1

I will need to do some more thinking on how to utilize IPTables's Bridge 
NetFilter code / rules to do what is needed to be done.  Give me a bit 
and I'll re-reply.

> I know it's possible to do programmatically as I have knocked up some 
> raw socket stuff which is working in userspace, which does all the 
> NAT steps and MAC manipulation by hand (that was fun). I'd just 
> rather not do it that way.

I don't think you are going to need to do it progromatically.

As I'm brushing up on kernel options, you may want to consider the raw 
table so that you can use the NOTRACK targets so that you don't consume 
resources tracking all the packets that aren't being intercepted.



Grant. . . .
