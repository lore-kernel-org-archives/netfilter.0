From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: increase the number of routing tables
Date: Mon, 30 Jan 2012 03:02:35 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201300300270.21178@frira.zrqbmnf.qr>
References: <CANj2EbfR0cBaBd+t1yCZyErRpVzSC00DZohvtyazK8_9bv2aEQ@mail.gmail.com> <CANj2EbesFkNd-d=_Q0wwTLspUbYyevTTc-oS915HJKtpwzBQ_Q@mail.gmail.com> <alpine.LNX.2.01.1201291245001.1201@frira.zrqbmnf.qr> <4F25D52B.1050701@wildgooses.com>
 <20120129163151.416035ef@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120129163151.416035ef@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Ed W <lists@wildgooses.com>, Simon Chen <simonchennj@gmail.com>, netfilter@vger.kernel.org

On Monday 2012-01-30 01:31, Stephen Hemminger wrote:

>On Sun, 29 Jan 2012 23:24:27 +0000
>Ed W <lists@wildgooses.com> wrote:
>
>> On 29/01/2012 11:50, Jan Engelhardt wrote:
>> > On Sunday 2012-01-29 03:23, Simon Chen wrote:
>> >
>> >> Hey folks,
>> >>
>> >> To my limited knowledge, Linux currently supports 256 (255?) routing
>> >> tables defined in /etc/iproute2/rt_tables.
>> > There are 2147483647.
>> >
>> 
>> Any reason why it's not an unsigned 32bit int? (surely there is a corner 
>> case where this is useful...)
>> 
>> Ed W
>
>The 8 bit value is enshrined in the API for 'struct rtmsg' and therefore
>increasing it would break existing applications. 

Actually, what Ed (and me too) was wondering about was:

why does `ip route show table $[0x80000000]` not print an empty table, 
i.e. where is it that some code uses int/s32 during parsing of 
the argument and/or the RTA_TABLE attribute?
