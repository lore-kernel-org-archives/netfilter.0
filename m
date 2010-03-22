From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Nat and firewall holes
Date: Mon, 22 Mar 2010 18:12:25 +0100
Message-ID: <4BA7A4F9.6020001@plouf.fr.eu.org>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

ratheesh k a =E9crit :
>=20
> I have a linux machine'( say B )  with two interfaces ( eth0
> -192.168.1.1  and eth1 - 192.168.55.1 ) .This linux machine works as =
a
> gateway machine . eth0 is connected to LAN network and eth1 is
> connected to WAN network . below rules are applied on the gateway
> machine .,
>=20
>     iptables -A  INPUT -i eth0 -j ACCEPT
>     iptables -A INPUT  -i eth1 -j DROP
>=20
>     iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
>     iptables -A FORWARD -i eth1 -o eth0 -j DROP

Hmm, not sure that dropping everything received on eth1 is a good idea.

>     iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE .
>=20
>=20
> LAN ---> eth0 : Gateway linux machine :eth1 ---> WAN
>=20
> We have machine called A , connected to LAN network and is assigned a=
n
> ip 192.168.1.100 and its gateway is machine B's eth0 interface (
> 192.168.1.1 ) .
> if i access "google.com " from machine A , syn packet with dest ip as
> a.b.c.d ( google.com ip ) and  dest port 80 will go to machine B
> (default gateway ) . Since we are masquerading all the packets , it
> will change  source ip with 192.168.55.1 and source port with some
> random port ( say portx ) .

MASQUERADE won't change the source port unless specified otherwise by
--random or --to-ports options, or if it is necessary in order to avoid
a "collision" with an existing connection (e.g. two clients connecting
to the same server with the same source port). See iptables man page.

> Packets from server will be having
> 192.18.55.1 ip and port as portx . This will be changed to original i=
p
> and port by conntrack module .

Actually the conntrack module will only associate the packet to the
existing connection, and the nat module will change the addresses and p=
orts.

>  My qustion is : if i create a packet with source ip as 192.168.55.1
> and dest port as portx , can i get into the machine B from WAN side .

Do you mean machine A (the client) ?
If a crafted packet matches all the characteristics of the conntrack
entry for that connection (including reply source port 80, TCP sequence
number), then it will be considered belonging to the reply direction of
that connection and the NAT will process it accordingly.
