From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Help with routing ping requests
Date: Sat, 11 Jul 2015 23:32:42 +0200
Message-ID: <55A18B7A.4010702@plouf.fr.eu.org>
References: <14e79fd9210.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com> <14e7a023590.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <14e7a023590.279f.a66e0210b6f036863bfeb88685b7aa6c@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Donald Schlicht <dschlic1@gmail.com>
Cc: netfilter@vger.kernel.org

Donald Schlicht a =E9crit :
> I have an application where I need to configure a router to pass thro=
ugh=20
> ping requests (ICMP type 8) through to the LAN port. I have a Linksys=
=20
> WRT54GS with tiny DD-WRT V24 SP2 installed. I am adding the following=
=20
> iptables rules:=20
>=20
> iptables -t nat -I PREROUTING -p icmp --icmp-type 8 -s 72.64.140.50 -=
j DNAT=20
> --to-destination 192.168.1.200=20
> iptables -t filter -I FORWARD -p icmp --icmp-type 8 -s 72.64.140.50 -=
d=20
> 192.168.1.200 -j ACCEPT
>  iptables -t nat -I POSTROUTING -p icmp --icmp-type 8 -s 72.64.140.50=
 -d=20
> 192.168.1.200 -j ACCEPT
>=20
>  The intent is that the first rule will change an incoming echo reque=
st=20
> destination to the unit on the LAN which I want to receive the ping r=
equest.=20
>=20
> The second rule allows the modified echo request to pass through the=20
> FORWARD table. And the last one allows the modified echo request to p=
ass=20
> through the POSTROUTING table. When I send a ping to the router with =
four=20
> tries, I get no pings out the LAN.

What do you mean exactly ? How do you know ?

> Using iptables -L -v -n I can see were=20
> rule #1 passes one packet (but not four), rule #2 passes four packets=
=20
> (good!) and rule #3 passes 1 packet.

This is expected behaviour. Chains in the nat table see only the first
packet of any "connection". NAT operations applied to this packet are
implicitly applied to subsequent packets of the same connection. A ping
sequence is considered as a connection.
