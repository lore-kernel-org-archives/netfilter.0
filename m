From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: setting fwmark in output chain for policy routing
Date: Thu, 27 Jun 2002 16:36:37 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43.0206271618390.4084-100000@netmonster.pakint.net>
References: <20020627173226.GO31466@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627173226.GO31466@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: Joe Patterson <jpatterson@asgardgroup.com>, netfilter@lists.samba.org

On Thu, 27 Jun 2002, Ramin Alidousti wrote:

> Hi Matthew,
>
> After reading your explanation I'm still in the dark.
>
> 1) Joe's question was: If one wants to mark the locally
> generated packets based on the src address in the mangle
> table, OUTPUT chain (that is where the routing decision
> has not yet been made)

Actually the routing decision _has_ been made at this point. At least the
first routing decision has been made. Whenever a machine process creates
an output packet the mere act of creating the packet forces a routing
decision to be made in order to set the SRC address of the packet. So
packet created by a local process enters the OUTPUT chain with a routing
decision already made and a src address already assigned. Sense?

> can it be the case that you
> mark a packet because the src at that point was A
> and when the routing decision is made that src becomes B.

When a packet is marked in OUTPUT I believe that it then is "routed" again
in order to determine the pathing. I suspect we are in violent agreement
using different terminology. To me a 'routing decision' is when a packet
has any interaction with the RPDB. This includes the simple act of
creating a packet which consults the RPDB to determine src address (see
below), and also includes the 'pathing' act which determines which
interface a packet egresses etc.. I suspect that when you say 'routing
decision' you are thinking of what I call 'pathing'. I hope we are not too
far from each other on that front.

> Or another version of the question has nothing to
> do with netfilter and marking: when you want to
> make a routing decision based on the src for a locally
> generated packet, how can you do that when you have
> entries like:
>
> 10.0.5.0/24 dev vlan5  proto kernel  scope link  src 10.0.5.2
> 10.0.6.0/24 dev vlan6  proto kernel  scope link  src 10.0.6.2
>
> Let's say you decide to route the packets with src 10.0.5.2
> to go out through vlan6, doesn't the routing subsystem change
> the src to 10.0.6.2, as the entry suggests.

No - Not if the packet was _already_ created. The 'src' parameter to 'ip
route' exists to define the src address given to a packet iff no other
mechanism exists to define the src address. In other words the src
parameter only will come into play when a local packet creation process
does not specify a src address (this is true for the vast majority of
daemons/processes). This is why the 'dev lo' trick works so well. So if
you have a mechanism/process that specifies the src address (ref nmap or
related utilities) then the src parameter will be ignored. fe: This is the
case that occurs where you have multiple ip addrs that you use with Apache
Virtual Hosts - Apache will set the src addr on the outgoing packets and
even if your route to that destination has a different src parameter it
will be ignored as the existing src address takes precedence. sense?

> 2) And my question was: a set of "equalize" routes towards a
> certain destination doesn't seem to work. How come?

That's still a problem and I do not know the answer at this time (honestly
have not really researched it aside from - 'huh - it does not work'). I
remember discussing this back in Jan or Feb and I would have to go look to
find the references. It worked on 2.2.x and I know I had it working in
2.4.0 but have not been able to pin down when it broke in the 2.4
series...  sorry.. :-{

> Ramin
>
> On Wed, Jun 26, 2002 at 08:51:35AM -0500, Matthew G. Marsh wrote:
>
> >
> > Hi! I just got back Monday from a trip. Finally got to this message...
> > Hope I'm not too late. Joe - could you give me the skinny on what sequence
> > of rules you are using?
> >
> > There are several distinct interaction points between NetFilter and
> > Netlink (ip utility stuff). Especially if you do some NAT wherein you end
> > up calling the route structure yet again.
> >
> > Some answers included below:
> >
> > On Wed, 12 Jun 2002, Ramin Alidousti wrote:
> >
> > > Good question. It gets even worse: when I add a set
> > > of "equalize" routes towards a certain destination,
> > > it only round-robins for the transit packets but the
> > > locally generated packets keep going out through the
> > > same interface all the time, even if the src is set
> > > to a loopback (dummy) address.
> > >
> > > Here is Matthew Marsh the man!!
> > > Matthew, can you shed some light on these issues?
> > >
> > > Ramin
> > >
> > > On Tue, Jun 11, 2002 at 05:51:00PM -0400, Joe Patterson wrote:
> > >
> > > > I've got a kind of an odd setup, and am curious about something.
> > > >
> > > > I've seen some references that say that one should be able to set an fwmark
> > > > on a packet in the mangle/OUTPUT chain, and then have the linux policy
> > > > routing database determine the route to use based on that fwmark.  I'm a
> > > > little confused as to the order in which this happens.  I would think that
> > > > in order to be able to hand a packet to netfilter, it'd have to be a pretty
> > > > complete packet, including things like the source IP address.  However, the
> > > > source address of a localy generated packet is determined by which route it
> > > > matches.  But you can't know which route it matches unless you have all of
> > > > the information, such as the fwmarks.
> >
> > Yep - The actual best diagram to refer to is the old IPCHAINS packet path
> > diagram as it does show the dual reference to the route structure.
> > Essentially what happens is that the packet is generated and when it is
> > generated the IP addressing parts of the header aer installed - BUT -
> > the packet is issued from "localhost" and thus appears to be "coming from"
> > loopback interface. Then it enters OUTPUT and can get mangled. However the
> > RPDB is then called again as the packet addressing has changed. ?sense?
> >
> > > > It seems to me to be a bit of a chicken-and-egg thing.  Or is the source
> > > > address determined first, based on the route that the packet will *probably*
> > > > take, then it's shipped through mangle/OUTPUT, then the real routing
> > > > decision is made?
> >
> > No such "real" routing ;-}
> >
> > Basically all routing is real. Packet gen -> addressing applied; Packet
> > OUTPUT Mangle -> RPDB call (routing); Packet leaves -> interface.
> >
> > Bear in mind that the Linux IPv4 Network stack is completely
> > {internalized,virtualized}. An IPv4 packet "exists" with reference to the
> > service it defines and has nothing whatsoever to do with the physical
> > interfaces of the system. When you start then considering where in this
> > scheme the NetFilter hooks are performed you can see that the interfaces
> > are not to be considered and that the RPDB perfuses within and around the
> > NetFilter structure. Thus the concept that the packet can only be "routed"
> > at a specific point is not quite true except in the "this line of code
> > does..." sense. In reality the NetFilter architecture handles the packet
> > at specific points within the network stack. The network stack in between
> > these points taps directly into the RPDB becuase the RPDB essentially "is"
> > the network stack and thus the "routing" process is continuous. Hmmm - eh
> > - examples are easier to understand for concreteness.
> >
> > > > This is kind of halfway between netfilter and lartc, but I figured someone
> > > > here might know better than I.
> > > >
> > > > Thanks,
> > > >
> > > > -Joe Patterson, CCNP, CISSP
> > > > Senior Security Engineer
> > > > The Asgard Group
> > > > (954)343-4370 x102
> > > > jpatterson@asgardgroup.com
> >
> > Feel free to holler my way... Thanks!
> >
> > --------------------------------------------------
> > Matthew G. Marsh,  President
> > Paktronix Systems LLC
> > 1506 North 59th Street
> > Omaha  NE  68104
> > Phone: (402) 932-7250 x101
> > Email: mgm@paktronix.com
> > WWW:  http://www.paktronix.com
> > --------------------------------------------------
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


