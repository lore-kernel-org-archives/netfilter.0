From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 10:20:34 +0100
Message-ID: <4982C662.7030807@chello.at>
References: <4982B7F3.4020603@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982B7F3.4020603@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hinko Kocevar wrote:
> Our customers want to be able to ping the mobile device behind the linux firewall
> and IMHO it is not possible for ICMP packets to be forwarded since it is a protocol
> by itself (not a TCP/UDP style service).
>
>   

*clearing my throat*
TCP and UDP are protocols no services! many services use TCP/UDP protocol!
TCP and UDP are very different, UDP is a connectionless protocol, in 
opposite to TCP.

So ICMP is more like UDP, than like TCP.
> Is it possible to 'port forward' ICMP requests?
>   

First try, then cry ;-p

If u have an unused ip addr. on your gw, you could use that one to nat 
the icmp, so your gateway still is reachable with icmp.

greets

Mart


