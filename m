From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Thu, 20 Dec 2012 09:18:43 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212200858460.2026@nerf07.vanv.qr>
References: <50D01F13.7030707@nottheoilrig.com> <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr> <50D1EE31.6060201@nottheoilrig.com> <alpine.LNX.2.01.1212192247440.17747@nerf07.vanv.qr> <50D2C156.2050801@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D2C156.2050801@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org


On Thursday 2012-12-20 08:42, Jack Bates wrote:

>>> with "iptables -i br-lan:1" but I discovered that --in-interface doesn't
>>> support aliases (I guess this makes sense, traffic doesn't reference the IP
>>> of
>>> the next hop, so how can you tell which alias it arrived on?)
>>
>> Obviously, using the iptables -d option.
>
>--destination is the ultimate destination. The default gateway for the 
>proxy is 192.168.1.84, so when it makes a request to the origin server, 
>it forwards it to 192.168.1.84 (--destination is 12.34.56.78)
>
>I think iptables can't tell whether the request was forwarded to 
>192.168.1.1 or 192.168.1.84, so it can't tell whether it arrived on the 
>"br-lan" interface or the "br-lan:1" alias?

It is not an iptables problem.

The question is, how do you define "arriving on br-lan:1"? That is, 
looking only at one Ethernet packet, how would you tell it is "for 
br-lan:1" rather than for br-lan? Open a hexdump, tell me which byte(s) 
shall represent "br-lan:1".


> So some options for discriminating client requests from proxy requests are:
>
>  * Application layer (e.g. Via: header)
>  * --mac-source

This one usually in the form of -m mac ! --mac-source <proxy's-mac>

>  * TOS/DSCP field

I would not put too much reliance on this one, as hosts take more 
freedom in setting this field to whatever they like.

> Are there any other options worth considering? Do you have any advice about
> which to choose?

With separate interfaces one more option can be constructed.
