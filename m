From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: DNAT vs REDIRECT
Date: Fri, 05 Jun 2009 14:29:12 +0300
Message-ID: <1244201352.4724.17.camel@casper.meteor.dp.ua>
References: <4A28ED08.3090104@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A28ED08.3090104@gulfsat.mg>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Rakotomandimby Mihamina <mihamina@gulfsat.mg>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 05/06/2009 =D7 13:01 +0300, Rakotomandimby Mihamina =D0=C9=
=DB=C5=D4:
> Hi,
> On my gateway, I usually made a
>    -A INPUT ... -dport 80 ... -j REDIRECT 192.168.x.y:80
> In order to reach the webserver located on the LAN.
> What would be the difference if I use a DNAT instead?
>=20
> What's the diferences between those?

REDIRECT is like DNAT but for redirecting to a local machine only (INPU=
T
chain), DNAT is more universal, can be used not only for redirecting to
a local machine but also to a remote (PREROUTING chain).

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

