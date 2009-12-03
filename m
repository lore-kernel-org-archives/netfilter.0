From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: pinging and routing tables
Date: Thu, 03 Dec 2009 09:48:05 +0100
Message-ID: <4B177B45.9000004@chello.at>
References: <20091130175324.71602i65gacqf30g@webmail.oregonstate.edu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091130175324.71602i65gacqf30g@webmail.oregonstate.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sinkyh@onid.orst.edu wrote:
> Hello all,
> 
> I have, I hope, a simple question. From my understanding, by default 
> ping looks up up the IP address in the Linux kernel routing tables. What 
> happens if the IP is not in the routing table? Is the ping packet simply 
> dropped?
> 
> The reason I ask this is that I have a few wireless devices for testing 
> purposes and I am using iptables to mimic a particular topology. Mainly 
> forcing the presence of only two possible routes from a source to a 
> destination over a series of hops. These devices have their own routing 
> protocol and basically routes are added/ deleted from the Linux kernel 
> routing tables based on metric measurements bla bla bla. That is just 
> fine and normal.
> 
> However, since the devices are all in range of each other (due to space 
> restriction), if lets say the destination node IP is temporarily lost 
> from the source's routing table, for some reason the source is still 
> able to ping the destination directly. I assumed that if an IP is not in 
> the source's routing table that the outgoing ping would be dropped/ 
> ignored until the IP reappears. Not continue on ignoring routing tables....
> 
> Can anyone shed some light on this?
> 
> Thanks for your help and suggestions.

Hello,

without being a network/routing guru, imho if there's not route to host 
X, you should see a message like 'no route to host'...
Did you flush the cache?
`ip route flush cache` - should clear it, so old records are removed.

btw: bit offtopic here.... (not netfilter, tc, related)

Hope it helps.

regards

Mart
