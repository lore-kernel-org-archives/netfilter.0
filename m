From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 13:30:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c2b113$e2181800$0100a8c0@zultys.com>
References: <20021231205417.GQ677@ns>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021231205417.GQ677@ns>
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


I think that we need to clearly define the terminology for Kevin.

Interface - this is a tricky definition. One can refer to the PHYSICAL
interface (i.e. ethernet port) as an interface. You can also refer to
the LOGICAL interface (i.e. the one to which you allocate an IP
address). These two are DIFFERENT. You _might_ be able to make things
clearer by using "<ethernet> port" for the physical interface, and "<ip>
interface" for the logical interface.

(PDU = protocol data unit)
The names used to refer to the unit of data transfer are different at
different layers:
Frames = layer 2 PDUs
Packets = layer 3 PDUs

Bridge - layer 2 device i.e. "link control" layer i.e. transfers frames
across physical interfaces.
Router - layer 3 device i.e. network later i.e. transfers packets across
logical interfaces.

When you selectively tranfer frames (layer 2 PDUs) across a bridge, its
called filtering (frames).
When you selectively transfer packets (layer 3 PDUs) across a firewall,
its called firewalling/packet filtering.

I think I got it right :D.

Hence when you downsize your (layer 3) router into a (layer 2) bridge,
your neo-bridge becomes a layer 2 entity and disappears from the layer 3
i.e. it is no longer visible at layer 3. Therefore no firewalling, no
NAT.

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Stephen Frost
> Sent: Tuesday, December 31, 2002 12:54 PM
> To: Kevin McConnell
> Cc: Brad Chapman; Afshin Lamei; netfilter@lists.netfilter.org
> Subject: Re: Doing Bridge with firewalling
> 
> 
> * Kevin McConnell (kevymac@yahoo.com) wrote:
> > 
> > --- Stephen Frost <sfrost@snowman.net> wrote:
> > > The two havn't got anything to do with each other.
> > > NATing is modifying
> > > packets as they pass through the router.  Addressing
> > > is the IP address
> > > and whatnot to access the firewall/router.  One does
> > > not require the
> > > other.
> > 
> > This leads me to another question then. What are the 
> advantages of not 
> > having an IP address assigned to
> > interface(s) of the firewall? Like for instance, if my firewall was 
> > the gateway to the outside world, how would I tell machines 
> behind the 
> > firewall to get out to the outside world if they didn't 
> have a default
> > route pointing to the internal address of the
> > firewall? Also, how would packets that hit the
> > firewall get routed through the other side?
> 
> A router is not a bridge.  The two are different things.  
> You're thinking of things in terms of a 'router'.  In order 
> for your computers to reach the external network they have to 
> go through a router, true.  A firewall can be implemented as 
> part of a router or as part of a bridge. The only requirement 
> being that the packets are required to pass through the 
> device.  If you implemented your firewall as a bridge then 
> the machines on the network wouldn't 'see' it, they would 
> point their default routes to the router on the opposite side 
> of the bridge.
> 
> I think the critical point here is that you need to 
> understand what a bridge is and how it works and how it's 
> different from a router.
> 
> 	Stephen
> 


