From: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Subject: Re: conntrackd working, but netfilter not impressed
Date: Tue, 12 Aug 2008 22:20:52 +0200
Message-ID: <D8E6FEE44BB41502649A12A2@file.wkd-druck.org>
References: <BD9F23BEBBF883939AE367D6@Dirks-MacBook-Pro.local>
 <200808111322.58469.misch@multinet.de>
 <0F0E3430135185A207EFA41A@Dirks-MacBook-Pro.local>
 <48A176A2.6000301@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A176A2.6000301@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo,

--On 12. August 2008 13:40:18 +0200 Pablo Neira Ayuso <pablo@netfilter.org> 
wrote:

- snip -
> The CacheWriteThrough clause should do that for you but with some
> important considerations: higher CPU consumption and possible race
> conditions - the time to transmit the state to the other firewall
> replica should be smaller than the RTT between the firewall and the
> end-peer.

That is why I tested with a long stream of pings and long consecutive http 
requests. The result was not better.

> This is generally true if your firewall is connected to a DSL
> line or whatever that inherently inserts some latency in the
> communications.

In this case it is 100 MBit uplinks with very low latency.

>
> Anyhow, the multi-primary setup with asynchronous routing is really bad
> design for stateful firewalls. The key problem is that stateful
> firewalling works with at flow-level and OSPF only knows about packets.
> The preferred way to go should be the multi-primary with symmetric
> routing

I am not sure if this can be achieved with OSPF - there is many differing 
posts on that out there but I also have an intensive look at that, of 
course.

Thanks for your patience.

Dirk
