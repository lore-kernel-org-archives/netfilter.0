From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPv6 forwarding to TAP-interface with ip6tables fails
Date: Sat, 19 Dec 2009 15:09:08 +0100
Message-ID: <4B2CDE84.3060703@plouf.fr.eu.org>
References: <20091219162047.04be7ac3@coercion>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091219162047.04be7ac3@coercion>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Kazantsev <mk.fraggod@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Mike Kazantsev a =E9crit :
>=20
> I wonder if the following problem is a bug in netfilter or I'm just
> doing something wrong, but it wasn't always like that.
> Problem started probably with some kernel update on router machine,
[...]
> I've tried setting -j LOG to FORWARD chain of ip6tables and it always
> (both while the connection works and not) shows lines like this:
>   Dec 19 14:09:48 kern.warn<4> kernel[-]@damnation: IN=3Dlan OUT=3Dvd=
e
>     SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
>     DST=3D2001:0470:1f0b:11de:0000:0000:0000:0021
>     LEN=3D104 TC=3D0 HOPLIMIT=3D63 FLOWLBL=3D0 PROTO=3DICMPv6
>     TYPE=3D128 CODE=3D0 ID=3D29524 SEQ=3D8=20
>=20
> So, I assume the packet is lost somewhere in netfilter, but I've no
> idea how to tell why it's getting discarded like that.

Have you tried to track the packet in the mangle/POSTROUTING chain too,
either with the LOG target in that chain or with the TRACE target in th=
e
raw/PREROUTING chain ?

> Strangely enough (for me), when I type "ping6 2001:0470:1f0b:11de::21=
"
> on router machine it gives "Destination unreachable: Address
> unreachable"

This indicates that the neighbour discovery for that address failed,
either because the ICMPv6 neighbour solicitation request could not be
sent or the ICMPv6 neighbour advertisement reply was not received. If
neighbour discovery fails, packets cannot be sent or forwarded to that
destination.

> ip addr:
>   2: lan: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state U=
P qlen 1000
[...]
>       inet6 2001:470:1f0b:11de::10/125 scope global=20
[...]
>   7: vde: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=
 state UNKNOWN qlen 500
[...]
>       inet6 2001:470:1f0b:11de::20/125 scope global=20

Regardless of your problem, 2001:470:1f0b:11de::10 and
2001:470:1f0b:11de::20 are the prefix addresses of
2001:470:1f0b:11de::10/25 and 2001:470:1f0b:11de::20/25 and have a
special status : they are anycast addresses meaning "any router
connected to that prefix". So I guess that they should not be assigned
to an interface.

> ip6tables has following rules (at the start of FORWARD chain):
>   -I FORWARD -i vde -j ACCEPT
>   -I FORWARD -i lan -j ACCEPT

ICMPv6 packets involved in neighbour discovery go through the INPUT and
OUTPUT chains. What do these chains contain ? Connection tracking of
these ICMPv6 types changed in kernel 2.6.29.

You wrote in the subject "with ip6tables". Do you mean that it works
without ip6tables, without ip6_tables loaded or without ip6table_filter
loaded, or with all chains empty and with ACCEPT default policy ?
