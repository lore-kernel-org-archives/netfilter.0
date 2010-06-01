From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 20:19:35 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006012010510.15461@obet.zrqbmnf.qr>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601160337.GB15745@q.uh.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100601160337.GB15745@q.uh.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Radek Kanovsky <rk@dat.cz>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-06-01 18:03, Radek Kanovsky wrote:
>
>I know that iptables-restore with 10000 rules on input is faster than
>10000 sequential "iptables -A ..." rules. It is obvious. But anyway it
>is sometimes slower than my one "iptables -D" command followed by one
>"iptables -A" command that both together reflect one particular change
>in ruleset that I am able to recognize with rule comparison. Especially
>under higher load. Reason is not obvious.

Look obvious to me. Under load, the execution time of a process can
arbitrarily be delayed by other processes. That isn't really a
surprise. The delay itself is even a function of that factor.

>I was forced also implement my
>own locking and memoization around iptables-save that prevents its
>concurrent invocation from accounting process.

Indeed, if iptables has to race with another instance of itself,
when replacing a table, it has to retry whole the operation.
