From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
Date: Mon, 19 Sep 2011 20:22:14 -0400
Message-ID: <6B22FB92A9864DA693C93B7256F459C6@poweredge1800>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr> <0103CB00F80F4E64AF7B894570B0688A@poweredge1800> <alpine.LNX.2.01.1109191814230.11243@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


----- Original Message ----- 
From: "Jan Engelhardt" <jengelh@medozas.de>
To: "Julio A. Romero" <julioarr@fisica.uh.cu>
Cc: <netfilter@vger.kernel.org>
Sent: Monday, September 19, 2011 12:15 PM
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!


> On Monday 2011-09-19 18:10, Julio A. Romero wrote:
>
>>
>> ----- Original Message ----- From: "Jan Engelhardt" <jengelh@medozas.de>
>> To: "Julio A. Romero" <julioarr@fisica.uh.cu>
>> Cc: <netfilter@vger.kernel.org>
>> Sent: Monday, September 19, 2011 11:55 AM
>> Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
>>
>>
>>> Bah, don't strip the CC, and don't top-post.
>>>
>>> On Monday 2011-09-19 17:43, Julio A. Romero wrote:
>>>
>>>> In the INPUT chain!!??
>>>
>>> No, why? It was not a broadcast packet. Your syslog itself says:
>>> DST=10.6.15.246.
>>
>> but 10.6.15.246 is outside of my internal networks ??
>
> Yes, which is why it goes to OUT=eth0.
>
>> the packets don't go through the box or yes?!
>
> Of course they do go through your box, otherwise it would not be able to
> log them.
>
>> what happen if I remove the rule to log?
>
> There would be no entry in syslog, obviously.

now I know what happen!

anyone, I don't know who, he/she set a unassigned route pointing to my box. 
The packets arrived to my box through the external interface and then the 
destination is wrong, so, the packets go to the default gateway configured 
in my box, again through the external interface because the default gateway 
is outside of my network. When I set a rule in the FORWARD chain logging and 
dropping the packet whose source or destination don't match with my 
networks, I never thought in the above-mentioned situation.

thanks once again!
julio

>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--------------------------------------------------------------------------------



No virus found in this incoming message.
Checked by AVG - www.avg.com
Version: 9.0.914 / Virus Database: 271.1.1/3906 - Release Date: 09/19/11 
02:34:00

