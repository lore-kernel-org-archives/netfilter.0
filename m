From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sat, 1 Jul 2017 12:05:41 +0200
Message-ID: <b261031e-29e0-db9a-7d63-9ce88ed017ac@plouf.fr.eu.org>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: oyvind@dynator.no
Cc: netfilter@vger.kernel.org

Le 30/06/2017 =E0 15:55, =D8yvind Kaurstad a =E9crit :
>
> Which brings me to the question in the subject, is it even possible to
> have this work without using the features of marking the connection and
> then mark the return packets and have a routing rule for it?

I don't know about nftables, but with iptables you can avoid marking the=20
connection and use the conntrack match to check the original destination=20
address. However AFAIK you cannot avoid marking the reply packets if,=20
from the routing point of view, nothing distinguishes packets that=20
should be sent to different interfaces.

One workaround is to forward incoming packets to alternate addresses.

A target device has primary address A and alternate address B.
For ordinary traffic, it uses address A.

When receiving a packet on ppp0, the routing device forwards it to the=20
alternate address B.

The target device sends the reply packet from source address B and the=20
routing device can use source-based routing to route it back to ppp0.
