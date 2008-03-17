From: mouss <mouss@netoyen.net>
Subject: Re: simple netfilter machine redirection
Date: Mon, 17 Mar 2008 10:31:58 +0100
Message-ID: <47DE3A8E.5020307@netoyen.net>
References: <200803162323.m2GNNXe3013255@dell2.home> <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan> <47DDA102.4060607@netoyen.net> <200803170010.m2H0ABFV016415@dell2.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200803170010.m2H0ABFV016415@dell2.home>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marty Leisner <leisner@rochester.rr.com>
Cc: netfilter@vger.kernel.org

Marty Leisner wrote:
> [snip]
>
> Right, I don't want any NAT -- I just want it to act as a tcp port relayer
> (connection A-B is reflected on connection B-C)
>
> where
>
> A is the source
> B is the relay machine
> C is the destination
>
> and all machines are on the same lan.
>
>   

As I said, you need to do both redirection (destination NAT) and source 
NAT. In this case, C will only see the IP of B (instead of A), so your 
logs (on C) will be somewhat incomplete/inaccurate. This is similar to 
running a proxy on B.

but as you see, this is circomvoluted and should be avoided if possible.

if you are trying to do this because the hostname of the C webserver 
points to A (happens when C is a webserver reachable from outside), then 
consider setting up an internal DNS (or at least an internal DNS view) 
so that A goes to C directly.

An alternative is to use routing (on A and C) as Jan said. The problem 
is that in this case all flow between A and C will go through B. Also, 
consider disabling ICMP redirects (which B would send to both A and C 
telling them they can reach each other directly) as appropriate.

