From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 14:43:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <051601c417e6$e6395350$de0aa8c0@comp>
References: <40696C1A.5080400@personalsoft.com.br> <200404011005.30735.Antony@Soft-Solutions.co.uk> <008601c417cd$9900d680$de0aa8c0@comp> <200404011055.45703.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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

> > > Well, DNAT is normally used to map externally-accessible public =
IPs to
> > > real internal systems on non-routable 10.x.y.z, 172.16.a.b or =
192.168.c.d
> > > addresses, therefore the problem never arises (since people across =
the
> > > Internet can't send packets to the real private addresses even if =
they
> > > knew what they were).
> > >
> > > There isn't a "better" way to redirect traffic to other IP =
addresses,
> > > however why do you think it's a problem for people to use the =
"real"
> > > address instead of the one you're telling them to use.   They have =
access
> > > to the machine, so why does it really matter which address they =
use to
> > > connect to it?
> >
> > The problem is that many hosts, with this setup, actually is =
connected to
> > the internet using a public ip, and beeing able to resolve internal
> > ip-information is not good.
>=20
> Now I'm confused.   (Easily done...)
>=20
> Were the 192.168.x.y addresses you gave in your original posting =
accurate, or=20
> just examples, and you are now saying that the source machines are =
actually=20
> systems out on the Internet somewhere with real public IPs?
>=20
> Please clarify - who are you worried about discovering the real =
internal IP=20
> addresses of your machines, and where are they located on the network? =
  Can=20
> they really send packets to the private IP address as you outlined in =
your=20
> original posting?
>=20
> My expectation is that people "out on the Internet" cannot connect to =
your=20
> private IPs (because the addresses are non-routable), therefore the =
question=20
> doesn't arise for them.   People associated with your local network =
(ie:=20
> inside your connection point to the Internet) surely aren't a problem =
even if=20
> they do discover the real private IP address?   Or am I missing =
something=20
> here about what you are trying to secure from whom?
>=20
> Hope that's clear....
>=20
> Regards,
>=20
> Antony.
>=20

Well, the setup is used on a number of hosts located in a number of =
different=20
environments. Some have public ip's, some don't.=20

> inside your connection point to the Internet) surely aren't a problem =
even if=20
> they do discover the real private IP address?   Or am I missing =
something=20
That just true in a very simple setup. If different people/compagnies =
are sharing=20
a "backbone" (using maybe 192.168.1.0 as the lan behind a commen =
internet router)
the problem is maybe not an internet problem, but an "internal" problem. =
Should
one trust all the other compagnies on the backbone, of course not.
So the general rule is ALWAYS to stop any leaking if it's possible.

I have solved the problem by always running a second -j DROP rule in the =

PREROUTING chain (as you suggested).


Bo



