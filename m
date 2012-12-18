From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Tue, 18 Dec 2012 09:27:09 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212180909200.28945@nerf07.vanv.qr>
References: <50D01F13.7030707@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D01F13.7030707@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-12-18 08:45, Jack Bates wrote:

>Do you have any advice how to discriminate traffic from clients from 
>traffic from our transparent proxy?
>
>Our proxy sends requests to origin servers with the same source address 
>as the request from the client, so we can do per-host traffic shaping 
>on our router. [What options are there?]

I take it you might be using something like squid and tproxy.

>But consequently I wonder how to discriminate client requests from proxy
>requests,

The origin servers can inspect the "Via:" HTTP request header to 
determine the presence of a proxy. There might be other headers your 
proxy server is emitting that you would normally not find in a pure 
client request.

A second possibility, when proxy server and origin server are on the 
same Ethernet subnet, is to look at the L2 address. Of course the L2 
addr can be "tproxified" as well, but usually is not worth doing.

>and route the former to the proxy, but not route the latter.

As you have noticed, if the original client address is used, routing 
topology/rules needs to be laid out such that packets to client 
addresses always pass through the proxy server machine in both 
directions. (This is the same prerequisite as for connection-tracked 
NAT.)
