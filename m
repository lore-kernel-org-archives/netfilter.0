From: Ed W <lists@wildgooses.com>
Subject: Re: increase the number of routing tables
Date: Sun, 29 Jan 2012 23:24:27 +0000
Message-ID: <4F25D52B.1050701@wildgooses.com>
References: <CANj2EbfR0cBaBd+t1yCZyErRpVzSC00DZohvtyazK8_9bv2aEQ@mail.gmail.com> <CANj2EbesFkNd-d=_Q0wwTLspUbYyevTTc-oS915HJKtpwzBQ_Q@mail.gmail.com> <alpine.LNX.2.01.1201291245001.1201@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201291245001.1201@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Simon Chen <simonchennj@gmail.com>, netfilter@vger.kernel.org

On 29/01/2012 11:50, Jan Engelhardt wrote:
> On Sunday 2012-01-29 03:23, Simon Chen wrote:
>
>> Hey folks,
>>
>> To my limited knowledge, Linux currently supports 256 (255?) routing
>> tables defined in /etc/iproute2/rt_tables.
> There are 2147483647.
>

Any reason why it's not an unsigned 32bit int? (surely there is a corner 
case where this is useful...)

Ed W
