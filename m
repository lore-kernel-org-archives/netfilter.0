From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Mon, 23 Aug 2010 10:21:24 +0200
Message-ID: <4C722F84.1080606@plouf.fr.eu.org>
References: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr> <4C715667.9070008@pandora.be> <alpine.LSU.2.01.1008221927430.3855@obet.zrqbmnf.qr> <4C718E30.1090908@plouf.fr.eu.org> <alpine.LSU.2.01.1008222321290.21206@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008222321290.21206@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Bart De Schuymer <bdschuym@pandora.be>, netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
> On Sunday 2010-08-22 22:53, Pascal Hambourg wrote:
>>> =20
>>>> I don't understand your question,
>> Me neither : according to your output, the MAC address of neither po=
rt
>> has changed.
>=20
> Well.. rerun `ip a` before enslaving tap to br and you see.

Sorry to insist heavily, but I still don't get your point.
You wrote :

> Is this behavior normal that the lladdrs of all but the first brport
> remain unchanged? If so, what is the purpose of changing the lladdr o=
n the
> first brport?

from which I understand that tap1's MAC address changed when it was
added to the bridge. But comparing tap1's MAC address from your own "ip
a" output before it is added to the bridge :

> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen =
500
>     link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff

and after :

> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen =
500
>     link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff

it appears to me that it didn't change.

Did I misunderstand something ?
