From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with new --physdev-out style
Date: Wed, 24 Oct 2007 10:36:31 +0200
Message-ID: <471F040F.7040607@plouf.fr.eu.org>
References: <20071024071854.GA18581@volker-sauer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071024071854.GA18581@volker-sauer.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Volker Sauer a =E9crit :
>=20
> with recent kernels, I have this problem:
>=20
> kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
> POSTROUTING chains for non-bridged traffic is not supported anymore.
>=20
> What does "non-bridged" in this context mean??

It means packets leaving the IP stack, I guess you could say "routed" a=
s=20
opposed to "bridged". A packet can traverse iptables chains either when=
=20
it is routed or when it is bridged. At the time a routed packet=20
traverses the iptables chains, the "bridging decision" (i.e. chosing th=
e=20
output port when the output interface is a bridge) has not been made=20
yet, so the output port is unknown and --physdev-out is irrelevant.
