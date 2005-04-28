From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Management of bridged iptables
Date: Fri, 29 Apr 2005 00:50:04 +0200
Message-ID: <1403218a05042815502d3fe194@mail.gmail.com>
References: <0380eb44cd704cf780c1fd7f71cece5e@ebasedsecurity.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0380eb44cd704cf780c1fd7f71cece5e@ebasedsecurity.com>
Content-Disposition: inline
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
To: traef06@ebasedsecurity.com, netfilter <netfilter@lists.netfilter.org>

Why don't you give the br0 an IP !!?


On 4/27/05, traef06@ebasedsecurity.com <traef06@ebasedsecurity.com> wrote:
> Thank you.
>=20
> So, just for my clarification, if I have eth0 (outside interface) and eth=
1 as my internal interface and they both
> are used to form br0, I could assign eth0 an external IP address so that =
I can ssh into the box for management?
>=20
> Am I following his correctly?
>=20
> Then can I also assign eth1 an internal IP address so that I can manage i=
t from within as well? This won't harm the bridge
> interface br0?
>=20
> Thank you in advance for all your assistance.
>=20
>=20
> Thomas J. Raef
> e-Based Security, Inc.
> "You're either hardened, or you're hacked!"
>=20
> -------- Original Message --------
> > From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
> > Sent: Tuesday, April 26, 2005 3:32 AM
> > To: traef06@ebasedsecurity.com
> > Subject: Re: Management of bridged iptables
> >
> > You can give the firewall an IP address, on any interface, whether
> > part of the bridge or not part of the bridge.
> > This will still keep the firewall stealthy (not shown in traceroutes),
> > as that IP is not a gateway for any server !!
> >
> > On 4/26/05, traef06@ebasedsecurity.com <traef06@ebasedsecurity.com> wro=
te:
> > > I've been scouring Google searches looking for an answer. If this is =
the wrong forum, please forgive me.
> > >
> > > I want to be able to setup iptables and I guess ebtables for a bridge=
d firewall. My problem is that I also need to be able
> > > to manage this remotely like with ssh or something.
> > >
> > > How do I do this and still be able to maintain a "stealthy" firewall?
> > >
> > > Thank you in advance for any help.
> > >
> > > Thomas J. Raef
> > > e-Based Security, Inc.
> > > "You're either hardened, or you're hacked!"
> > >
> > >
> >
> >
> > --
> > Mohamed Eldesoky
> > www.eldesoky.net
> > RHCE
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

