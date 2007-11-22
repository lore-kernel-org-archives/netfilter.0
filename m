From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Is it possible to do bonding/connection teaming with
	non-ethernet devices?
Date: Thu, 22 Nov 2007 09:25:49 +0200
Message-ID: <1195716349.2317.8.camel@localhost.localdomain>
References: <4744413F.1000700@aitel.hist.no>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4744413F.1000700@aitel.hist.no>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Helge Hafting <helge.hafting@aitel.hist.no>
Cc: netfilter@vger.kernel.org

=F7 =F3=D2=C4, 21/11/2007 =D7 15:31 +0100, Helge Hafting =D0=C9=DB=C5=D4=
:
> I am trying to set up a mobile router using linux. It connects to=20
> several ISPs
> using 3G connections, and offers a NATed wireless network for clients=
=2E
>=20
> I wish to utilize the bandwith when all ISPs are available, and
> be able to provide internet access for all as long as at least one
> ISP is available.

If I am correct setting several default routes with equal metric value
will do what you want. This will do load ballancing between several
available connections.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

