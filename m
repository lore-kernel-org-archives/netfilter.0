From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: [help] modern iptables rule for transproxy
Date: Fri, 11 Jan 2008 16:30:27 +1300
Message-ID: <4786E2D3.2040702@treenet.co.nz>
References: <200801101602.m0AG2iC5022136@betty.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801101602.m0AG2iC5022136@betty.it.uc3m.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Peter T. Breuer wrote:
> I'd be much obliged if somebody could give me a modern iptables
> equivalent for this ipchains rule
> 
>    ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081

My auto-generated FW has this (with suitable replacements):

iptables -t nat -A PREROUTING -i $LOCAL_IFACE -p tcp -s ! $PROXY_BOX 
--dport 80 -j REDIRECT --to-ports 8081

> 
> which is intended to redirect OUTGOING packets with port 80 as
> destination to port 8081 on localhost, where I have tproxy sitting
> waiting to talk to the LAN web proxy and cache.
> 
> The tproxy man page doesn't give anything other than ipfw (freebsd)
> or ipfwadm or ipchains (or ipnat, whatever that is) rules, but then it
> was written in 2000. Perhaps the man page could be updated, with a
> suitable note of thanks, when we know what to put in it!
> 
> Thanks in advance!
> 
> Peter (ptb@cs.bham.ac.uk, ptb@inv.it.uc3m.es)
> 

Amos
-- 
Please use Squid 2.6STABLE17 or 3.0STABLE1.
There are serious security advisories out on all earlier releases.

