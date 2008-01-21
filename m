From: Philip Craig <philipc@snapgear.com>
Subject: Re: [help] modern iptables rule for transproxy
Date: Mon, 21 Jan 2008 10:48:10 +1000
Message-ID: <4793EBCA.5090401@snapgear.com>
References: <200801181807.m0II78NV022087@betty.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801181807.m0II78NV022087@betty.it.uc3m.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ptb@inv.it.uc3m.es
Cc: netfilter@vger.kernel.org

Peter T. Breuer wrote:
> So PREROUTING = forwarding!  I seeeeee.  Not "before any routing takes
> place", as one might naively have supposed from the name :).

Actually, forwarded was the wrong term.  PREROUTING only sees externally
originated packets (which includes both forwarded and packets destined for
the local machine).  It is before any routing.  OUTPUT only sees locally
originated packets, and is also before any routing too (in theory,
implementation differs ;-).  External and local packets have different
entry points into the stack, so no routing is needed to distinguish
between them.

>> Because the '-s ! $PROXY_BOX' means the rule will not match packets
>> that have proxyhost as the source IP address.
> 
> So telnet's packets would not be redirected as desired. But then there
> is no reason why telnet should choose to set src address on outgoing
> packets to some machine that it doesn't even know about, is there?

Hrmm, I thought this talking about when you were running telnet on the
same host as the proxy, so its quite likely it will use the same address
as the proxy.

>> Use 'iptables -t nat -L -n' and look at the packet counters to see which
> 
> It seems I don't have any. I guess that has to be compiled into the
> kernel or modules somewhere.

Sorry, typo there.. it was meant to be 'iptables -t nat -L -v'

> (I have no idea what number to put for loglevel) without seeing anything

You can use the level names instead of numbers (eg info, err)

