From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: SNAT problem
Date: Sun, 22 Aug 2010 23:12:06 +0200
Message-ID: <4C7192A6.90109@plouf.fr.eu.org>
References: <4C716DF6.3040602@pisem.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C716DF6.3040602@pisem.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Yevgeny Kosarzhevsky a =E9crit :
>=20
> I have two interfaces, let's say ppp0 - x.x.x.x, ppp1 - y.y.y.y ppp0 =
is=20
> a default gateway.
> I use some command to change routing to IP z.z.z.z via ppp1:
> ip ro ad to z.z.z.z dev ppp1
>=20
> I have SNAT rules for both interfaces, however, I notice with tcpdump=
=20
> that outgoing packets are still using x.x.x.x instead of y.y.y.y IP,=20
> though packets are being sent with the correct interface (ppp1)
>=20
> I have shut down ppp0 and removed SNAT rule for it, but outgoing pack=
ets=20
> are still showing x.x.x.x IP. Even, ip ro fl cache didn't help.

If the packets belong to an existing connection (conntrack-wise) which
was established before the route change, this behaviour is expected.
Changing the source address may break the connection.
