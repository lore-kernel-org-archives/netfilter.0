From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Fri, 28 Nov 2008 00:42:15 +0100
Message-ID: <492F3057.8010007@plouf.fr.eu.org>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com> <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Zagato a =E9crit :
> Hi.... im trying to forward the conecction to mail services like smtp=
(
> port 25) from one pc to another, im using:
>=20
> _mail_services=3D25,110,143,995,993
> _mailserver=3D192.168.0.3
> iptables -t mangle -A ftolocal -p tcp -m multiport --destination-port=
s
> $_mail_services -j MARK --set-mark 1
> iptables -t nat -A ftolocal -p tcp -m multiport --destination-ports
> $_mail_services -j DNAT --to-destination 192.168.0.3
>=20
> where ftolocal its a chain name for mangle and nat...
>=20
> the ip addres source it's 192.168.0.5 and i want to send localhost
> connections to 192.168.0.3...
> when i use the lines above i can:
> telnet 192.168.0.5 25
> and it works... giving me:
> Trying 192.168.0.5...
> Connected to beta.gps.com.co (192.168.0.5).
> Escape character is '^]'.
> 220 alpha.gps.com.co ESMTP Postfix
>=20
> But when i use:
> telnet localhost 25 or telnet 127.0.0.1 25 tha must be equal i get..
> Trying 127.0.0.1...
> and statys there forever.....

The difference may lie in the source address. When you send a packet to=
=20
a local address (127.0.0.0/8, 192.168.0.5) and don't set an explicit=20
source address (with -b in telnet), the linux kernel selects the same=20
local address for the source address. After matching the DNAT rule,=20
packets are rerouted to the network interface through which the new=20
destination can be reached instead of the loopback interface. However=20
the kernel routing prohibits sending packets with a loopback address to=
=20
a non loopback interface, i.e. outside the host. So packets with source=
=20
address 192.168.0.5 are sent out, but packets with source address=20
127.0.0.1 are discarded. An additional SNAT rule wouldn't help here=20
because it would take place after the packet has been discarded.

