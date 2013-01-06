From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Wrapper script for ipset listing
Date: Sun, 6 Jan 2013 21:06:23 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr> <50E8F495.40307@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50E8F495.40307@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>


On Sunday 2013-01-06 04:50, Born Without wrote:
>>> As I was missing those features in the ipset set listing capabilities:
>>>
>>> - show sum of set members
>>> - suppress listing of headers
>>> - choose a delimiter character for separating member entries
>>>
>>> I wrote a little wrapper script (for the bash shell) to support them.
>>> For those who like, you'll find it attached.
>>
>> There's libipset, with which this task should be achievable to the
>> maximum customizable degree without involving ugly text parsing with sh.
>
> Hello Jan,
>
> good you mention libipset, because not even the man page does, nor does any
> documentation or similar exist.

I have taken Joszef into Cc..

> Interesting, that you belittle text parsing, it's such a common task in linux.
> And thank you for telling us, that C has more power that sh. Really great
> insight!

"Common" does not mean "the right thing", especially if the output is prone to
change - and by definition, everything that has not been declared as giving a
stable output can easily change at inconvenient times, depending on moon phase
and locale settings.

Stable output does not necessarily mean a C API. Tools default to output
human-readable prose, and may require specific options to put them into
machine-parseable mode. Compare: `date` vs. `date -d +"%F %T"` (parseable).
