From: "Hatch, Ryan" <rhatch@leadership-solutions.net>
Subject: RE: IP masquerading and second ISP line questions
Date: Sun, 16 May 2004 13:42:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <688BD1502D7CA547800722B3501F62BB017C8F91@ms03.mailstreet2003.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> > > Hello all,
> > >
> > > I am running iptables on my fedora box to do ip masquerading for=20
> > > my internal network as well as 1 to 1 NAT for two windows terminal
> servers.
> > >
> > > #1, I am using a Checkpoint SecureClient to log into my VPN at my
> office
> > > (not on one of the two terminal servers).  Since I switched to
> iptables
> > to
> >
> > Switched from what?   (Just out of interest, I don't think it
matters to
> > this
> > question.)
>=20
> I should have made that more clear...I switched from PIX!

One more thing!  While I was using PIX, I never had the SecureClient
reconnect problem.  When using the PIX, I was also doing 1:many NAT.
That has made me start to think that I might be doing something screwy
with the way I am doing my masquerading now.  What do you think?

>=20
> >
> > > handle my ip masquerading, it has periodically booted me out of my
> > network
> > > forcing me to re-authenticate.  I had heard that there were more=20
> > > than
> > one
> > > ways to do IP sharing/masquerading.  Is the -A POSTROUTING -o eth0

> > > -j MASQUERADE the preferred method to do this?
> >
> > It's generally recommended that if you have a static IP address=20
> > (which
> you
> > appear to have), then you use SNAT instead of MASQUERADE, however=20
> > this
> is
> > purely for a (very modest) performance improvement; it doesn't=20
> > change
> the
> > functionality in any way.
> >
> So, in order to do this sort of static NATing, what sort of command=20
> would I use to to replace the -A POSTROUTING -o eth0 -j MASQUERADE? =20
> Would sensibily, it seems like I should do something like this:
>=20
> -A POSTROUTING -s 192.168.0.0/24 -j SNAT -o eth1 --to-source 1.2.3.5
>=20
> Is that more or less what you were talking about?
>=20
> > If you actually have a dynamic IP address on your external=20
> > interface,
> then
> > you
> > have to use MASQUERADE, but this fact would also be the cause of you

> > losing authentication on the SecureClient as well, because it would=20
> > suddenly
> find
> > itself talking to a new address from time to time.
>=20
> Yeah, I actually do have a bunch of statics.  I don't think that my=20
> SecureClient problem is a function of the IP addresses.  I think that=20
> it has to do with NAT.  From what I can tell, it is a common problem=20
> that many IPSec VPN clients have when working behind firewalls/routers

> using masquerading NAT. Its seems that the common workaround is to do=20
> UDP encapsulation--something that my particular client does not=20
> support.  I might end up trying to do 1:1 on it.
>=20
> >
> > > #2, I hope this is feasible--it is kind of a tricky one.  I have a
> third
> > > interface on my iptables box (not indicated on my diagram) that is

> > > connected to a cable modem (as a backup).  Since it is just=20
> > > sitting
> > there
> > > all day long not doing anything, I would love to use it from a few

> > > of
> my
> > > boxes to handle my bittorrent/ftp traffic.  Is it possible to do a
> > similar
> > > thing to what I am doing with my squid proxy to automatically=20
> > > route bittorrent or ftp traffic through eth2 instead of the
default eth0?
> > Could
> > > somebody shed some light on that one for me?
> >
> > Yes.   Set up another route using the iproute2 tools available from
> > http://lartc.org - for what you want, the best solution is probably=20
> > to MARK the packets you want to go up the cable modem in netfilter,=20
> > and then
> route
> > the marked packets with the appropriate iproute2 tables.
>=20
> Yeah, I've looked there....it seems like a slightly complex process.
> Perhaps a project for next weekend!
>=20
> Thanks,
> Ryan



