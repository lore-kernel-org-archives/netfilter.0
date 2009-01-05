From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Mon, 05 Jan 2009 12:47:38 +0100
Message-ID: <4961F35A.8030207@unipex.it>
References: <662506031@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <662506031@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Roland_H=E4der?= <r.haeder@web.de>
Cc: netfilter@vger.kernel.org

Roland H=E4der wrote:
> Hi together,
>=20

Hi!

> I have a Debian Unstable (Sid) here with vanilla kernel 2.6.28. I use
>  the Bastille firewall script to setup firewall rules.
>=20
> When I now start a service e.g. Tor which needs open ports at 9001=20
> and 9030 it can connect to itself when the firewall is done.
>=20

Why you said "now". It has never worked? When it's start to had problem=
s?

> But when I start it it's self-connections got blocked.
>=20
> Here is my ruleset exported with "iptables-save > iptables.list":=20
> http://www.mxchange.org/downloads/firebox/iptables.list
>=20

You have to say us what you want to leave pass from that firewall... to=
r
from internet, from lan? tor on localhost wants to connect to your-self
by 127 or 192 ?
Too short description and no logs.
Past the "INPUT DROP 10" drop syslog or add some logging "debug" rules
around and see why it's not pass
Masq from .. to... ?

Michele

