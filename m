From: "Simon Garner" <sgarner@expio.co.nz>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 15:33:35 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016e01c3977b$d01a4520$0301a8c0@SIMON>
References: <20031021020302.80084.qmail@web40208.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

On Tuesday, October 21, 2003 3:03 PM [GMT+1200=NZT],
SBlaze <dagent.geo@yahoo.com> wrote:

> It would appear that most of the data that comes to me is udp and by
> unsolicited I mean that in stateful inspections they are NEW or
> INVALID connections. 98% of them are from my own IP range and are
> targeted at me or my ISP's broadcast address for my range. Alot of
> them are "valid" in that they are basically Windows RPC scans/virii
> and the like.
>

By 'your own IP range' I presume you mean your ISP's other customers?


> About the CPUT... thats what I'm wondering really. Is all this
> traffic silently choking my system. If it is I need to know.. if its
> not..then we know its probably just an OOB deal.
>
> You be the judge. I start my firewall when the box boots up. Pay
> special attention to the UDP rule. Note that in the 11 day up time we
> have 16 Million droppped UDP NEW/Invalid packets. Is this enough to
> choke down a Dual Pentium Pro 200mhz box?
>

That is a LOT of useless packets, but it shouldn't be anywhere near
enough to cause any problems for the machine, even a machine that old.

1945M of data over 12 days works out to about 2 kilobytes/second. I'm
sure your firewall regularly handles a lot more data than that. However,
depending on your connection speed this may be enough to cause latency
problems in interactive applications like games.

It's a difficult one because you're already blocking the data - but by
the time the data hits your firewall, it's too late, the bandwidth has
already been consumed. If you do think this is the cause of the problem,
you might need to talk to your ISP to see if they can filter it at their
end, unless anybody else has any ideas...

-Simon


