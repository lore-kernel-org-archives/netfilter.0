From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: next topic:  --limit and --burst-limit
Date: Thu, 31 Oct 2002 10:04:57 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210310954300.31418-100000@localhost.localdomain>
References: <1036072265.21852.20.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036072265.21852.20.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  ok, here it is -- the actual limiting algorithm, as verified by
just setting some limits and watching where the packets go.

  i shut down all firewalling, then just added a rule to watch for
incoming pings, and LOG them with the following limits:

  limit: 6/min
  burst: 5

at that point, i just "# ping 127.0.0.1" and tailed the file
/var/log/messages.  what i saw, at the seconds counter:

1:	Y
2:	Y
3:	Y
4:	Y
5:	Y	(clearly, i've just run out of tokens)
10:	Y	(just got an additional token, so i buy another packet)
20:	Y	(same here)
30:	Y	(and so on)

... and so on.  so there you have it.  clearly, the "burst" represents
the initial number of tokens you get in your bucket to pay for incoming
packets.  and the limit frequency is used to replenish your bucket at
a nice uniform rate, as in "6/min" means every 10 seconds, and not a
handful of 6 every minute.  which makes perfect sense.

lord awmighty, why do all the docs make this sound so incomprehensible?
ya got a bucket, ya got some tokens ... sheesh.  :-)

rday




