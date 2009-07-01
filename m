From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: rate limit by MAC
Date: Wed, 01 Jul 2009 19:19:30 +0300
Message-ID: <1246465170.4124.6.camel@casper.meteor.dp.ua>
References: <4A4B42C6.4060103@msm.ru>
	 <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
	 <1125.192.168.1.3.1246463064.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1125.192.168.1.3.1246463064.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

=F7 =F3=D2=C4, 01/07/2009 =D7 16:44 +0100, Jorge Bastos =D0=C9=DB=C5=D4=
:
> > You might be able to...
> >
> > iptables -A FORWARD -m mac --mac-source <<mac address>> -m limit
> > --limit 100/s -j ACCEPT would restrict the given mac address to 100
> > packets per second... but depending on how many mac addresses you h=
ave
> > it might be too much to enter each rule...
>=20
> Sawing this thread,
> Iptables doesn't (still) have the capacity to do rate limit by itself=
,
> does it?

Depends on what the "rate" is, packets/time - yes, bytes/time - no.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

