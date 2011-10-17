From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: route sorting
Date: Mon, 17 Oct 2011 21:32:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110172131040.19263@frira.zrqbmnf.qr>
References: <4E9C1E1C.4060309@googlemail.com> <4E9C2BA6.6030507@mejor.pl> <4E9C449D.2060907@tolaris.com> <4E9C4BD7.7000403@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E9C4BD7.7000403@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "Tyler J. Wagner" <tyler@tolaris.com>, =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>, netfilter@vger.kernel.org


On Monday 2011-10-17 17:37, Mr Dash Four wrote:
>  
> Yeah, that helped - thank you both! I think I also found a little discrepancy
> while executing "ip rule list <number>" (wrong syntax, obviously) - it shows me
> "'ip rule show' does not take any arguments." error message. Should that be
> ""ip rule list" does not take any arguments." instead?

show and list are equal, and FWIW, the number you see is not a rule number,
but a priority.

> I am still curious though why the sorting order in the old "route" has changed
> from one kernel version to the next?

Possibly because the kernel changed its way, and ye olde broken
net-tools does not sort it on its own. (Similar to how
getdents/readdir is not required to return entries in sorted fashion)
