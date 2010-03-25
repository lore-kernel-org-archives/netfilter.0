From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Netfilter internal packet flow
Date: Thu, 25 Mar 2010 11:14:18 +0100
Message-ID: <4BAB377A.5090107@plouf.fr.eu.org>
References: <20100325090329.11170@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100325090329.11170@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

hyperbatus@gmx.de a =E9crit :
>=20
> According to my testing so far (linux kernel 2.6.26 / debian lenny),
> the behaviour of these packets seems to contradict the documents and
> graphics I have seen. Such packets seem to go through the INPUT and
> OUTPUT chains of the FILTER table and through one or two chains of th=
e
> NAT table (I just can't remember exactly at the moment), but not thro=
ugh
> the PREROUTING chain of the NAT table. This is confusing ...

In most graphics a part is missing after the POSTROUTING and INPUT
chains : the "conntrack confirm", which confirms the creation of a new
conntrack entry for a NEW packet only when the packet reaches that step=
=2E
So if the packet is dropped before, the new conntrack entry is not
confirmed. IIUC, a packet can go through the nat *chains* (not to be
confused with the nat *table*) only when its conntrack entry is not
confirmed yet. That's why only the first packet of a new connection
enters the nat chains.

When a packet is looped back, it reaches the conntrack confirm after
POSTROUTING, so it skips the nat PREROUTING chain. Anyway that makes
sense : if the destination could be changed in PREROUTING, the packet
may need to be re-routed through another interface but I don't think
there is a routing decision after PREROUTING for the loopback (routing
decision already took place on output). If you need DNAT on loopback,
you can do it in OUTPUT.
