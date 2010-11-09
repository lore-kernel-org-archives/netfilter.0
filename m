From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: balance traffic between virtual interfaces on the same network
Date: Tue, 09 Nov 2010 16:41:37 +0100
Message-ID: <4CD96BB1.8050109@plouf.fr.eu.org>
References: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>	<alpine.LNX.2.01.1011091452410.2491@obet.zrqbmnf.qr> <AANLkTimy_Um5z=MDeUqVfY5Kea1HpbHPg9ik3CKoE0+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimy_Um5z=MDeUqVfY5Kea1HpbHPg9ik3CKoE0+Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tommaso Calosi <tcalosi@gmail.com>
Cc: netfilter@vger.kernel.org

Tommaso Calosi a =E9crit :
> That's why i wrote "virtual interfaces".

eth0:* are not virtual interfaces, not interfaces at all. They are just
IPv4 aliases. Virtual interfaces are a different thing : they are "real=
"
interfaces (from the network stack point of view) which are just not
related to real hardware.

> If t's not possibile, then
> it'd have the same effect to masquerade outgoing connection with a na=
t
> pool made by 192.168.1.10, 192.168.1.20 and 192.168.1.30 but since
> they're originating from the firewall itself, again I don't know how.

You can use SNAT. It does not matter that the traffic originates from
the box. However your addresses are not contiguous and the support for
multiple --to-source options was removed long ago, so you'll have to do
the balance by other means, for example with the statistic match.

Note that it won't balance the source address on a packet basis but on =
a
connection basis. So if you have one very active connection and one
mostly inactive connection, most of the packets will have the same
source address.
