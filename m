From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: BUG(?) - SNAT causes networking to stop.
Date: Thu, 31 Oct 2002 16:37:58 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPMEINEEAA.netfilter@darrelldieringer.com>
References: <Pine.LNX.4.44.0210311202110.21650-100000@robotron.office.tiedyenetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210311202110.21650-100000@robotron.office.tiedyenetworks.com>
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
To: mike-netfilter@tiedyenetworks.com, netfilter@lists.netfilter.org


I had a goofy problem quite awhile ago that sounds a lot like yours -
I couldn't ping the router box from the LAN unless the router box was
already pinging the particular LAN box from which I was trying to ping
the router.

I didn't use strace, but tcpdump showed me that the packets were
indeed _not_ on the wire.

After banging my head for awhile, I tried a different (identical)
network card in the router for the LAN.  The unusual ping problem was
gone immediately without a single change to the firewall rules.

It's worth a shot.

Darrell Dieringer - Madison, WI


> -----Original Message-----
>
> Howdy folks,
>
> 	I've got a router I am experamenting with SNAT on.
> I've hit a
> situation where local ping processes are forced to stop
> transmitting (get
> caught in a loop on sendmsg() ) until the box receives
> packets from some
> external source (ping it from another machine on the
> network for example),
> and then it wakes right up without missing a beat.
> Experamentally, I've
> had ping waiting for several minutes this way. Typically
> it's able to fire
> off say 10 packets (and get replies) before it starts
> hanging. Using
> larger packets - say, 3000 bytes, results in only being
> able to fire off 3
> before stopping. I'm running tcpdump to verify that it's
> not emitting
> packets and strace to verify it's stuck looping on
> sendmsg(). Very weird.
>


