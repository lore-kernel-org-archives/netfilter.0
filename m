From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Broadcast redirecting
Date: Thu, 13 May 2010 21:21:10 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005132120310.31136@obet.zrqbmnf.qr>
References: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com> <4BEC3608.5050603@uncu.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BEC3608.5050603@uncu.edu.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Federico Alberto Sayd <fsayd@uncu.edu.ar>
Cc: netfilter@vger.kernel.org

On Thursday 2010-05-13 19:25, Federico Alberto Sayd wrote:

> Anatoly Muliarski escribi=C3=B3:
>> Hi list,
>>
>> Is it possible to redirect broadcast packets( with dst 255.255.255.2=
55
>> ) received on one interface to another?
>> Or should I use some standalone program?
>
>
> brouting with ebtables??
> arp proxy??

2x No.

Broadcasts are not routed.
