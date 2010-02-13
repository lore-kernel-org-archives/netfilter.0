From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 05:26:14 +0100
Message-ID: <1266035174.2980.178.camel@tesla.lan>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1266027202.3899.1.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?= =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

On Sat, 2010-02-13 at 04:13 +0200, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=
=CF=D3=D4=C9=CB wrote:
> =F7 =F3=D5=C2, 13/02/2010 =D7 00:18 +0100, Guido Trentalancia =D0=C9=DB=
=C5=D4:
> > On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
> > > Telnet from inside machine to www.google.com 80 works but I can't=
 get
> > > any messages after I get connected (Just successfull telnet
> > > connection)
> >=20
> > You can't telnet www.google.com on port 80, as google is not a teln=
et
> > server and therefore it can't deal with the telnet protocol. Google
> > deals with the http protocol.
>=20
> Why one can't use telnet program to test http server?

Just because one won't get anything more than just "connected". So it i=
s
not a very useful way to test HTTP nor NAT...

Guido

