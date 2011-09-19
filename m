From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: Re: ping broadcast into forward chain?? (IN=eth0 OUT=eth0)!!
Date: Mon, 19 Sep 2011 12:38:56 -0400
Message-ID: <6EA3623734DF44D68A345CD9CF3D34C2@poweredge1800>
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

 ok, the packets are forwarding in eth0, so why?

the sources of the packets is outside of my networks and also the
destination:
SRC=10.28.10.76 DST=10.6.15.246

eth0=10.6.100.109 and eth0:0=10.6.100.104 and eth2=10.6.13.254

root@firewall:~# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
10.6.13.0       10.6.13.253     255.255.255.252 UG    0      0        0 eth2
10.6.13.252     0.0.0.0         255.255.255.252 U     0      0        0 eth2
10.6.100.0      0.0.0.0         255.255.255.0   U     0      0        0 eth0
10.6.12.0       10.6.100.113    255.255.255.0   UG    0      0        0 eth0
10.6.40.0       10.6.13.253     255.255.255.0   UG    0      0        0 eth2
10.6.11.0       10.6.13.253     255.255.255.0   UG    0      0        0 eth2
0.0.0.0         10.6.100.1      0.0.0.0         UG    0      0        0 eth0

>
>> the packets don't go through the box or yes?!
>
> Of course they do go through your box, otherwise it would not be able to
> log them.
>
>> what happen if I remove the rule to log?
>
> There would be no entry in syslog, obviously.
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

