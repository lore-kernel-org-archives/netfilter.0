From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: port forwarding
Date: Sun, 8 Dec 2002 00:03:24 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35809.192.168.7.14.1039266204.squirrel@iw.k1k2.com>
References: <3DF1E55A.7000102@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF1E55A.7000102@karlsbakk.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Andrew Smith wrote:
> 
>>If they want to play on an external server then there is
>>nothing required other than standard masquerading/nat
>>
>>HOWEVER, if you resrtict outgoing (and return) ports then
>>you need to allow UDP on port 21705
>>(I'm not sure if TCP is used at all?)
>>
>>WARNING
>>if 3 or 4 people do a standard full server update at the
>>same time it will fill your conntrack table and you will
>>start dropping other connections for a while
>>
>>Counterstrike is beyond the tiny limitation of a 64K conntrack
>>table and since you cannot specifically say to timeout the
>>counterstrike server update connections quickly (due to the
>>fact that you will never need to do this - yeah I know that's
>>wrong but ... that's what the netfilter developers say)
>>you end up filling the conntrack table
>>
>>You need to be able to set it to handle about 20,000 connections
>>per user that is using Counterstrike but I think it is limited
>>to only 64K - but I'm not 100% certain.
>>
>>  
>>
> Then what sort of idiot was there that wrote the counterstrike
> protocol? I mean - 20.000 connections per user???? It's crazy! How
> about a good  old TCP connection instead?

It's not the protocol - that's how it checks all 20,000 (more or less)
servers currently available to determine the "ping" times so you
can work out which ones would be best to play on.

It isn't a real "ping" it's just UDP packets going back and forth
from your client to EACH server available to determine the performance
if you were playing on them.
(That's why conntrack keeps track of them ... for too long)

Basically, you start CounterStrike, then tell it to get a server
list and then it gets the "ping" times for each of the servers in
the server list - often 20,000 of them
(yes there are only a handful of central list servers that have
the active game server lists - and all game servers must register
with the central servers if they want to be known for anyone to
play on the net)
Then you choose the server you want and start playing

When you play a game that 50ms means the difference between winning
and losing - you need to know which servers are responding well to
your connection - and no other computer can find that out for you.

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


