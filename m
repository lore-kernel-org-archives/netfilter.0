From: "Barry A Rich" <barich@trisectrix.com>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Mon, 4 Aug 2008 11:48:04 -0400
Message-ID: <000c01c8f649$7bd91950$738b4bf0$@com>
References: <000501c8edf5$19903230$4cb09690$@com>	 <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>	 <000001c8ee61$67e4b7a0$37ae26e0$@com> <4889ECB9.3090206@riverviewtech.net>	 <000801c8f0b6$7a804580$6f80d080$@com>	 <1217834772.4178.7.camel@casper.meteor.dp.ua>	 <000301c8f63a$00215660$00640320$@com> <1217860886.4178.27.camel@casper.meteor.dp.ua>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1217860886.4178.27.camel@casper.meteor.dp.ua>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>
Cc: casper@meteor.dp.ua

> -----Original Message-----
> From: =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB [mailto:ca=
sper@meteor.dp.ua]
> Sent: Monday, August 04, 2008 10:41 AM
> To: barich@trisectrix.com
> Cc: 'Mail List - Netfilter'
> Subject: RE: UDP stream load balancing across multiple uplinks
>=20
> =F7 =F0=CE=C4, 04/08/2008 =D7 09:57 -0400, Barry A Rich =D0=C9=DB=C5=D4=
:
> > > -----Original Message-----
> > > From: netfilter-owner@vger.kernel.org
> > [mailto:netfilter-owner@vger.kernel.org]
> > > On Behalf Of ??????????? ??????
> > > Sent: Monday, August 04, 2008 3:26 AM
> > > To: barich@trisectrix.com
> > > Cc: 'Mail List - Netfilter'
> > > Subject: RE: UDP stream load balancing across multiple uplinks
> > >
> > > =F7 =F0=CE=C4, 28/07/2008 =D7 09:33 -0400, Barry A Rich =D0=C9=DB=
=C5=D4:
> > > > > -----Original Message-----
> > > > > From: netfilter-owner@vger.kernel.org
> > > > > [mailto:netfilter-owner@vger.kernel.org]
> > > > > On Behalf Of Grant Taylor
> > > > > Sent: Friday, July 25, 2008 11:10 AM
> > > > >
> > > > > Given that the source IP of your packets can change mid strea=
m,
you
> > > > > could use the "nth" match extension.  Using "nth" you would m=
atch
> > > > > packets to decide how to mark them and then use the mark to
determine
> > > > > what routing table to use which would ultimately decide which
outbound
> > > > > path to use.
> > > >
> > > > The following setup does load balancing across the uplinks. How=
ever,
the
> > > > source address in the outgoing packets is not being SNAT'ed. An=
y
> > > > suggestions?
> > >
> > > Only first packet of udp "connection" is reaching the rule in the=
 nat
> > > table and does the job, since nat occurs for all packets in this
> > > connection rest of rules would not match.
> >
> > I understand better. I removed the following rule:
> >
> > #iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -j NOT=
RACK
> >
> > The connection is tracked and the outgoing UDP packets are SNAT-ed.
However,
> > the source address for all UDP packets is the IP address of the upl=
ink
> > assigned to the connection (regardless of the uplink they actually =
are
> > sent).
> >
> > Is there a way to SNAT without connection tracking?
>=20
> Sure:
>=20
> http://linux-ip.net/html/nat-stateless.html

Stateless NAT with IPROUTE2 does not appear to be selective. I only wan=
t to
SNAT UDP packets with a specific source port.


