From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: AH and ESP nat-ing
Date: Thu, 6 May 2010 19:02:36 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005061902191.6755@obet.zrqbmnf.qr>
References: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>  <alpine.LSU.2.01.1005061706150.32238@obet.zrqbmnf.qr> <AANLkTilqPXXeMhbUgoicPIUlrNH6BnbYBfNL7WhyHuGH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilqPXXeMhbUgoicPIUlrNH6BnbYBfNL7WhyHuGH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2010-05-06 18:55, ratheesh k wrote:

>On Thu, May 6, 2010 at 8:36 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>> On Thursday 2010-05-06 16:08, ratheesh k wrote:
>>
>>>I googled and found that =C2=A0AH protocol pkt cannot be NATed =C2=A0=
, And ESP
>>>protocol pkt =C2=A0NATing wont work in =C2=A0some use cases .
>>>
>>>Is this problem is solved in newer kernels ?
>>
>> This is not a kernel problem.
>>
>>>Is there any ALG for nating this packets =C2=A0?
>>
>> No, it's cryptographically signed, so any modification would be visi=
ble.
>>
>
>
>I am able to establish pptp/ipsec connection  from my client machine
>,connected to a  Router (broadcom ) . it doesnt have any  debug
>terminal .
>Could you tell me , how this is possible  ?

PPTP and ESP can be udptunneled, see google et al.
