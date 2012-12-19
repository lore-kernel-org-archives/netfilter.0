From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 08:41:21 -0800
Message-ID: <50D1EE31.6060201@nottheoilrig.com>
References: <50D01F13.7030707@nottheoilrig.com> <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1355935297;
	bh=EziWZ8PshQnxX7rk6LuW443m7lnF2mKYIXguOkAgFiM=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=J92RAOZJtcnY3uBl8CLlwxtKv6yuHr6ZmTd1x0ycxJEY2sNJ+CLzbdtNtXufUBvKr
	 8sEGR4wQHENMxlR147Uhcbrdcrvd6GdtHCrYNNrIqOtcOCSfkxCrZGZf8TlyCuPMPi
	 /gOwWtpvT8bFeETAPWF8VnUDBzJ7DJIkbN+guP5Q=
In-Reply-To: <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On 18/12/12 12:27 AM, Jan Engelhardt wrote:
> On Tuesday 2012-12-18 08:45, Jack Bates wrote:
>
>> Do you have any advice how to discriminate traffic from clients from
>> traffic from our transparent proxy?
>>
>> Our proxy sends requests to origin servers with the same source address
>> as the request from the client, so we can do per-host traffic shaping
>> on our router. [What options are there?]
>
> I take it you might be using something like squid and tproxy.

You're right, we're using Apache Traffic Server and tproxy. Traffic 
Server is configured with "CONFIG proxy.config.http.server_ports STRING 
8080:tr-full" to make both connections to clients and connections to 
origin servers transparent.

>> But consequently I wonder how to discriminate client requests from proxy
>> requests,
>
> The origin servers can inspect the "Via:" HTTP request header to
> determine the presence of a proxy. There might be other headers your
> proxy server is emitting that you would normally not find in a pure
> client request.

Interesting suggestion, I hadn't thought of inspecting the application 
layer. I want our router (not the origin server) to discriminate between 
requests from clients and requests from the proxy (to reroute the former 
via the transparent proxy, but not the latter) so I had in mind teaching 
iptables to recognize the difference.

We run Traffic Server as a forward proxy.

> A second possibility, when proxy server and origin server are on the
> same Ethernet subnet, is to look at the L2 address. Of course the L2
> addr can be "tproxified" as well, but usually is not worth doing.

This is a possibility, with "iptables -m mac --mac-source ..." The proxy 
and the router are on the same subnet. Are there any other options?

I tried adding a second IP to the router, as an alias, changing the 
default gateway of the proxy to this other address, and matching traffic 
from the proxy with "iptables -i br-lan:1" but I discovered that 
--in-interface doesn't support aliases (I guess this makes sense, 
traffic doesn't reference the IP of the next hop, so how can you tell 
which alias it arrived on?)

>> and route the former to the proxy, but not route the latter.
>
> As you have noticed, if the original client address is used, routing
> topology/rules needs to be laid out such that packets to client
> addresses always pass through the proxy server machine in both
> directions. (This is the same prerequisite as for connection-tracked
> NAT.)

Discriminating between responses from origin servers and responses from 
the proxy is easier because the proxy is on a different router interface 
than our internet connection, so I use the following to reroute 
responses via the transparent proxy:

iptables -A PREROUTING -t mangle -i eth0.2 -p tcp --sport 80 -j MARK 
--set-mark 1/1
ip rule add fwmark 1/1 table 1
ip route add table 1 via 192.168.1.35
