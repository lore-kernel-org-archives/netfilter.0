From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables / ebtables IP address intercept
Date: Tue, 03 Aug 2010 11:54:14 -0500
Message-ID: <4C5849B6.2030002@riverviewtech.net>
References: <B02D1E8884632086B0CC9CAF@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B02D1E8884632086B0CC9CAF@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/31/10 09:24, Alex Bligh wrote:
> On a machine acting as a bridge, I want to intercept calls to a 
> specific IP address, and serve them locally. So, the bridge config 
> looks like (e.g.)

Ok...

> What I really want is for the masquerade line to remember not only 
> the input IP address but also the input interface associated with the 
> connection, and ignore the routing table. I am, however, open to any 
> other ideas. I should say that the bridge box concerned carries 
> hundreds of VLANs - I am happy using connmark to track traffic, but I 
> can't see how to match connmark in iptables and use that to set 
> output interface and output mac address.

It sounds like you want a layer 2 bridge (that is agnostic to the layer 
3 addressing that is passing through it) to be able to intercept traffic 
that is destined to one (or more) specific destination IP address(es). 
Correct?  (I'm presuming yes for the sake of conversation.)

I think I have a foundation for a rough idea but I'd like to run it past 
you to see if I'm going the correct direction or not.

Consider the following topology.

(R1)----[B1]----{C1}
          |
          |
         (R2)
          |
          |
         {S1}

R1 = existing default gateway
R2 = new default gateway
B1 = bridge
C1 = client
S1 = server

B1 bridges all three interfaces (called r1 / c1 / r2 respectively) together.

Normally all non-intercepted traffic flows through the r1 and c1 
interfaces of the bridge.  The intercepted traffic flows through the r2 
and c1 interfaces of the bridge.

To intercept traffic from C1 to S1, the bridge will match traffic that 
is destined to S1's IP address via R1's MAC address and DNAT it so that 
it goes to S1's IP address via R2's MAC address.  Thus the traffic will 
now flow to R2.  R2 will receive the traffic and route it normally.

This is where things get a bit interesting.  -  Either you will need to 
have R2 be in the same layer 3 network as C1 (easier) or you will need 
to do some interesting things at layer 2 to get the traffic across layer 
3 networks (harder but doable).

(For now I'm going to continue as if R2 is part of the same layer 3 
network as C1.  I think you can have R2 use the same IP address as R1 
with out conflict because B1 is separating the routers / preventing a 
conflict.)

S1 will receive the traffic and reply like normal.  S1's reply will need 
to go back to R2, which will route the traffic normally.  (If you don't 
want S1 to use R2 there are options, but we can get to those.)

B1 will match the reply traffic that is from S1's IP address via R2's 
MAC address and SNAT it so that it is from S1's IP address via R1's MAC 
address.  Thus the traffic will now flow to C1, there by establishing 
two way communications between its C1 and S1.

The two sticking points (which I believe can be worked around) that I 
see are that S1 needs to use R2 as it's default gateway and R2 needs to 
get traffic between multiple layer 3 networks.

You could probably have R2 SNAT / MASQUERADE traffic to S1 thus negating 
the need for S1 to use R2 as its default gateway.  But that pushes more 
complexity to R2 which I'd like to avoid for the moment.  (I say "for 
the moment" because I want to have a better understanding of how R2 can 
be configured.)

If R2 can be part of the same layer 3 network as C1, then R2 is simply a 
router that has multiple networks and can easily do the SNATing / 
MASQUERADEing.

If R2 can't be part of the same layer 3 network as C1, then you are 
going to have to do some interesting things to get the traffic to cross 
layer 3 networks.  Namely you are going to have to alter layer 3 IP 
addresses from layer 2.  ...  After reviewing the EBTables man page, you 
may have to invoke IPTables on layer 2 bridged traffic to alter the 
layer 3 IP addresses.  But, I believe that this can be done.

Seeing as how B1 is operating on layer 2 and R2 is operating on layer 3 
(clear separation of layers) it may be possible to combine them in to 
one bridging router (a.k.a. brouter).  Before I can say for sure, I need 
to know if what I have suggested will work for you or not.

Hopefully this gives you a direction to go.  At the very least let me 
know if I'm on the right track or not.



Grant. . . .
