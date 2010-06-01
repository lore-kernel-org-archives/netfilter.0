From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 20:35:28 +0200
Message-ID: <20100601183528.GB19088@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601160337.GB15745@q.uh.cz> <alpine.LSU.2.01.1006012010510.15461@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.01.1006012010510.15461@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 08:19:35PM +0200, Jan Engelhardt wrote:

> >I know that iptables-restore with 10000 rules on input is faster than
> >10000 sequential "iptables -A ..." rules. It is obvious. But anyway it
> >is sometimes slower than my one "iptables -D" command followed by one
> >"iptables -A" command that both together reflect one particular change
> >in ruleset that I am able to recognize with rule comparison. Especially
> >under higher load. Reason is not obvious.
> 
> Look obvious to me. Under load, the execution time of a process can
> arbitrarily be delayed by other processes. That isn't really a
> surprise. The delay itself is even a function of that factor.

I didn't want to say it but it would be better described as some
kind of deadlock if system is in good health but iptables-save that
started hour before doesn't mean to finish.

Radek Kanovsky
