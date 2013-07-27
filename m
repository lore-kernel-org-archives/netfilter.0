From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Sat, 27 Jul 2013 21:49:37 +0200
Message-ID: <51F42451.9010308@plouf.fr.eu.org>
References: <1374803962.5489.12.camel@fermat.scientia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1374803962.5489.12.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

Christoph Anton Mitterer a =E9crit :
>=20
> The idea with dropping the UNTRACKED/INVALID was that such packages a=
re
> probably not good fellows and should stay out...

You should not blindly drop UNTRACKED or INVALID IPv6 packets.

Originally, ICMPv6 types related to NDP (Neighbour Discovery Protocol),
i.e. Router Solicitation and Router Advertisement (used for stateless
autoconfiguration), Neighbour Solicitation and Neighbour Advertisement
(used as a replacement for ARP request and reply), and a few others had
the INVALID state. However these types are required for proper IPv6
operation on ethernet-like links. Since kernel 2.6.29, they are not
tracked any more and have the UNTRACKED state. See the commit below.

commit 3f9007135c1dc896db9a9e35920aafc65b157230
Author: Eric Leblond <eric@inl.fr>
Date:   Mon Feb 9 14:33:20 2009 -0800

    netfilter: nf_conntrack_ipv6: don't track ICMPv6 negotiation messag=
e

    This patch removes connection tracking handling for ICMPv6 messages
    related to Stateless Address Autoconfiguration, MLD, and MLDv2. The=
y
    can not be tracked because they are massively using multicast (on
    pre-defined address). But they are not invalid and should not be
    detected as such.

    Signed-off-by: Eric Leblond <eric@inl.fr>
    Signed-off-by: Patrick McHardy <kaber@trash.net>
    Signed-off-by: David S. Miller <davem@davemloft.net>

