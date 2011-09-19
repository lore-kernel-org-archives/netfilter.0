From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
Date: Mon, 19 Sep 2011 19:07:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109191905390.9464@frira.zrqbmnf.qr>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr> <0103CB00F80F4E64AF7B894570B0688A@poweredge1800>
 <alpine.LNX.2.01.1109191814230.11243@frira.zrqbmnf.qr> <6EA3623734DF44D68A345CD9CF3D34C2@poweredge1800>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6EA3623734DF44D68A345CD9CF3D34C2@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org


On Monday 2011-09-19 18:38, Julio A. Romero wrote:
>>>>> In the INPUT chain!!??
>>>>
>>>> No, why? It was not a broadcast packet. Your syslog itself says:
>>>> DST=10.6.15.246.
>>>
>>> but 10.6.15.246 is outside of my internal networks ??
>>
>> Yes, which is why it goes to OUT=eth0.
>
> ok, the packets are forwarding in eth0, so why?

Because the packet was not destined for this host.
