From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 18:13:24 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807191809370.21244@fbirervta.pbzchgretzou.qr>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr> <488204EB.3090902@unipex.it> <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
 <488210AC.9030102@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488210AC.9030102@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org, =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>


On Saturday 2008-07-19 18:05, Michele Petrazzo - Unipex srl wrote:

> Jan Engelhardt wrote:
>> > Ok. Thanks for the simple, but complete explain. But  where to say "go out
>> > through the right one?"
>> 
>> The fact is, you do not know in advance which is the right one.
>
> So there is no solution with the "marking into PREROUTING" technique?
> Into my environ a packet that come from an interface MUST go out through
> that one.

That will work easily, because the client contacts you first.
It is when the router has to decide a path for the first time.
But since you will be using a bridge device anyway, there is
just one path (namely, br0).

>> > > And depending on the situation you might also need to enforce routing at
>> > > the bridge border so as to not open security holes.
>> > Have you some more words about this? Where can I found problems? How to
>> > modify routing?
>> 
>> ebtables -t broute -P BROUTING DROP
>> 
>> which will force all packets being routed.
>
> I'll try it soon.
> But in this case, why the kernel doesn't "lost" the package that ebtables
> wants to DROP? Or the kernel starts to see which is the first hole where
> the packet can go inside and leave it there?
> Seem a very contorted thinking to me...

Ah just forget this one.


- create bridge device
- do as usual
