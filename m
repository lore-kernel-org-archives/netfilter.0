From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 18:05:00 +0200
Message-ID: <488210AC.9030102@unipex.it>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr> <488204EB.3090902@unipex.it> <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, =?windows-1252?Q?Leonardo_Rodrigues_Ma?= =?windows-1252?Q?galh=E3es?= <leolistas@solutti.com.br>

Jan Engelhardt wrote:
>> Ok. Thanks for the simple, but complete explain. But  where to say 
>> "go out through the right one?"
> 
> The fact is, you do not know in advance which is the right one.

So there is no solution with the "marking into PREROUTING" technique?
Into my environ a packet that come from an interface MUST go out through
that one.

>>> And depending on the situation you might also need to enforce 
>>> routing at the bridge border so as to not open security holes.
>> Have you some more words about this? Where can I found problems? 
>> How to modify routing?
> 
> ebtables -t broute -P BROUTING DROP
> 
> which will force all packets being routed.

I'll try it soon.
But in this case, why the kernel doesn't "lost" the package that ebtables
wants to DROP? Or the kernel starts to see which is the first hole where
the packet can go inside and leave it there?
Seem a very contorted thinking to me...

Thanks,
MIchele
