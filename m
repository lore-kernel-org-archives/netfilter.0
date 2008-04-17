From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Thu, 17 Apr 2008 13:12:51 +0300
Message-ID: <1208427171.4114.2.camel@casper.meteor.dp.ua>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net>
	 <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr>
	 <20080310110209.GB17757@piper.oerlikon.madduck.net>
	 <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr>
	 <4806760D.3040909@rtij.nl>
	 <20080417080527.GE23974@piper.oerlikon.madduck.net>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080417080527.GE23974@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: martin f krafft <madduck@madduck.net>
Cc: Martijn Lievaart <m@rtij.nl>, Jan Engelhardt <jengelh@computergmbh.de>, netfilter discussion list <netfilter@vger.kernel.org>

=F7 =FE=D4=D7, 17/04/2008 =D7 10:05 +0200, martin f krafft =D0=C9=DB=C5=
=D4:
> also sprach Martijn Lievaart <m@rtij.nl> [2008.04.16.2356 +0200]:
> >> echo "Applying new rules...";
> >> iptables-restore <new.txt;
> >> if [ "$?" -ne 0 ]; then
> >> 	echo "Dude, that failed horribly. (Old rules still intact.)";
> >> 	exit 1;
> >> fi
> >
> > Are you sure? I think it may have committed some tables already and=
 =20
> > errored on another.
>=20
> No, I am not sure. But wouldn't that be a bug? iptables-restore
> gives the impression to be transaction-oriented. It should be
> all-or-nothing, I think.

By default iptables-save generates file which COMMITs after each table.
Is it possible to COMMIT once for all tables at the end? If this is
possible - this will be the solution (all or nothing).

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

