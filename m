From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: What ICMP packets does state RELATED allow?
Date: Fri, 7 Jun 2002 10:14:06 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020607141406.GL29214@cannon.eng.us.uu.net>
References: <20020606173451.GA1551@cannon.eng.us.uu.net> <NJEFLNJDIFFNMHDEBKMJGEGADOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJGEGADOAA.jpatterson@asgardgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Patterson <jpatterson@asgardgroup.com>
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

On Thu, Jun 06, 2002 at 06:59:42PM -0400, Joe Patterson wrote:

> > You're absolutely right. An ICMP redirect is sent from one interface
> > to another interface on the _same_ subnet. In some ways it should be
> > seen as something like an ARP which has a layer 2 significance. However,
> > proxying ARP make sense but proxying (or forwarding in general) of an
> > ICMP redirect does not make sense at all. Whether it could be seen as
> > RELATED or not is sort of philosophical matter as ICMP redirect is meant
> > to _notify_ a forwarding entity of the existence of a better next-hop on
> > the _same_ subnet.
> 
> Actually, no, it's not.  It is meant to notify a *host* that is *not* a
> forwarding entity (or at least is not acting as a forwarding entity for the

Picture this:

A is an internal host. B is the masquerading gateway and C and D are the
upstream routers at the ISP's edge, sitting on the same subnet. When the
ISP sold this service, as usual, they sold it as a "one single IP host".
In the initial configuration, the ISP, which at that time had only C at
the edge, instructed the users to use C as their default gateway, but
knowing that at some point in the future they might transition this role
to a more powerful/suitable router they relied on ICMP redirect as opposed
to contacting every single customer by phone or mail about this change.

Yes, I know that these days DHCP takes care of this case but I just
wanted to give an example as of how it can be helpful.

> purposes of the packet that caused the redirect)  The assumption is that two
> forwarding entities will be exchanging routing information at a higher level

Not necessarily. There are lots of static routes out there...

> routing protocol, but that a host may not be running a routing process and
> may only have a default route.

Again, not necessarily. You could run a routing process and only receive
a default route...

> This is a subtle distinction.  Note that a
> gateway has no reliable method of determining the ip address of the last hop
> a packet came from.

True. But see the example above.

> It knows the mac address, but not the IP.  Therefore,
> there's no reliable way for one forwarding entity that recieves a packet
> with a non-local source address to know the ip address of the forwarding
> entity that it should send a redirect to if it were to desire to send such a
> redirect.  (that's an ugly sentence...)  Thus, a forwarding entity which
> might wish to send such a redirect has two choices.  It could send the
> redirect to the original source address, knowing full well that that
> original source has no way to influence the routing decision made by the
> last-hop router, or it can do what the rfc's say and ignore the situation.
> 
> > So, is this kind of thing RELATED? Yes, in the sense
> > that it is caused by the forwarding of _that_ packet and no, in the sense
> > that the same redirect could get triggered by lots of other non related
> > conn's and besides ignoring these redirects would not harm the
> > communication
> > at all.
> 
> although, when it comes right down to it, it's probably related because it's
> one of those icmp packet types that contains an ip header in the data
> portion, so it *can* be related.

Yes, but does this mean that only because it's related B should forward
this ICMP to A? Definitely not. We need to have some intelligence as to
how to interprete the related packets and what to do with them.

> And, if netfilter is running on a host and
> that host might generate traffic and send it through a non-optimal router,
> it could be usefull to accept it.  However, I can definitely see an
> opportunity for abuse in some cases,

When ICMP was being born there was lesser attention about the security
implications (just think about SNMPv1, telnet...). The network was being
considered a friend and on top of this friendly network, one was thinking
about the improvements by introducing the "control messages" to help the
IP which only has "routing" functionality.

> and the worst thing that can happen by
> completely ignoring (or dropping)  redirects is sub-optimal routing.  So
> it's probably a good idea to just drop the whole thing.

Nod.

Ramin

> -Joe

