From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: port forwarding
Date: Sun, 8 Dec 2002 01:14:18 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1894.192.168.7.41.1039270458.squirrel@iw.k1k2.com>
References: <200212071445.39034.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212071445.39034.roy@karlsbakk.net>
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

>> > Then what sort of idiot was there that wrote the counterstrike
>> > protocol? I mean - 20.000 connections per user???? It's crazy! How
>> > about a good  old TCP connection instead?
>>
>> It's not the protocol - that's how it checks all 20,000 (more or less)
>> servers currently available to determine the "ping" times so you can
>> work out which ones would be best to play on.
>>
>> It isn't a real "ping" it's just UDP packets going back and forth from
>> your client to EACH server available to determine the performance if
>> you were playing on them.
>> (That's why conntrack keeps track of them ... for too long)
>>
>> Basically, you start CounterStrike, then tell it to get a server list
>> and then it gets the "ping" times for each of the servers in the
>> server list - often 20,000 of them
>> (yes there are only a handful of central list servers that have
>> the active game server lists - and all game servers must register with
>> the central servers if they want to be known for anyone to
>> play on the net)
>> Then you choose the server you want and start playing
>>
>> When you play a game that 50ms means the difference between winning
>> and losing - you need to know which servers are responding well to
>> your connection - and no other computer can find that out for you.
> 
> but is the client checking all 20.000 servers continously, or just at
> startup? -- 
> Roy Sigurd Karlsbakk, Datavaktmester

Of course it is only when you request the list or request
an update of the net times for the list of game servers.
The problem is that netfilter conntrack keeps track of the
connections for too long - they are only needed for a VERY
short time.
Normally you want long tracking, in this case you certainly
do not, for the game server status'.
Thus if you have a good connection, all 20,000 can happen
within the conntrack timout period and thus all 20,000 end
up in the conntrack table.
If you have 3 or 4 people doing this at the same time (this
can be common to have a few people logging in to play together
at the same time) then you can get more than 60,000 connections
in the conntrack table ... which means it's full if it goes
over 64K

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


