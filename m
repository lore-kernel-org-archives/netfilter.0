From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: setting fwmark in output chain for policy routing
Date: Wed, 26 Jun 2002 08:51:35 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43.0206260836130.5405-100000@netmonster.pakint.net>
References: <20020612145516.GG21405@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020612145516.GG21405@cannon.eng.us.uu.net>
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


Hi! I just got back Monday from a trip. Finally got to this message...
Hope I'm not too late. Joe - could you give me the skinny on what sequence
of rules you are using?

There are several distinct interaction points between NetFilter and
Netlink (ip utility stuff). Especially if you do some NAT wherein you end
up calling the route structure yet again.

Some answers included below:

On Wed, 12 Jun 2002, Ramin Alidousti wrote:

> Good question. It gets even worse: when I add a set
> of "equalize" routes towards a certain destination,
> it only round-robins for the transit packets but the
> locally generated packets keep going out through the
> same interface all the time, even if the src is set
> to a loopback (dummy) address.
>
> Here is Matthew Marsh the man!!
> Matthew, can you shed some light on these issues?
>
> Ramin
>
> On Tue, Jun 11, 2002 at 05:51:00PM -0400, Joe Patterson wrote:
>
> > I've got a kind of an odd setup, and am curious about something.
> >
> > I've seen some references that say that one should be able to set an fwmark
> > on a packet in the mangle/OUTPUT chain, and then have the linux policy
> > routing database determine the route to use based on that fwmark.  I'm a
> > little confused as to the order in which this happens.  I would think that
> > in order to be able to hand a packet to netfilter, it'd have to be a pretty
> > complete packet, including things like the source IP address.  However, the
> > source address of a localy generated packet is determined by which route it
> > matches.  But you can't know which route it matches unless you have all of
> > the information, such as the fwmarks.

Yep - The actual best diagram to refer to is the old IPCHAINS packet path
diagram as it does show the dual reference to the route structure.
Essentially what happens is that the packet is generated and when it is
generated the IP addressing parts of the header aer installed - BUT -
the packet is issued from "localhost" and thus appears to be "coming from"
loopback interface. Then it enters OUTPUT and can get mangled. However the
RPDB is then called again as the packet addressing has changed. ?sense?

> > It seems to me to be a bit of a chicken-and-egg thing.  Or is the source
> > address determined first, based on the route that the packet will *probably*
> > take, then it's shipped through mangle/OUTPUT, then the real routing
> > decision is made?

No such "real" routing ;-}

Basically all routing is real. Packet gen -> addressing applied; Packet
OUTPUT Mangle -> RPDB call (routing); Packet leaves -> interface.

Bear in mind that the Linux IPv4 Network stack is completely
{internalized,virtualized}. An IPv4 packet "exists" with reference to the
service it defines and has nothing whatsoever to do with the physical
interfaces of the system. When you start then considering where in this
scheme the NetFilter hooks are performed you can see that the interfaces
are not to be considered and that the RPDB perfuses within and around the
NetFilter structure. Thus the concept that the packet can only be "routed"
at a specific point is not quite true except in the "this line of code
does..." sense. In reality the NetFilter architecture handles the packet
at specific points within the network stack. The network stack in between
these points taps directly into the RPDB becuase the RPDB essentially "is"
the network stack and thus the "routing" process is continuous. Hmmm - eh
- examples are easier to understand for concreteness.

> > This is kind of halfway between netfilter and lartc, but I figured someone
> > here might know better than I.
> >
> > Thanks,
> >
> > -Joe Patterson, CCNP, CISSP
> > Senior Security Engineer
> > The Asgard Group
> > (954)343-4370 x102
> > jpatterson@asgardgroup.com

Feel free to holler my way... Thanks!

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


