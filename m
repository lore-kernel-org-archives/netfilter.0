From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: sequence of matches in a single rule
Date: Sat, 17 May 2008 11:12:15 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805171111390.15590@fbirervta.pbzchgretzou.qr>
References: <001501c8b7e0$8ef50a00$acdf1e00$@com> <alpine.LNX.1.10.0805170905070.15590@fbirervta.pbzchgretzou.qr> <002801c8b7ee$a72b2060$f5816120$@com> <alpine.LNX.1.10.0805171032270.15590@fbirervta.pbzchgretzou.qr> <000101c8b7fa$cb8f91f0$62aeb5d0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000101c8b7fa$cb8f91f0$62aeb5d0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-05-17 10:48, Nishit Shah wrote:
>
>>Using -m mark -m hashlimit, hashlimit only gets to see packets of
>>a specific mark, while -m hashlimit -m mark, hashlimit gets to
>>see all packets, and mark only sees packets which successfully
>>passed hashlimit.
>
>
>Thanks for your explanation Jan,
>	Just curious what will happen in case when internal state is
>modified ?

See above.

>	What is the sequence of match when I have,

From left to right.

>
>		1.) -m statistic --mode nth and -m quota
>		2.) -m quota and -m statistic --mode nth
>
>		3.) -m statistic --mode nth and -m state
>		4.) -m state and -m statistic --mode nth
>
>Rgds,
>Nishit Shah.
>

