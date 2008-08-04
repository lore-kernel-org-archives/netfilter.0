From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Mon, 04 Aug 2008 10:26:12 +0300
Message-ID: <1217834772.4178.7.camel@casper.meteor.dp.ua>
References: <000501c8edf5$19903230$4cb09690$@com>
	 <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com>
	 <000001c8ee61$67e4b7a0$37ae26e0$@com> <4889ECB9.3090206@riverviewtech.net>
	 <000801c8f0b6$7a804580$6f80d080$@com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000801c8f0b6$7a804580$6f80d080$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: barich@trisectrix.com
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

=F7 =F0=CE=C4, 28/07/2008 =D7 09:33 -0400, Barry A Rich =D0=C9=DB=C5=D4=
:
> > -----Original Message-----
> > From: netfilter-owner@vger.kernel.org=20
> > [mailto:netfilter-owner@vger.kernel.org]
> > On Behalf Of Grant Taylor
> > Sent: Friday, July 25, 2008 11:10 AM
> >=20
> > Given that the source IP of your packets can change mid stream, you=
=20
> > could use the "nth" match extension.  Using "nth" you would match=20
> > packets to decide how to mark them and then use the mark to determi=
ne=20
> > what routing table to use which would ultimately decide which outbo=
und=20
> > path to use.
>=20
> The following setup does load balancing across the uplinks. However, =
the
> source address in the outgoing packets is not being SNAT'ed. Any
> suggestions?

Only first packet of udp "connection" is reaching the rule in the nat
table and does the job, since nat occurs for all packets in this
connection rest of rules would not match.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

