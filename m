From: Alex Bligh <alex@alex.org.uk>
Subject: Re: iptables / ebtables IP address intercept
Date: Tue, 03 Aug 2010 19:06:50 +0100
Message-ID: <9EA7C5060C8C8A2B321AD23C@Ximines.local>
References: <B02D1E8884632086B0CC9CAF@Ximines.local>
 <4C5849B6.2030002@riverviewtech.net>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5849B6.2030002@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

Grant,

--On 3 August 2010 11:54:14 -0500 Grant Taylor <gtaylor@riverviewtech.net> 
wrote:

>> What I really want is for the masquerade line to remember not only
>> the input IP address but also the input interface associated with the
>> connection, and ignore the routing table. I am, however, open to any
>> other ideas. I should say that the bridge box concerned carries
>> hundreds of VLANs - I am happy using connmark to track traffic, but I
>> can't see how to match connmark in iptables and use that to set
>> output interface and output mac address.
>
> It sounds like you want a layer 2 bridge (that is agnostic to the layer 3
> addressing that is passing through it) to be able to intercept traffic
> that is destined to one (or more) specific destination IP address(es).
> Correct?  (I'm presuming yes for the sake of conversation.)

Yes

> I think I have a foundation for a rough idea but I'd like to run it past
> you to see if I'm going the correct direction or not.
>
> Consider the following topology.
>
> (R1)----[B1]----{C1}
>           |
>           |
>          (R2)
>           |
>           |
>          {S1}
>
> R1 = existing default gateway
> R2 = new default gateway
> B1 = bridge
> C1 = client
> S1 = server
>
> B1 bridges all three interfaces (called r1 / c1 / r2 respectively)
> together.
>
> Normally all non-intercepted traffic flows through the r1 and c1
> interfaces of the bridge.  The intercepted traffic flows through the r2
> and c1 interfaces of the bridge.

Indeed, and (crucially) backtraffic flows the same way (except backwards).
R2 also does SNAT & DNAT as well as routing. Also B1 and R2 are
the same box (i.e. B1/R2 is a brouter)

Note it's intercepting traffic to Server X (somewhere behind R1), not
traffic to S1.

> To intercept traffic from C1 to S1, the bridge will match traffic that is
> destined to S1's IP address via R1's MAC address and DNAT it so that it
> goes to S1's IP address via R2's MAC address.  Thus the traffic will now
> flow to R2.  R2 will receive the traffic and route it normally.

Yes, that works fine.

> This is where things get a bit interesting.  -  Either you will need to
> have R2 be in the same layer 3 network as C1 (easier)

This needs to work irrespective of the L3 configuration of C1 and R1,
so that doesn't work.

> or you will need to
> do some interesting things at layer 2 to get the traffic across layer 3
> networks (harder but doable).

What I'm doing to get the outbound traffic working is the SNAT and DNAT
which is sufficient as B1/R2 are one box. However, the backtraffic
for SNAT assumes there is an L3 route on R2 to determine egress interface.
What I want is to match on (e.g.) CONNMARK and set the output interface
at the IPTABLES level. I can't do that, except by copying CONMARK into
MARK then using ip rules to policy route. I don't particularly want
to do that as it's not really very scalable.

[snip]

> B1 will match the reply traffic that is from S1's IP address via R2's MAC
> address and SNAT it so that it is from S1's IP address via R1's MAC
> address.  Thus the traffic will now flow to C1, there by establishing two
> way communications between its C1 and S1.

This fails because though S1's IP address is restored by the SNAT of the
backtraffic, the default route for S1's IP address is out some other
interface (normally B1/R2's default route).

> The two sticking points (which I believe can be worked around) that I see
> are that S1 needs to use R2 as it's default gateway

That is not necessary. SNAT means the outbound packets (inbound to S1)
contain B1/R2's source IP address, so provided S1 can reach that (which is
by assumption true as S1 is elsewhere on the internet and B1/R2 has a
public IP or something that passes for one), backtraffic from S1 contains
B1/R2's IP address as a destination, and it thus reaches B1/R2 subsequently.

> and R2 needs to get
> traffic between multiple layer 3 networks.

Not quite sure what that means as that's what a router does by definition!

> You could probably have R2 SNAT / MASQUERADE traffic to S1 thus negating
> the need for S1 to use R2 as its default gateway.

Yes, that's what I'm doing.

> But that pushes more
> complexity to R2 which I'd like to avoid for the moment.  (I say "for the
> moment" because I want to have a better understanding of how R2 can be
> configured.)

Sadly it's necessary.

> If R2 can be part of the same layer 3 network as C1, then R2 is simply a
> router that has multiple networks and can easily do the SNATing /
> MASQUERADEing.
>
> If R2 can't be part of the same layer 3 network as C1, then you are going
> to have to do some interesting things to get the traffic to cross layer 3
> networks.  Namely you are going to have to alter layer 3 IP addresses
> from layer 2.  ...  After reviewing the EBTables man page, you may have
> to invoke IPTables on layer 2 bridged traffic to alter the layer 3 IP
> addresses.  But, I believe that this can be done.

The step I am having difficulty with is after the SNAT/DNAT has been
undone on reverse traffic, it needs to know which interface (which may be
a bridge) to push the traffic out of. I don't think ebtables is much
use here because it hits the routing step after SNAT/DNAT which causes
the problem, and the backtraffic never hits a bridge.

> Seeing as how B1 is operating on layer 2 and R2 is operating on layer 3
> (clear separation of layers) it may be possible to combine them in to one
> bridging router (a.k.a. brouter).  Before I can say for sure, I need to
> know if what I have suggested will work for you or not.

That's what I am doing :-)

> Hopefully this gives you a direction to go.  At the very least let me
> know if I'm on the right track or not.

You are on the right track, but sadly how to get this working with
iptables still eludes me.

I know it's possible to do programmatically as I have knocked up some
raw socket stuff which is working in userspace, which does all the NAT
steps and MAC manipulation by hand (that was fun). I'd just rather not
do it that way.

-- 
Alex Bligh
