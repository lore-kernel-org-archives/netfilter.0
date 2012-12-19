From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 22:51:00 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212192247440.17747@nerf07.vanv.qr>
References: <50D01F13.7030707@nottheoilrig.com> <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr> <50D1EE31.6060201@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D1EE31.6060201@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-12-19 17:41, Jack Bates wrote:
>
>> A second possibility, when proxy server and origin server are on the
>> same Ethernet subnet, is to look at the L2 address. Of course the L2
>> addr can be "tproxified" as well, but usually is not worth doing.
>
> This is a possibility, with "iptables -m mac --mac-source ..." The proxy and
> the router are on the same subnet. Are there any other options?
>
> I tried adding a second IP to the router, as an alias, changing the default
> gateway of the proxy to this other address, and matching traffic from the proxy
> with "iptables -i br-lan:1" but I discovered that --in-interface doesn't
> support aliases (I guess this makes sense, traffic doesn't reference the IP of
> the next hop, so how can you tell which alias it arrived on?)

Obviously, using the iptables -d option.

>>> and route the former to the proxy, but not route the latter.
>>
>> As you have noticed, if the original client address is used, routing
>> topology/rules needs to be laid out such that packets to client
>> addresses always pass through the proxy server machine in both
>> directions. (This is the same prerequisite as for connection-tracked
>> NAT.)
>
> Discriminating between responses from origin servers and responses from the
> proxy is easier because the proxy is on a different router interface than our
> internet connection, so I use the following to reroute responses via the
> transparent proxy:
>
> iptables -A PREROUTING -t mangle -i eth0.2 -p tcp --sport 80 -j MARK --set-mark
> 1/1

You probably know that, by using CONNMARK, you can always mark it..

-i eth0.2 -j CONNMARK --mark 1 all packets coming from the proxy server,
-i internet -j CONNMARK --restore-mark for all packets from $internet

and then routing back to the proxy also works - based solely on fwmark.

> ip rule add fwmark 1/1 table 1
> ip route add table 1 via 192.168.1.35
