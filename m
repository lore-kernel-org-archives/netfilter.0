From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: DNAT multiple --to-destination gone: why?
Date: Thu, 10 Jul 2008 00:39:02 -0500
Message-ID: <4875A076.5090907@riverviewtech.net>
References: <487558AC.8080704@ca.sophos.com> <48759A72.9030503@usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48759A72.9030503@usa.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/10/08 00:13, Josh Cepek wrote:
> Here's a workaround that might do what you seek.  Optionally, you might 
> consider a DNS-RR instead if it makes sense for your needs.

DNS based load balancing is ok, but it is better in theory.  I think 
something like LVS will do a much better job.

> With the statistic match you can create a round-robin that targets each 
> rule in turn.  To do what you seek above you could use this series of 
> rules, with your own additional matches added as required:
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT 
> 10.0.0.101-102
> iptables -A PREROUTING -t nat -j DNAT 10.0.0.104-105

I suppose this would work for a fairly static set of destination 
servers.  Seeing as how you would have to re-write the rules if a back 
end server was added or removed, this would be a major PITA if the 
servers were dynamic in nature.

> This is conceptually the same (but simpler than) the following series of 
> rules:
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 4 -j DNAT 
> 10.0.0.101
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 3 -j DNAT 
> 10.0.0.102
> iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT 
> 10.0.0.104
> iptables -A PREROUTING -t nat -j DNAT 10.0.0.105
> 
> Of course, you can continue to add more rules as required.

Ugh.  That does not scale very well at all.  If you want to remove 102 
from above, you would have to re-write all the rules above it.



Grant. . . .
