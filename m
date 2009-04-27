From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 13:57:37 +0200
Message-ID: <49F59DB1.1060007@plouf.fr.eu.org>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Paddie O'Brien a =E9crit :
>=20
> My IP is dynamically assigned and I want a rule like this one:
>=20
> iptables -I INPUT 1 -d my_ip_address  -m state --state NEW -j ULOG

Why ? What do you want to achieve exactly ?

> Can a rule work out the IP address of its host?

What address ? A node may have more than one single address, and usuall=
y=20
does : typically the loopback address range 127.0.0.0/8 and one or more=
=20
addresses assigned to each "real" interface. If a packets arrives in th=
e=20
INPUT chain, it implies that its destination address is assigned to the=
=20
node. Otherwise the packet is discarded if the node is a simple host, o=
r=20
sent in the FORWARD chain if the node is a router.
