From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cross compilation of xtables fails
Date: Fri, 3 Dec 2010 21:30:39 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012032116440.26825@obet.zrqbmnf.qr>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com> <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr> <4CF8FF76.8040709@googlemail.com> <alpine.LNX.2.01.1012031539310.11961@obet.zrqbmnf.qr>
 <4CF94596.4080002@googlemail.com> <alpine.LNX.2.01.1012032044120.26825@obet.zrqbmnf.qr> <4CF94A8E.6060108@googlemail.com> <alpine.LNX.2.01.1012032054100.26825@obet.zrqbmnf.qr> <4CF94D58.6080008@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF94D58.6080008@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-12-03 21:04, Mr Dash Four wrote:

>
>>> I presume I need to attach add "-march=i686 -mtune=pentium2" to LDFLAGS as
>>> well, seeing that gcc executes as "gcc -shared -m32 -o ..." if
>>> LDFLAGS="-m32",
>>> right?
>>>    
>>
>> No, -march and -mtune are compile flags.
>>  
> OK, I am perfecting it now...Thanks a bunch for helping me out!
>
> On a side note I see that in 1.31 --with-xlibdir is removed - how would xtables
> know what I am compiling/building for (x86_64 or i686)?

It never used xtlibdir to determine what you want to build for.
You tell it via --host and cflags/ldflags/etc.
