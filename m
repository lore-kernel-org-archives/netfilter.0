From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Mon, 04 Aug 2008 20:46:43 +0300
Message-ID: <1217872003.4178.32.camel@casper.meteor.dp.ua>
References: <000501c8edf5$19903230$4cb09690$@com>
	 <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>
	 <000001c8ee61$67e4b7a0$37ae26e0$@com> <4889ECB9.3090206@riverviewtech.net>
	 <000801c8f0b6$7a804580$6f80d080$@com>
	 <1217834772.4178.7.camel@casper.meteor.dp.ua>
	 <000301c8f63a$00215660$00640320$@com>
	 <1217860886.4178.27.camel@casper.meteor.dp.ua>
	 <000c01c8f649$7bd91950$738b4bf0$@com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000c01c8f649$7bd91950$738b4bf0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: barich@trisectrix.com
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

=F7 =F0=CE=C4, 04/08/2008 =D7 11:48 -0400, Barry A Rich =D0=C9=DB=C5=D4=
:
> > -----Original Message-----
> > From: =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB [mailto:=
casper@meteor.dp.ua]
> > Sent: Monday, August 04, 2008 10:41 AM
> > To: barich@trisectrix.com
> > Cc: 'Mail List - Netfilter'
> > Subject: RE: UDP stream load balancing across multiple uplinks
> >=20
> > =F7 =F0=CE=C4, 04/08/2008 =D7 09:57 -0400, Barry A Rich =D0=C9=DB=C5=
=D4:
> > > > -----Original Message-----
> > > > From: netfilter-owner@vger.kernel.org
> > > [mailto:netfilter-owner@vger.kernel.org]
> > > > On Behalf Of ??????????? ??????
> > > > Sent: Monday, August 04, 2008 3:26 AM
> > > > To: barich@trisectrix.com
> > > > Cc: 'Mail List - Netfilter'
> > > > Subject: RE: UDP stream load balancing across multiple uplinks
> > > >
> > > > =F7 =F0=CE=C4, 28/07/2008 =D7 09:33 -0400, Barry A Rich =D0=C9=DB=
=C5=D4:
> > > > > > -----Original Message-----
> > > > > > From: netfilter-owner@vger.kernel.org
> > > > > > [mailto:netfilter-owner@vger.kernel.org]
> > > > > > On Behalf Of Grant Taylor
> > > > > > Sent: Friday, July 25, 2008 11:10 AM
> > > > > >
> > > > > > Given that the source IP of your packets can change mid str=
eam,
> you
> > > > > > could use the "nth" match extension.  Using "nth" you would=
 match
> > > > > > packets to decide how to mark them and then use the mark to
> determine
> > > > > > what routing table to use which would ultimately decide whi=
ch
> outbound
> > > > > > path to use.
> > > > >
> > > > > The following setup does load balancing across the uplinks. H=
owever,
> the
> > > > > source address in the outgoing packets is not being SNAT'ed. =
Any
> > > > > suggestions?
> > > >
> > > > Only first packet of udp "connection" is reaching the rule in t=
he nat
> > > > table and does the job, since nat occurs for all packets in thi=
s
> > > > connection rest of rules would not match.
> > >
> > > I understand better. I removed the following rule:
> > >
> > > #iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -j N=
OTRACK
> > >
> > > The connection is tracked and the outgoing UDP packets are SNAT-e=
d.
> However,
> > > the source address for all UDP packets is the IP address of the u=
plink
> > > assigned to the connection (regardless of the uplink they actuall=
y are
> > > sent).
> > >
> > > Is there a way to SNAT without connection tracking?
> >=20
> > Sure:
> >=20
> > http://linux-ip.net/html/nat-stateless.html
>=20
> Stateless NAT with IPROUTE2 does not appear to be selective. I only w=
ant to
> SNAT UDP packets with a specific source port.

Maybe it is possible to use FWMARK, not sure...

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

