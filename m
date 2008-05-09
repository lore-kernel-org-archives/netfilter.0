From: Geoff Crompton <geoffc@trinity.unimelb.edu.au>
Subject: Re: ip rule fwmarks letting me down
Date: Fri, 09 May 2008 11:57:42 +1000
Message-ID: <4823AF96.1010107@trinity.unimelb.edu.au>
References: <4822967E.8030407@trinity.unimelb.edu.au> <4822F740.4070400@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4822F740.4070400@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: whiplash <whiplash@bofhland.org>
Cc: netfilter@vger.kernel.org

whiplash wrote:
> Geoff Crompton wrote:
> 
>> So when I ping from a machine behind this firewall, it should be routed
>> via 203.28.240.92, but it isn't. I've been running tcpdump on both
>> 203.28.240.92 and 203.28.240.91, and the packets are definately being
>> routed via 203.28.240.91.
> 
> Did you
> ip route flush cache
> before testing?

No, but I have now, and it made no difference. From my perspective, it
looks like a failure in the routing policy database, so I'm not suprised
that an 'ip route' command didn't change the situation. (However I know
nothing about the code internals, so I'm happy to conceed the point if
someone knows better).

BTW, how long do route caches last?

-- 
+-Geoff Crompton
+--Debian System Administrator
+---Trinity College


