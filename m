From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
Date: Mon, 19 Sep 2011 17:55:55 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: netfilter@vger.kernel.org

Bah, don't strip the CC, and don't top-post.

On Monday 2011-09-19 17:43, Julio A. Romero wrote:

> In the INPUT chain!!??

No, why? It was not a broadcast packet. Your syslog itself says:
DST=10.6.15.246.

>
> ----- Original Message ----- From: "Jan Engelhardt" <jengelh@medozas.de>
> To: "Julio A. Romero" <julioarr@fisica.uh.cu>
> Cc: <netfilter@vger.kernel.org>
> Sent: Monday, September 19, 2011 11:38 AM
> Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
>
>
>> On Monday 2011-09-19 17:29, Julio A. Romero wrote:
>>
>>> This is a real scenario:
>>>
>>> My external eth0=10.6.100.109, eth0:0=10.6.100.104
>>> My internal eth2=10.6.13.254
>>> My internal networks=10.6.11.0/24,10.6.13.0/24,10.6.40.0/24
>>>
>>> Why these packests [below] appear into the forward chain?
>>
>> Where else should they appear?
>>
>>> Sep 19 10:44:32 firewall kernel: [316561.880144] FW:FWD:netfilter_fwd:?
>>> IN=eth0 OUT=eth0 SRC=10.28.10.76 DST=10.6.15.246 LEN=60 TOS=0x00
>>> PREC=0x00 TTL=54 ID=17064 PROTO=ICMP TYPE=8 CODE=0 ID=512 SEQ=12558
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> --------------------------------------------------------------------------------
>
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com
> Version: 9.0.914 / Virus Database: 271.1.1/3906 - Release Date: 09/19/11
> 02:34:00
>
>

