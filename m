From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 11:42:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008601c417cd$9900d680$de0aa8c0@comp>
References: <40696C1A.5080400@personalsoft.com.br> <200404010937.47442.Antony@Soft-Solutions.co.uk> <004301c417c7$232981b0$de0aa8c0@comp> <200404011005.30735.Antony@Soft-Solutions.co.uk>
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

> > > It is normally recommended *not* to do filtering in the nat or =
mangle
> > > tables, however in this case if you really want to do what you say =
then
> > > that is the solution.
> > >
> > > iptables -I PREROUTING -t nat -s 192.168.1.0/24 -d 192.168.10.10 =
-p tcp
> > > --dport 80 -j DROP
> > >
> > > Note the -I which inserts the rule before the prerouting rule you =
listed
> > > above.
> >
> > Thanks.
> >
> > > however in this case if you really want to do what you say then =
that is
> > > the solution.
> >
> > Is there another and better way to redirect traffic to the inside ?
>=20
> Well, DNAT is normally used to map externally-accessible public IPs to =
real=20
> internal systems on non-routable 10.x.y.z, 172.16.a.b or 192.168.c.d=20
> addresses, therefore the problem never arises (since people across the =

> Internet can't send packets to the real private addresses even if they =
knew=20
> what they were).
>=20
> There's isn't a "better" way to redirect traffic to other IP =
addresses,=20
> however why do you think it's a problem for people to use the "real" =
address=20
> instead of the one you're telling them to use.   They have access to =
the=20
> machine, so why does it really matter which address they use to =
connect to=20
> it?
>=20
> Regards,
>=20
> Antony.
>=20

The problem is that many hosts, with this setup, actually is connected =
to the=20
internet using a public ip, and beeing able to resolve internal =
ip-information is not=20
good.

Bo



