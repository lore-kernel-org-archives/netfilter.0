From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How to drop existing connections
Date: Mon, 07 Apr 2008 14:59:23 +0300
Message-ID: <1207569563.5879.39.camel@casper.meteor.dp.ua>
References: <316483.74640.qm@web65716.mail.ac4.yahoo.com>
	 <1207560499.5879.22.camel@casper.meteor.dp.ua>
	 <alpine.LNX.1.10.0804071137480.17722@fbirervta.pbzchgretzou.qr>
	 <1207562913.5879.32.camel@casper.meteor.dp.ua>
	 <alpine.LNX.1.10.0804071307390.17722@fbirervta.pbzchgretzou.qr>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804071307390.17722@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

=F7 =F0=CE=C4, 07/04/2008 =D7 13:11 +0200, Jan Engelhardt =D0=C9=DB=C5=D4=
:
> On Monday 2008-04-07 12:08, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=
=D4=C9=CB wrote:
>=20
> >=F7 =F0=CE=C4, 07/04/2008 =D7 11:39 +0200, Jan Engelhardt =D0=C9=DB=C5=
=D4:
> >> >
> >> >You can use conntrack utility to remove conntrack entry,
> >>=20
> >> This only removes the conntrack entry of course, and
> >> does not induce a TCP reset.
> >>=20
> >> >if you also
> >> >drop INVALID packets with iptables this will let you kill connect=
ion.
> >>=20
> >> When more packets come in, the 'connection' will go NEW, not INVAL=
ID.
> >
> >Maybe, I remember reading this solution somewhere.
>=20
> This solution requires that you only accept NEW connections
> that have SYN set. Something like
>=20
>   -m conntrack --ctstate ESTABLISHED -j ACCEPT
>   -p tcp --syn -m conntrack --ctstatus NEW -j ACCEPT
>   -p udp -m conntrack --ctstatus NEW -j ACCEPT
>   -p tcp -j REJECT --reject-with tcp-reset
>   -j REJECT
>=20
> yes, that is indeed a good idea to do a tcpkill on connections
> using conntrack :-)

That is it.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

