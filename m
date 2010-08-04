From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [Bridge] ebtables PREROUTING -drop
Date: Wed, 4 Aug 2010 18:40:59 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008041840310.10301@obet.zrqbmnf.qr>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com> <4C5953C8.2040708@free.fr> <51AC42EFFBC60FE7E630D78B@Ximines.local> <alpine.LSU.2.01.1008041432380.6031@obet.zrqbmnf.qr> <A1D32A25DAAD1A46D6CC68BE@Ximines.local>
 <alpine.LSU.2.01.1008041630390.19791@obet.zrqbmnf.qr> <4C5997DD.8080200@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5997DD.8080200@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Nicolas_de_Peslo=C3=BCan?= <nicolas.2p.debian@free.fr>
Cc: Alex Bligh <alex@alex.org.uk>, ratheesh k <ratheesh.ksz@gmail.com>, bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>


On Wednesday 2010-08-04 18:39, Nicolas de Peslo=C3=BCan wrote:
>>> I'm not 100% sure it is completely outside though. For instance,
>>> if you do tcdump on a bridge device (as opposed to the correspondin=
g
>>> physical participant interface), isn't that after ingress ebtales
>>> processing, but before egress? IE is in the graph somewhere.
>>
>> Huh, all once investigated already. See
>> http://jengelh.medozas.de/images/nf-packet-flow.png for where
>> in/egress happen to be. :)
>
> Nice work!
>
> May be just missing other netif_receive_skb() magic, like bonding for=
 example.

Well, bonding is not really part of Netfilter.
Then again, neither is ingress/xfrm ;-)
