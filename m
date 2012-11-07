From: Eric Leblond <eric@regit.org>
Subject: Re: conntrack mysql database. Plausible?
Date: Wed, 07 Nov 2012 18:46:02 +0100
Message-ID: <1352310362.14921.2.camel@tourtet>
References: <20121107151118.1976dd3f@pulsar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20121107151118.1976dd3f@pulsar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

Hi,

Le mercredi 07 novembre 2012 =C3=A0 15:11 -0200, Ethy H. Brito a =C3=A9=
crit :
> Hi All
>=20
> Is it possible to (or how to) maintain a mysql database with the assu=
red
> connections' time range?

You can do that easily with ulogd2. Just setup and use the following
stack and you will have what you want:
stack=3Dct1:NFCT,ip2bin1:IP2BIN,mysql2:MYSQL

BR,

> Something like: time ASSURE'd, time DESTROYed, and the 5'tuple IPs ds=
t and
> src, ports dst and src and protocol.
>=20
> Have you guys seem something like this?
>=20
> This would be useful to point out which clients behind a NAT accessed=
 in
> the last few days.
>=20
> Regards
> Ethy
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


