From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: port forwarding
Date: Sat, 7 Dec 2002 14:45:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212071445.39034.roy@karlsbakk.net>
References: <3DF1E55A.7000102@karlsbakk.net> <35809.192.168.7.14.1039266204.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <35809.192.168.7.14.1039266204.squirrel@iw.k1k2.com>
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
To: Andrew Smith <nfml@k1k2.com>, netfilter@lists.netfilter.org

> > Then what sort of idiot was there that wrote the counterstrike
> > protocol? I mean - 20.000 connections per user???? It's crazy! How
> > about a good  old TCP connection instead?
>
> It's not the protocol - that's how it checks all 20,000 (more or less)
> servers currently available to determine the "ping" times so you
> can work out which ones would be best to play on.
>
> It isn't a real "ping" it's just UDP packets going back and forth
> from your client to EACH server available to determine the performance
> if you were playing on them.
> (That's why conntrack keeps track of them ... for too long)
>
> Basically, you start CounterStrike, then tell it to get a server
> list and then it gets the "ping" times for each of the servers in
> the server list - often 20,000 of them
> (yes there are only a handful of central list servers that have
> the active game server lists - and all game servers must register
> with the central servers if they want to be known for anyone to
> play on the net)
> Then you choose the server you want and start playing
>
> When you play a game that 50ms means the difference between winning
> and losing - you need to know which servers are responding well to
> your connection - and no other computer can find that out for you.

but is the client checking all 20.000 servers continously, or just at sta=
rtup?
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


