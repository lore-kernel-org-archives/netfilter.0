From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: What is so special about 172.31.254.254
Date: Wed, 4 Apr 2012 16:30:06 -0300
Message-ID: <20120404163006.26b419c5@pulsar.inexo.com.br>
References: <4F7C6804.8090702@freemail.hu>
	<4F7C6EEE.4090305@mailinator.com>
	<4F7C9852.70206@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F7C9852.70206@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?B?R+FzcOFy?= Lajos <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

On Wed, 04 Apr 2012 20:52:02 +0200
G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:

> Hi Mike,
>=20
> >> 1. 172.31.254.1
> >> 2. 172.31.254.254
> >>
> >> Netmask 255.255.255.0
> >>
> >> They do not see each other...
> >> But if I change the second IP (for example to 172.31.254.253) then=
 it
> >> all good...
> >>
> >> What am I missing?
> >
> > Hi Swifty.
> >
> > Could it be that x.x.x.254 is somewhere defined as a default gatewa=
y?
> The default gateway for the first PC (172.31.254.1) is 172.31.254.254=
=2E..

ping 254.254 from 254.1 and run "tcpdump -ni SOME_IFACE icmp" on *both*=
 PC=B4s where SOME_IFACE are the interfaces where they talk to each oth=
er. Let us know the results.

Ethy

>=20
> Swifty
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--=20

Ethy H. Brito         /"\
InterNexo Ltda.       \ /  CAMPANHA DA FITA ASCII - CONTRA MAIL HTML
+55 (12) 3797-6860     X   ASCII RIBBON CAMPAIGN - AGAINST HTML MAIL
S.J.Campos - Brasil   / \=20
=20
PGP key: http://www.inexo.com.br/~ethy/0xC3F222A0.asc
