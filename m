From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Fri, 14 Nov 2008 13:03:51 +0100
Message-ID: <491D6927.3010701@netfilter.org>
References: <20081113100309.GH26975@bla.fasel.org> <20081113132723.GK26975@bla.fasel.org> <20081113174138.GM26975@bla.fasel.org> <20081113201042.GN26975@bla.fasel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081113201042.GN26975@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Wolfram Schlich wrote:
> * Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-13 18:41]:
>> * Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-13 14:27]:
>>> Here's the answer from the PaX team, for those who might be interested:
>>> * pageexec@freemail.hu <pageexec@freemail.hu> [2008-11-13 14:18]:
>>>> [...]
>>>> this is a null function pointer dereference problem on the surface and you'll have to
>>>> debug it to get more info. i wonder why nothing shows up in the stack dump however,
>>>> maybe there's more corruption here behind the scenes. once you get the coredumps (and
>>>> i hope you have debug info saved away ;) we can get a backtrace and other things. also
>>>> disable randomization in /proc/sys/... so that results are comparable. best would be
>>>> to find a way to directly trigger this crash, then you could have a live gdb session
>>>> instead of coredump analysis.
>>> I'll take care of these suggestions now and let you know
>>> about any news.
>> I've now recompiled conntrack-tools using these CFLAGS:
>>
>> 	-march=nocona -O0 -ggdb -DDEBUG
>>
>> Also, the binaries were not stripped anymore:
>>
>> 	/usr/sbin/conntrackd: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), for GNU/Linux 2.6.9, not stripped
>>
>> (I forgot to mention I'm on a 64bit kernel + userland).

My testbed for stress testing is also a 64 bit platform.

>> I'm now stressing the firewalls with packets.
> 
> Damnit, it doesn't break! :)

So it seems that it is only triggered with PaX enabled.

> Been stressing the firewall with gigabytes of packets...
> Last time it crashed, it hadn't receive a hundred megabytes
> of packets at all... *sigh*

Probably you can run conntrackd inside valgrind to see if it complains 
about any invalid memory access.

BTW, I'm interested in whatever benchmark results of conntrackd, just 
for the record.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
