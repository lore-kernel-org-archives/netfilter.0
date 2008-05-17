From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: sequence of matches in a single rule
Date: Sat, 17 May 2008 10:35:47 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805171032270.15590@fbirervta.pbzchgretzou.qr>
References: <001501c8b7e0$8ef50a00$acdf1e00$@com> <alpine.LNX.1.10.0805170905070.15590@fbirervta.pbzchgretzou.qr> <002801c8b7ee$a72b2060$f5816120$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002801c8b7ee$a72b2060$f5816120$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-05-17 09:21, Nishit Shah wrote:
>>>Hi,
>>>	Is there any specific order in which match will take place ?
>>
>>Yes. For -m conntrack and -m mark however, it does not matter,
>>as no internal state is modified. It does matter however,
>>for example, with -m statistic --mode nth and -m quota.
>
>So, can I have that order somewhere mentioned or I need to go through source
>code ? If I write some of my own match do I have any way to change the match
>preference ? 

This is not decided in source code. The order is defined by you when
you pass the -m options to iptables.

>	The reason I am asking is, there are some matches that are CPU
>incentive and some are not. For an example I prefer -m mark to always take
>precedence before -m limit or -m hashlimit, something like that..

Correct.
Note however, that limit and hashlimit have an internal state.

Using -m mark -m hashlimit, hashlimit only gets to see packets of
a specific mark, while -m hashlimit -m mark, hashlimit gets to
see all packets, and mark only sees packets which successfully
passed hashlimit.

>	Or is it more preferable to not use such thing in single rule and
>prefer 2 iptables rules for that ?

One rule is much preferred in this case.
