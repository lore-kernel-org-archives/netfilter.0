From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Fwd: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 10:46:26 +0200
Message-ID: <75d06629-de72-651f-4167-82d9a973b442@thelounge.net>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom <tom@foscore.com>, netfilter@vger.kernel.org



Am 07.09.22 um 17:57 schrieb Tom:
> Now I'm confused. I'd like to avoid ping floods if possible

but that makes no sense when doing more harm than good - the knee-jerk 
reaction kill all icmp is a problem for decades even on IPv4 but will no 
longer work with IPv6

> but I can't 
> seem to get the syntax right, so:
> enable ping6 rate limiting without crippling icmpv6, please do!

one of the responses contained "Please use 'icmpv6 type { echo-request, 
echo-reply}'"

why do you make all that so complicated instead write a simple ratelimit 
rule for ping apply to everyone and *before* have a set which ACCEPTs a 
specific list of ip's if that's needed at all

"I'd like to avoid ping floods if possible" don't scale at all with a 
manually maintained list of source ips and i can't think of anybody with 
a justification of more than 5 pings per second



