From: "Damien Mason" <kinetic@suse.net.au>
Subject: RE: VLANs and DNAT
Date: Sun, 27 Jul 2003 02:07:48 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFEFKCMOFILOKIDDKLAICEEBCAAA.kinetic@suse.net.au>
References: <Pine.LNX.4.44.0307251451410.1760-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307251451410.1760-100000@localhost>
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

Hi Chris, Ramin,

	Thanks, I've been reading up heaps over the last day, I had an inkling that
that's probably what i'd have to do (marking the packets), should be fun!

Yes, I meant -o output interface (there is no output interface on
prerouting, of course).

Chris,

	The reason we have multiple non-unique addressing schemes on the vlans is
because they're from multiple client sites. It's just not practical to go in
and change the entire addressing scheme for 200 client sites for us, each of
which would consist of more than 50 hosts that all rely on eachother, some
with no dns, it would be a nightmare to administer, at least in the limited
time period I have available.

	Basically, vlan connections to all our client sites will be handed to us
via a 802.1q trunk, each of those sites has a router with an external ip of
something like 10.1.1.1, so the network route would look like the routing
table below:

See Diagram if you feel so inclined :) - thanks.
http://www.suse.net.au/secretpics/network_schematic.gif

-----------------------------------------------

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
# client 1
192.168.10.0    10.1.1.1	  255.255.255.224	U	0	 0	    0	eth1.1
192.168.10.32   10.1.1.2	  255.255.255.224	U	0	 0	    0 eth1.2
192.168.10.64   10.1.1.3	  255.255.255.224 U	0	 0	    0 eth1.3
192.168.10.96   10.1.1.4	  255.255.255.224 U	0	 0	    0 eth1.4

# client 2
192.168.10.0    10.1.1.5	  255.255.255.128 U	0	 0	    0 eth1.5
192.168.10.128  10.1.1.6	  255.255.255.128 U	0	 0	    0 eth1.6

# client 3
192.168.10.0    10.1.1.7	  255.255.255.128 U	0	 0	    0 eth1.7
192.168.10.128  10.1.1.8	  255.255.255.128 U	0	 0	    0 eth1.8

# default gateway
0.0.0.0	    $defaultgw	  0.0.0.0		UG	0	 0	    0	eth2

...
dmz routing, simliar to vlan routing above, with unique ips
...

-----------------------------------------------

So Chris - I can't make a route to a host, because multiple hosts exist
using the same ips, on different client LANs. (thankfully each client (not
site) will use different network address ranges).

Like Ramin suggests, the only way I can see to do this, since the routing
table is shared by all interfaces, is to force the packet out a certain
interface only in postrouting, by marking the packet, dnat the packet, then
forcing  the packet -o eth1.x based on the mark.

The only other way I could see to do this, would be to have seperate routing
tables set up for each client on the same firewall - (each client can have
multiple vlans) - and a virtual gateway to route between them. ... But I
don't think this is possible... at least I've never seen it done.

Ramin how would the packet know how to get to it's destination? - even if a
postrouting rule is applied - as I understand it, a packet will transverse
down the routing table until it finds a matching route, and then route
itself using that entry in the table.

Basically I want to enable an external client from anywhere on the internet,
to be able to access that server 192.168.10.5 on Client 2. (see diagram).

Ramin say the packet transverses the routing table until it finds a matching
route to 192.168.10.5 (which it'll find at position 1:
192.168.10.0    10.1.1.1	  255.255.255.224	U	0	 0	    0	eth1.1

That's fine, but the postrouting rule will tell it to go out interface
eth1.5. What's going to happen then? - will the packet just get dropped?
will it really get forced out eth1.5 like it's supposed to, and does it even
remember the routing table says it's going to go out eth1.1 postrouting
anyway?

Thanks in advance everyone,

	Damien Mason
	SuSE Asia-Pacific
	kinetic@suse.net.au
	http://www.suse.net.au./


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Chris Wilson
Sent: Friday, 25 July 2003 11:54 PM
To: Ramin Dousti
Cc: Damien Mason; netfilter@lists.netfilter.org
Subject: Re: VLANs and DNAT


Hi Ramin,

> > > But I cannot specify an interface -i eth1.2 in the prerouting, because
> > > it occurs pre-routing?
>
> This is a typo. What he meant was "-o"...

OK, I see now.

Damien, how about you forget about having identical routes on the two
separate VLANs, which is likely to give you trouble anyway, and have
static host routes to the individual servers on each VLAN. Then you will
know from the new destination address (e.g. 192.168.50.10 in your example)
exactly which VLAN the packet will be routed out over, because there is
just one host route which it could take. So you don't need to match the
destination interface name at all.

Cheers, Chris.
--
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |







