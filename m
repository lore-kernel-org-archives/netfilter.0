From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Port Forwarding Question
Date: Mon, 18 May 2009 10:03:35 +0300
Message-ID: <1242630215.4042.0.camel@casper.meteor.dp.ua>
References: <8ec0428d0905061125n7aad6c74nc3b63bfedf890fa8@mail.gmail.com>
	 <4A045660.3070605@unipex.it>
	 <8ec0428d0905171444q4e8a75dj6e60bfbab93bc75d@mail.gmail.com>
	 <8ec0428d0905171454yd2919d0o90e6977d99d626ff@mail.gmail.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ec0428d0905171454yd2919d0o90e6977d99d626ff@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

=F7 =F7=D3=CB, 17/05/2009 =D7 14:54 -0700, Aaron Clausen =D0=C9=DB=C5=D4=
:
> On Fri, May 8, 2009 at 08:57, Michele Petrazzo - Unipex
> <michele.petrazzo@unipex.it> wrote:
> > Aaron Clausen wrote:
> >>
> >>  With the 3Com router, I can, from another internal computer,
> >> access that server via the external interface (ie, by going
> >> http://publicaddress).  When I throw in my Linux router, it does n=
ot
> >> do that, and user's have to use the internal IP or host name to ac=
cess
> >> the device.
> >>
> >
> > What rules have you wrote?
> > an
> > iptables -t nat -A PREROUTING -s local_addrs/mask -d ip_addrs \
> >         -p tcp --dport http -j DNAT --to-destionation internal_web
> > and the respective
> > iptables -t nat -A POSTROUTING -d internal_web -p tcp --dport http =
-j SNAT
> > --to-source gw_ip
> >
> > must to the trick.
> >
> > So the request stay inside the lan and there is no "loops"
>=20
> How do write this if the WAN IP is supplied via DHCP?

-j MASQUERADE

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

