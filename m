From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forwarding packets over the same LAN
Date: Wed, 15 Jul 2009 09:32:54 +0200
Message-ID: <4A5D8626.6060002@plouf.fr.eu.org>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>	 <1247558286.7214.16.camel@TestField.intranet.bem.md>	 <1247585686.1173.7.camel@enterprise.ims-firmen.de> <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e1ba8dde0907141201i5647546r78c2a66e24cad18f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Simion Onea a =C3=A9crit :
>=20
> Maybe I should examine more carefully the INPUT and FORWARD chains of
> the filter table. They are configured to allow inbound traffic to por=
t
> 10025 and to allow forwarding to port 25. Are there any other
> requirements?

The INPUT chain is only for local delivery, forwarded traffic does not=20
go through it. So you do not need to accept inbound traffic to port=20
10025 in the INPUT chain. You need to accept the return traffic in the=20
=46ORWARD chain.

> Is there any means to "debug" or to "see" how a packet traverses the
> chains and tables?

If the TRACE target is not available, you can insert rules with the LOG=
=20
target at the beginning of each table/chain. You can also use a packet=20
sniffer such as tcpdump or wireshark to watch the traffic at each inter=
face.


