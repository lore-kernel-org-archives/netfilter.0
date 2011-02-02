From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 14:46:50 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102021442490.7977@obet.zrqbmnf.qr>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de> <alpine.LNX.2.01.1102020207390.25701@obet.zrqbmnf.qr> <201102021430.44239.guido-nf@thisisnotatest.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201102021430.44239.guido-nf@thisisnotatest.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Winkelmann <guido-nf@thisisnotatest.de>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-02-02 14:30, Guido Winkelmann wrote:
>>>
>>>There shouldn't be, just as long as you only filter on the source
>>>address of outgoing packets, and not on the destination of incoming
>>>ones. The NDP request packets go to weird multicast addresses
>> 
>>That "weird multicast address" is just broadcast so to speak, there is
>>nothing weird about it.
>
>Well, from what I could gather in wireshark, it's a bunch of different dst 
>addresses that are used for that, and which one is used appears to depend on the 
>address being queried...

Solicited-node MC. Nothing special really, works like a limited broadcast.

>Of course, if you don't have any IPv6 routers on the local net, or if they don't 
>send router advertisements, then the second autoconfigured address will not 
>exist, but then, if there is no IPv6 router, then saying the host is "using 
>IPv6" is a bit far fetched

Autoconfiguration is not a mandatory requirement for using IPv6.
