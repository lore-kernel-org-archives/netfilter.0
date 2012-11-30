From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Thu, 29 Nov 2012 21:41:57 -0800
Message-ID: <50B84725.3080608@nottheoilrig.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com> <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1354254124;
	bh=XQytVVa/PVKjA+2iwOcm9kGLlGC6jzEE7FoZBjaiCfQ=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=MD7boO/xn60d0cLhVCJyr+D5RZKgwafCLYuZQmLu5C9IAVS8/YMc3Ah1diajFKfxG
	 8Gmch1mfIt6LNu3l7BSk2AE7iUivS+766VE34yab4yXZAQ24bOprJvdNbNHj7R5Q8f
	 cDYK80ZytIpAc2hr5xUm1MGKVyzgDXTWaIl8Yzlw=
In-Reply-To: <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: giles@coochey.net
Cc: Steven Kath <steven@vyatta.com>, netfilter@vger.kernel.org

On 28/11/12 04:54 AM, Giles Coochey wrote:
> On 28-11-2012 05:25, Steven Kath wrote:
>>> Is there a way to mark traffic on one machine and match the
>>> mark on another machine? so I can classify traffic on the
>>> proxy server and shape it on the router?
>>
>> This question is a good example of the rationale for the
>> TOS/DSCP header on IPv4 packets. netfilter/iptables are
>> quite capable of matching and manipulating the DSCP field,
>> as are some proxy servers.
>> --
>
> +1 to above.
>
> Alternatively, you could route the packet from the proxy to a different,
> secondary IP on the router. The router could then shape all the traffic
> that arrives on the secondary IP. You can achieve the secondary IP with
> sub-interfaces, secondary IP in the same subnet, or separate VLAN
> interfaces
>
> I don't think there is any net-filter tagging, in the way that you can
> tag packets in rules while it passes internally through the proxy, that
> would be visible externally to the router.

Cool, thanks a lot for this advice Steven and Giles, our proxy server is 
Apache Traffic Server, so I started work on a simple "remap" plugin to 
set TOS/DSCP field: http://nottheoilrig.com/trafficserver/201211300/tos.cc

It should enable something like the following, in the Traffic Server 
remap.config:

   map http://gmail.com @plugin=tos.so @pparam=3
   map http://facebook.com @plugin=tos.so @pparam=7

But what about response traffic? Is there a way to copy the TOS/DSCP 
field to the response from the origin server?
