From: Radek Kanovsky <rk@dat.cz>
Subject: Re: iptables rules in comparable form
Date: Tue, 1 Jun 2010 21:36:29 +0200
Message-ID: <20100601193629.GC19088@q.uh.cz>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr> <4C04D07F.6040702@chello.at> <20100601112552.GA15745@q.uh.cz> <alpine.LSU.2.01.1006011353310.22291@obet.zrqbmnf.qr> <20100601180106.GA19088@q.uh.cz> <alpine.LSU.2.01.1006012020370.15461@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.01.1006012020370.15461@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Tue, Jun 01, 2010 at 08:26:30PM +0200, Jan Engelhardt wrote:

> Sounds like you need xt_quota2. As its counters are independent of
> rules when given names, they can never get set back to a value
> less than what they were.

I wanted to avoid any nonstandard packages but this looks promissing.
I will take a look. Thanks.

> As I said before, there is no concept of unchanged rules.
> 
> When you iptables -A, the entire ruleset is fetched from the kernel,
> then modified, and finally reinserted - even when having only
> added a single rule.

But I have scalability problems even if there is declared O(N)
complexity of iptables-restore. There is a really big difference
if counters are reset at 9:14:01 or at 9:14:53. I am not sure
what COMMIT during restoration exactly do but can't it be 
used for tuning in such cases?

Radek Kanovsky
