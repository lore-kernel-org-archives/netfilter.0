From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 14:04:08 -0600
Message-ID: <490E07B8.6050905@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DF4CA.1010808@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Note:  Because of the length of my reply I'm going to split this reply 
in to two parts.  The first (this) part will be on routing in general 
and the second (next) part will be on NATing.

On 11/2/2008 12:43 PM, Daniel L. Miller wrote:
> Thanx.  I'm still not sure of the vocabulary with which to phrase my 
> "true" question - so I'll try it with more words (although I think 
> you've already answered me - I'm just looking for confirmation).

Eh...  What Daniel said is true, but your (mis)understandings are not 
quite right.  You are actually trying to understand some lower level 
functionality by observing some higher level functionality that causes 
you to misconstrue the underlying functionality.  It's sort of like 
trying to grab something under water while looking at it from out of the 
water if you don't know that water changes the angle you need to look at.

> Given:
> 1.  A linux box "router" that has ip-fowarding enabled, and no 
> restrictions via iptables.
> 2.  This box has a routing table that lists two or more networks
> 
> If another host on network 'A', lists the box "router" as its default 
> gateway, and tries to contact network 'B' through the router - will the 
> router automagically pass along the packets?  Or this simply doesn't 
> work, because of a basic networking concept I haven't grasped - and NAT 
> is the technique to accomplish this?

Yes and no.

NATing, or Network Address Translation, is a special technique to alter 
(possibly hide) either the source and / or destination address the 
traffic is coming from and / or going to.  (I say "and / or" because it 
is possible to NAT both the source and destination if need be, which is 
called double NATing and even more complex.)

First let's say that a /Default Gateway/ is nothing more than a catch 
all route to be used when there are no other better routes to use.  In 
essence, use the /Default Gateway/ as the last resort to fall back on if 
nothing else works.

Now, routes in general are just a way of saying that if you want to go 
to this particular destination, you need to go by way of here to get to 
your ultimate destination.

Now, let's consider your scenario above:

+---+         +--------+         +---+
| 1 +---(A)---+ Router +---(B)---+ 2 |
+---+         +--------+         +---+

We configure host 1 on network A to use the Router as its default 
gateway and similarly we configure host 2 to use the Router as its 
default gateway.

Now, host 1 can ping any thing on network A directly because it is local 
and with in it's (sub)net(work).  However if host 1 wants to ping any 
thing out side of network A it will have to find a route to get to the 
destination.  Knowing that host 1 only has one route, the /Default 
Gateway/ all traffic not going to the local (sub)net(work) will go to 
the /Default Gateway/.  So, host 1 sends its traffic to the /Default 
Gateway/ of Router.  Now it is up to Router to handle the traffic.

Router now has traffic from host 1 that it needs to deliver to host 2. 
So Router looks in its routing tables and finds that host 2 is in 
network B and that it is directly attached to network B and as such is 
able to send the traffic directly to host 2 in network B.

When host 2 receives the traffic and is ready to reply to host 1 it goes 
through a similar process as host 1 to send the reply traffic.  Likewise 
Router handles the traffic in reverse.

Thus hosts 1 and 2 are able to talk to each other by way of Router.

When hosts 1 and 2 are talking to each other, they both know that that 
traffic originated from the other because of the source IP address in 
the packets they received.

Now, let's elaborate the network connection a bit more to further 
explain routing.

                  :                 :
                  |                 |
+---+         +--+--+           +--+--+         +---+
| 1 +---(A)---+ Bob +===(XXX)===+ Tom +---(B)---+ 2 |
+---+         +-----+           +-----+         +---+

Here we have two friends that have their home network, each with their 
own internet connection.  However, considering that they are friends, 
they have some sort of connection between their homes to allow them to 
use each others network resources.  This connection could be a VPN 
across the internet, or it could be a wireless network connection, or if 
they are close enough to each other, it could be an ethernet connection 
between their routers.

In this scenario, both hosts 1 and 2 use their local routers (Bob and 
Tom respectively) as their /Default Gateway/.

Now let's re-consider host 1 pinging host 2 in this new network.  Like 
before, when host 1 wants to pint host 2 it finds that host 2 is not 
with in its network and thus must have a route to get there.  Like 
before host 1 will send the traffic to its /Default Gateway/ (in this 
case) "Bob".  Bob will then have to find a route to get to host 2.  This 
time Bob has a default gateway of the internet connection (going out the 
top) -AND- Bob has a route to network B by way of "Tom".  So Bob will 
send the packet on to Tom.  Tom will then as you would expect see that 
host 2 is directly connected to network B and send the packet on to host 2.

Similarly when host 2 replies, it's traffic will go to it's /Default 
Gateway/ (in this case) "Tom".  Tom will then find that it has a route 
to network A by way of "Bob" and as such will send traffic to network A 
to Bob.  Bob will then see that the traffic is to a system on network A 
and send the traffic accordingly.

In both of the above scenarios hosts 1 and 2 used the /Default Gateway/ 
to send their traffic and did not need a routing table with any thing 
more than their /Default Gateway/.  The following scenario is a bit 
different.

    :                                             :
    |                                             |
+--+--+         +---+           +---+         +--+--+
| Bob +---(A)---+ 1 |           | 2 +---(B)---+ Tom |
+-----+    |    +---+           +---+    |    +-----+
            |                             |
            |    +---+           +---+    |
            +----+ 7 +===(XXX)===+ 8 +----+
                 +---+           +---+

Here things are more than a bit different.  In this configuration, we 
still have Bob's and Tom's houses, except this time the connection 
between the two networks is not through their /Default Gateway/ but 
rather the respective systems 7 and 8.

In this scenario, when host 1 wants to ping host 2, host 1 will again 
consult its routing table.  However this time there will have to be an 
entry that says that network B is accessible by  host 7 in addition to 
the /Default Gateway/ entry.  Thus when host 1 sends its packet it will 
find that it needs to send the packet to host 7 rather than the /Default 
Gateway/ of "Bob".  Host 7 will then receive the packet and find that it 
needs to send the packet on to host 8.  Host 8 will then find that it 
can send the packet directly to host 2 on the local network B.

Similarly host 2 will have to have a route in its routing table so that 
it knows that it reaches network A by way of host 8.  Thus host 2 sends 
its reply packet to host 8 which sends the packet on to host 7 which 
then sends the packet directly to host 1.

> I guess part of my difficulty lies in a lack of experience configuring 
> non-linux routers.  Behind-the-scenes, as it were, do all/most routers 
> use NAT to accomplish the goal of linking networks?  It always seemed to 
> me NAT was a 'kludge' that was somehow unnecessary when "more 
> expensive?" equipment was involved.

Quickly, *NO*, routers in general do *NOT* use NAT.  Look at my next 
email for an explanation as to what NAT is for.



Grant. . . .
