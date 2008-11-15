From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Alternate routing table and source IP address question.
Date: Sat, 15 Nov 2008 12:57:52 +0100
Message-ID: <491EB940.6070107@plouf.fr.eu.org>
References: <1226578553.8310.40.camel@localhost.localdomain> <491C5FCE.9060001@plouf.fr.eu.org> <Pine.LNX.4.58.0811141747390.12742@bolt.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0811141747390.12742@bolt.sonic.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

bsilva a =E9crit :
> At my job, we use iptables commands to mark packets to use alternate
> routing tables.  Basically, we're using this to have two default gate=
ways,
> some traffic types go out interface A to one gateway, other types of
> traffic go out interface B to a second gateway.
>=20
> The issue is that by the time the packet gets to the routing table, t=
he
> source IP address has already been set and we get the packets exiting
> interface B, but with the source IP address of interface A.

Indeed, this is a common issue.

> The only way we've found to correct this is to have the application t=
hat
> generates the traffic bind to the particular source IP address of the
> interface that it's eventually going to use.
>=20
> Is there a better way to do it?

You can use SNAT or MASQUERADE, but IMO having the application bind to=20
the desired source address is a cleaner way when applicable. NAT does=20
not work well with all kinds of traffic. Besides, source-based routing=20
is easier than mark-based routing, as it does not need iptables rules.

> I see this nice box on Jan Engelhardt's Packet Flow graph labeled "re=
route
> check", but I don't see a way to invoke it.  I was hoping that adding=
 a
> "src 123.123.123.2" parameter to the route statement would invoke rer=
oute,
> but that doesn't seem to happen.  Or is the "reroute check" only used=
 in
> NAT cases?

The reroute check just updates the routing decision due to an address=20
translation or a mark set in the OUTPUT chains. The "src" option in a=20
route is used only in the first routing decision before the OUTPUT=20
chains, when the packet is created without a defined source address. A=20
routing decision does not change the defined source address.
