From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: iptables suddently stop working
Date: Sat, 9 Nov 2002 00:49:35 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4986.192.168.7.41.1036763375.squirrel@iw.k1k2.com>
References: <20021107090017.LQPC27595.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021107090017.LQPC27595.mta05-svc.ntlworld.com@there>
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

> On Wednesday 06 November 2002 11:54 pm, Andrew Smith wrote:
> 
>> > Okay, so this means you have 156 connections being tracked through
>> > your
>> >  firewall (seems a perfectly reasonable number for 200 users), with
>> > capacity  for up to 65424 connections before the box gets
>> > overloaded.
>> >
>> > If you ever got more than 65424 connections from 200 users it would
>> > indicate  a serious problem (eg Nimda on the machines...) - I would
>> > never expect that  to happen.
>>
>> Never heard of CounterStrike?
> 
> No, not really - I assume it's a game of some sort, but I know nothing
> about  it.

Probably the most popular online game.
It's a first person 3D shooter (works a 'bit' like Quake etc.)
that you play with 2 teams of a total of 10 to 20 players

>> Only takes a few users to do a 'get server list' at the same time to
>> fill a conntrack table that size.
> 
> Doesn't sound like a very well-written application to me.
> 
> Antony.

Well, actually, they have solved a rather interesting problem
(as long as you don't use ip_conntrack :-)
You need to get some sort of 'ping' performance between yourself and
about 20,000 CounterStrike servers on the net and do it quickly
to help with selecting a server to play on
(on my slow 512K ADSL it takes about 15 minutes on a busy night)
It uses a UDP packet to the server and the server sends back some
sort of reply using UDP also
My brother-in-law's router defaulted to about a 16K table size,
(due to memory)
and his son exceeded that on his own (on a cable modem) getting a
single server list - so I put it up to about 32K
I'm even more surprised to learn that not only is the timeout fixed,
but the limit on the size of the table is VERY small.
Those limits certanly say that no ISP could use it and MASQ or any
other conntrack related rules for their users - since if only a few
of them played CounterStrike they'd kill it for everyone else if they
got a server list a the same same time as 2 others (typical when
you are playing together as a team or a clan)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


