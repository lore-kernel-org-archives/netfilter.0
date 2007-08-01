From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: two subnets...
Date: Wed, 01 Aug 2007 16:14:25 -0500
Message-ID: <46B0F7B1.7040805@riverviewtech.net>
References: <46ADBDF0.3020200@mp.pl>	<46AF4FC7.1000500@riverviewtech.net>	<46AF8D63.8080900@interia.pl>	<46AF9694.1060709@riverviewtech.net>	<46AFBA57.3040702@mailinator.com>
	<46B0E9B3.6050008@interia.pl>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B0E9B3.6050008@interia.pl>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/01/07 15:14, Pawel Zawora wrote:
> I have no experience with bridgging ...

Not a problem.  Bridging is *VERY* easy to work with.  In fact, I'd be
willing to bet that after you set it up you will look back and think
"Hum, that was ridiculously easy.".

> Is there any way to use my linux router as bridge ?

Yes, it is very easy to do.  Add support for bridging to the kernel
"(2.6) Device Drivers -> Networking support -> Networking options ->
802.1d Ethernet Bridging".

To do the separation that I'm talking about you will need EBTables
support in the kernel too "(2.6) Device Drivers -> Networking support ->
Networking options -> Network packet filtering -> Bridge: Netfilter
Configuration -> Ethernet Bridge tables (ebtables) support".

*IF* you do want to use IPTables to filter the packets and not EBTables
you will need to turn on "(2.6) Device Drivers -> Networking support ->
Networking options -> Network packet filtering -> Bridged IP/ARP packets
filtering" which is used to allow IPTables Netfilter code to see bridged
packets just like forwarded packets.

I would recommend that you use EBTables to do the OSI Layer 2
firewalling over IPTables.

> I'm using multiple routing tables  (source routing) to route between 
> interfaces (3 IPS , 4 local networks + tunells)

Ok...

> Is there no way to use routing instead of  bridging?

Ugh, I'm sure there is, but I'm not sure how to go about it.  In my
opinion routing verses bridging any time you want the same subnet on
multiple separated interfaces is akin to buying a DC to AC converter to
power a battery charger to charge the battery in a car verses just
fixing the alternator.  Sure it will work, buy why do it the long way
when there is a much simpler *MUCH* cleaner and more maintainable way to
do it.  If you get routing involved when you have the same subnet on two
non connected interfaces, you have all sorts of different (IMHO) nasty
issues to work with where as bridging, routing is just like it was,
clean and simple with out rules to specify which condition triggers
which routing table.

> Can I mark packet (via iptables) and next create routing rules based 
> on the mark?  (on the router)

I'm sure that you can mark packets and decide which routing table(s) to
use based on the mark.  However I'm not sure how well this will achieve
what you are wanting to do based on how complex the routing becomes.

> How to enforce routing via gw (my router) from machines in "my" 
> subnet to "foregin" subnet?  (by default thay seem that host a.b.c.97 
> is in local subnet ?

Ok, I think you are going a bit backwards here.  I thought I understood
you to mean that you did not want machines in your (local) a.b.c subnet
to be able to communicate with machines in the foreign (remote) a.b.c
subnet and vice versa.  Is that indeed the case, or not?  This decides
what firewalling would and / or would not be in place.

> Is any way to enfore routing (somethig like DR used by LVS? )

I'm not sure what you are wanting to enforce?  I'm cursorily aware of
what Direct Routing in a Linux Virtual Server is, but not enough so to
comment on how DR would compare to what I'm proposing via bridging.

Basically, what bridging (as I have proposed it) will do is take a
system with with three network cards in it with each connected to
physically separate networks that do not interconnect join two of three
said networks as if it was one (logical) network.  Thus allowing one
subnet to be common to both of the two physical networks in the one
logical network.

Another way to say this would be to have two buildings connected
together with switches and a router in one of the buildings out to the
internet.  The LAN common to both buildings shares one IP subnet and
stations are assigned static IPs across the subnet in both buildings in
such a way as it is practically (for all intents and purposes)
impossible to break the two buildings in to two different networks and
subnets.  However you have to do something to keep the computers in one
building from talking to the computers in the other building and vice
versa.  Bridging will VERY easily accomplish this.  To do this with
bridging, add a third network card to the router and connect the cable
from the other building in to the new network card.  Now create a bridge
(via brctl) on the router and add the two network cards facing the
buildings to the bridge.  Move the IP address that was assigned to the
network card facing the building(s) off of the physical ethernet
interface to the logical bridge interface.  Now you have the two
buildings bridged together via the bridge / router.  Using EBTables you
can now put firewalling rules in place to control who can access what in
between the two buildings.  Depending on what your EBTables firewall
rules are, the buildings can possibly communicate with each other any
where between fully to absolutely noting at all or to a very limited extent.



Grant. . . .

