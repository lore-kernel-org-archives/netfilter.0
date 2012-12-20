From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 23:42:14 -0800
Message-ID: <50D2C156.2050801@nottheoilrig.com>
References: <50D01F13.7030707@nottheoilrig.com> <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr> <50D1EE31.6060201@nottheoilrig.com> <alpine.LNX.2.01.1212192247440.17747@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1355989346;
	bh=azAB8+MrwSEL9HriZESdsD9v79geDLXpsOTxLYdRkIU=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=kHZ7qU66sghyHuBRit7y5wviGFRNun3FpnDzZr0dYiR3Mr6gDxweNh/ySlcpuExXv
	 HxLkyKIu+q6xqQ4aVKqA/sAnXe8zg7rUrJdvIbjvKWsMxPX9g96OpN6DPYhsa6QDdl
	 Oq2DPadAuQiO9po/lJvgMGclhSKvNHcGLp1ZvkTE=
In-Reply-To: <alpine.LNX.2.01.1212192247440.17747@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On 19/12/12 01:51 PM, Jan Engelhardt wrote:
>
> On Wednesday 2012-12-19 17:41, Jack Bates wrote:
>>
>>> A second possibility, when proxy server and origin server are on the
>>> same Ethernet subnet, is to look at the L2 address. Of course the L2
>>> addr can be "tproxified" as well, but usually is not worth doing.
>>
>> This is a possibility, with "iptables -m mac --mac-source ..." The proxy and
>> the router are on the same subnet. Are there any other options?
>>
>> I tried adding a second IP to the router, as an alias, changing the default
>> gateway of the proxy to this other address, and matching traffic from the proxy
>> with "iptables -i br-lan:1" but I discovered that --in-interface doesn't
>> support aliases (I guess this makes sense, traffic doesn't reference the IP of
>> the next hop, so how can you tell which alias it arrived on?)
>
> Obviously, using the iptables -d option.

--destination is the ultimate destination. Say our "br-lan" router 
interface is 192.168.1.1 and our "br-lan:1" alias is 192.168.1.84. The 
default gateway for clients is 192.168.1.1, so when a client makes a 
request to an origin server, 12.34.56.78, it forwards it to 192.168.1.1 
(--destination is 12.34.56.78)

The router intercepts this request and reroutes it to our transparent 
proxy. The default gateway for the proxy is 192.168.1.84, so when it 
makes a request to the origin server, it forwards it to 192.168.1.84 
(--destination is 12.34.56.78)

I think iptables can't tell whether the request was forwarded to 
192.168.1.1 or 192.168.1.84, so it can't tell whether it arrived on the 
"br-lan" interface or the "br-lan:1" alias?

>>>> and route the former to the proxy, but not route the latter.
>>>
>>> As you have noticed, if the original client address is used, routing
>>> topology/rules needs to be laid out such that packets to client
>>> addresses always pass through the proxy server machine in both
>>> directions. (This is the same prerequisite as for connection-tracked
>>> NAT.)
>>
>> Discriminating between responses from origin servers and responses from the
>> proxy is easier because the proxy is on a different router interface than our
>> internet connection, so I use the following to reroute responses via the
>> transparent proxy:
>>
>> iptables -A PREROUTING -t mangle -i eth0.2 -p tcp --sport 80 -j MARK --set-mark
>> 1/1
>
> You probably know that, by using CONNMARK, you can always mark it..
>
> -i eth0.2 -j CONNMARK --mark 1 all packets coming from the proxy server,
> -i internet -j CONNMARK --restore-mark for all packets from $internet
>
> and then routing back to the proxy also works - based solely on fwmark.

Right, using CONNMARK to reroute responses from origin servers back via 
the proxy would also work. Thanks!

>> ip rule add fwmark 1/1 table 1
>> ip route add table 1 via 192.168.1.35

So some options for discriminating client requests from proxy requests are:

   * Application layer (e.g. Via: header)
   * --mac-source
   * TOS/DSCP field

Are there any other options worth considering? Do you have any advice 
about which to choose?
