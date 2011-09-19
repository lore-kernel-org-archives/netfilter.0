From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
Date: Mon, 19 Sep 2011 18:15:28 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109191814230.11243@frira.zrqbmnf.qr>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
 <0103CB00F80F4E64AF7B894570B0688A@poweredge1800>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0103CB00F80F4E64AF7B894570B0688A@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org

On Monday 2011-09-19 18:10, Julio A. Romero wrote:

>
> ----- Original Message ----- From: "Jan Engelhardt" <jengelh@medozas.de>
> To: "Julio A. Romero" <julioarr@fisica.uh.cu>
> Cc: <netfilter@vger.kernel.org>
> Sent: Monday, September 19, 2011 11:55 AM
> Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
>
>
>> Bah, don't strip the CC, and don't top-post.
>>
>> On Monday 2011-09-19 17:43, Julio A. Romero wrote:
>>
>>> In the INPUT chain!!??
>>
>> No, why? It was not a broadcast packet. Your syslog itself says:
>> DST=10.6.15.246.
>
> but 10.6.15.246 is outside of my internal networks ??

Yes, which is why it goes to OUT=eth0.

> the packets don't go through the box or yes?!

Of course they do go through your box, otherwise it would not be able to 
log them.

> what happen if I remove the rule to log?

There would be no entry in syslog, obviously.

