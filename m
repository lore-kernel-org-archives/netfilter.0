From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: increase the number of routing tables
Date: Mon, 30 Jan 2012 19:57:20 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201301956290.3370@frira.zrqbmnf.qr>
References: <CANj2EbfR0cBaBd+t1yCZyErRpVzSC00DZohvtyazK8_9bv2aEQ@mail.gmail.com> <CANj2EbesFkNd-d=_Q0wwTLspUbYyevTTc-oS915HJKtpwzBQ_Q@mail.gmail.com> <alpine.LNX.2.01.1201291245001.1201@frira.zrqbmnf.qr> <4F25D52B.1050701@wildgooses.com>
 <20120129163151.416035ef@nehalam.linuxnetplumber.net> <alpine.LNX.2.01.1201300300270.21178@frira.zrqbmnf.qr> <20120130081458.697d6099@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120130081458.697d6099@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Ed W <lists@wildgooses.com>, Simon Chen <simonchennj@gmail.com>, netfilter@vger.kernel.org

On Monday 2012-01-30 17:14, Stephen Hemminger wrote:

>> >> > There are 2147483647.
>> >> 
>> >> Any reason why it's not an unsigned 32bit int? (surely there is a corner 
>> >> case where this is useful...)
>> >
>> >The 8 bit value is enshrined in the API for 'struct rtmsg' and therefore
>> >increasing it would break existing applications. 
>> 
>> Actually, what Ed (and me too) was wondering about was:
>> 
>> why does `ip route show table $[0x80000000]` not print an empty table, 
>> i.e. where is it that some code uses int/s32 during parsing of 
>> the argument and/or the RTA_TABLE attribute?
>
>There are lots of places internally in ip utilities that use u32
>for route table. But the route input/output message format is still limited
>to 8 bits.

But then, adding a rule to table 258 would make it show up in table 2 as 
well, which is not the case.
