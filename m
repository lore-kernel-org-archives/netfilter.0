From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FORWARD chain and Interfaces
Date: Sun, 22 May 2011 10:48:40 +0200
Message-ID: <4DD8CDE8.505@plouf.fr.eu.org>
References: <1305958205.10779.1454356989@webmail.messagingengine.com> <4DD7A0C5.1040200@plouf.fr.eu.org> <1306007342.28169.1454496985@webmail.messagingengine.com> <4DD825EB.2080300@plouf.fr.eu.org> <1306014018.28595.1454519185@webmail.messagingengine.com> <4DD83726.5090604@plouf.fr.eu.org> <1306017077.11298.1454526649@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1306017077.11298.1454526649@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@buglecreek.com
Cc: netfilter <netfilter@vger.kernel.org>

netfilter@buglecreek.com a =E9crit :
> On Sun, 22 May 2011 00:05 +0200, "Pascal Hambourg"
>>
>> How then do you know which interface of the router is connected to w=
hich
>> network ?
>=20
> I'm basing the router connections to the various networks by the IP
> addresses and network Addresses.

That is not enough. The virtualization system (Parallels for you) deals
only with the link (ethernet) layer, not the IP layer. You can set up
multiple IP subnets on the same link but they are not isolated.

> Sending a broadcast packet (good idea) from network B I see the packe=
t
> show up at network A machine and on both interfaces of the firewall. =
 I
> even see the packets show up on network A when the firewall/router is
> turned off.

So all interfaces are connected to the same link, just as I thought.

> Both Net A and Net B are assigned IPs on two entirely
> different networks.  Obviously, this is not the expected behavior.

It is expected behaviour when all interfaces are connected to the same
link. Think as if all interfaces are connected to the same switch and
you didn't define separate VLANs.

Ideally you need to set up two separate virtual links and define which
interface is connected to which link. Other options include :

a) Use tagged VLAN interfaces (see vconfig). This requires only one
ethernet interface on the router. E.g. :
VLAN 1 for network A, machines use eth0.1
VLAN 2 for network B, machines use eth0.2

b) Set /proc/sys/net/ipv4/all/arp_ignore to 1 on the router so each
interface replies only to ARP requests for its own address. This way th=
e
other machines will send packets only to the correct interface.

Note that these options do not provide the same level of security as
separate links.
