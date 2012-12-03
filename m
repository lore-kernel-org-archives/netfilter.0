From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Mon, 03 Dec 2012 00:43:37 -0800
Message-ID: <50BC6639.3090502@nottheoilrig.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com> <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk> <50B84725.3080608@nottheoilrig.com> <50B851E8.8070107@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1354524227;
	bh=1zG1k7MLVnKlyHvOQ0CdLhW1F5gfgNd+kuL+aLYVRRc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=sNa9b+GjabteMHu7xPTIrwohKbVg95FWKNrwZ9WL/uG7vb8fNgeFyBuwAGnESfe+g
	 FUKjsov2z2P7G/dokp24C/DzzIOKXbaaOdhXW5/LbcREqrETmMUCw2kWFq389JmzOy
	 xXY+4Dssssr3TCTEDfWUTljKwCGcqTvJlFVz4jXA=
In-Reply-To: <50B851E8.8070107@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: giles@coochey.net, Steven Kath <steven@vyatta.com>, netfilter@vger.kernel.org

Thank you Eliezer, how do I shape traffic differently depending on the 
connection mark?

Currently I use the ingress qdisc plus ifb0 plus the tbf qdisc to limit 
the *sum* of our upstream plus downstream traffic to < 1.5mbit (to "own" 
the queue). Something like:

    1: ifconfig ifb0 up
    2:
    3: insmod sch_ingress
    4: tc qdisc add dev eth0.2 ingress
    5:
    6: insmod cls_u32
    7: insmod act_mirred
    8: tc filter add dev eth0.2 root protocol ip u32 match u32 0 0 
action mirred egress redirect dev ifb0
    9: tc filter add dev eth0.2 parent ffff: protocol ip u32 match u32 0 
0 action mirred egress redirect dev ifb0
   10:
   11: insmod sch_tbf
   12: tc qdisc add dev ifb0 root handle 1 tbf rate 1mbit burst 5k 
latency 70ms

Then I use the prio qdisc to prioritize traffic:

   14: insmod sch_prio
   15: tc qdisc add dev ifb0 parent 1: handle 2 prio

I can imagine a couple ways of classifying traffic from our proxy server 
based on the TOS/DSCP field, and also how to set the connection mark 
based on this field. But how do I classify and shape response traffic 
from the origin server based on the connection mark?

On 29/11/12 10:27 PM, Eliezer Croitoru wrote:
> You can do a connection marking\remarking based on the TOS of one packet.
> This way you need to set it only on even one packet of the connection.
>
> Regards,
> Eliezer
>
> On 11/30/2012 7:41 AM, Jack Bates wrote:
>> Cool, thanks a lot for this advice Steven and Giles, our proxy server is
>> Apache Traffic Server, so I started work on a simple "remap" plugin to
>> set TOS/DSCP field:
>> http://nottheoilrig.com/trafficserver/201211300/tos.cc
>>
>> It should enable something like the following, in the Traffic Server
>> remap.config:
>>
>>    map http://gmail.com @plugin=tos.so @pparam=3
>>    map http://facebook.com @plugin=tos.so @pparam=7
>>
>> But what about response traffic? Is there a way to copy the TOS/DSCP
>> field to the response from the origin server?
