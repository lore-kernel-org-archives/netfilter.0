From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Sat, 29 Oct 2011 21:29:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110292128120.32690@frira.zrqbmnf.qr>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>  <1319669075.26402.6892.camel@andybev-desktop>  <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>  <1319696663.26402.6931.camel@andybev-desktop> 
 <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com> <1319912591.2993.8.camel@steve-pc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1319912591.2993.8.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Ronald <ronald645@gmail.com>, netfilter@vger.kernel.org


On Saturday 2011-10-29 20:23, Andrew Beverley wrote:
>>  I can even add the following
>> line to my server. (This is in the case I use port redirection. Then I
>> use this line to make it an effective security enhancement):
>> 
>> iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP
>
>Yes, but the packets originating from the server will not pass through
>the PREROUTING chain.
>
>> Besides, I designed my netfilter configuration to not differentiate
>> between interfaces. I use the addrtype extension, works better.
>
>I like that, but remember that any packets leaving the server will only
>traverse the OUTPUT and POSTROUTING chains.

This is wrong information.

Packets very well pass through PREROUTING even when they come from lo.
