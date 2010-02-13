From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 04:13:22 +0200
Message-ID: <1266027202.3899.1.camel@casper.meteor.dp.ua>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1266016722.2980.159.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Guido Trentalancia <guido@trentalancia.com>
Cc: Bojan Sukalo <shukalo83@gmail.com>, netfilter@vger.kernel.org

=F7 =F3=D5=C2, 13/02/2010 =D7 00:18 +0100, Guido Trentalancia =D0=C9=DB=
=C5=D4:
> On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
> > Telnet from inside machine to www.google.com 80 works but I can't g=
et
> > any messages after I get connected (Just successfull telnet
> > connection)
>=20
> You can't telnet www.google.com on port 80, as google is not a telnet
> server and therefore it can't deal with the telnet protocol. Google
> deals with the http protocol.

Why one can't use telnet program to test http server?

> If you can use your web browser then you are fine, it means NAT is
> working.
>=20
> You could try telnet or other TCP/IP protocols but you need appropria=
te
> servers for them.
>=20
> If you want to try telnet and you don't know any telnet server, you
> could try telnet on port 25 to your smtp mail server. At least you ca=
n
> have a basic dialogue with it (refer to the smtp protocol, there are
> HELO, MAIL, QUIT and other commands that you can issue).
>=20
> I hope it helps.
>=20
> Bye,
>=20
> Guido
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

