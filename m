From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 19:49:24 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021024924.98794.qmail@web40207.mail.yahoo.com>
References: <016e01c3977b$d01a4520$0301a8c0@SIMON>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016e01c3977b$d01a4520$0301a8c0@SIMON>
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
Content-Transfer-Encoding: 7bit
To: Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org


--- Simon Garner <sgarner@expio.co.nz> wrote:
> On Tuesday, October 21, 2003 3:03 PM [GMT+1200=NZT],
> SBlaze <dagent.geo@yahoo.com> wrote:
> 
> > It would appear that most of the data that comes to me is udp and by
> > unsolicited I mean that in stateful inspections they are NEW or
> > INVALID connections. 98% of them are from my own IP range and are
> > targeted at me or my ISP's broadcast address for my range. Alot of
> > them are "valid" in that they are basically Windows RPC scans/virii
> > and the like.
> >
> 
> By 'your own IP range' I presume you mean your ISP's other customers?
> 
> 
Correct I wasn't to clear on that but yes. I am a Charter Communications
customer and by "my range" I really mean the local net they have me on as
opposed to my LAN range heh.

> > About the CPUT... thats what I'm wondering really. Is all this
> > traffic silently choking my system. If it is I need to know.. if its
> > not..then we know its probably just an OOB deal.
> >
> > You be the judge. I start my firewall when the box boots up. Pay
> > special attention to the UDP rule. Note that in the 11 day up time we
> > have 16 Million droppped UDP NEW/Invalid packets. Is this enough to
> > choke down a Dual Pentium Pro 200mhz box?
> >
> 
> That is a LOT of useless packets, but it shouldn't be anywhere near
> enough to cause any problems for the machine, even a machine that old.
> 
> 1945M of data over 12 days works out to about 2 kilobytes/second. I'm
> sure your firewall regularly handles a lot more data than that. However,
> depending on your connection speed this may be enough to cause latency
> problems in interactive applications like games.
> 
Charter says my speed is 2048/128. Howerver, it fluxes so bad that its really
hard to so. Most of the time I can stay above the 1Mb area...but others I
don't(of course this could be just the speed test servers I have been using
some of the time.)

> It's a difficult one because you're already blocking the data - but by
> the time the data hits your firewall, it's too late, the bandwidth has
> already been consumed. If you do think this is the cause of the problem,
> you might need to talk to your ISP to see if they can filter it at their
> end, unless anybody else has any ideas...
> 
> -Simon
> 
Correct you are! I have contacted Charter. I have even sent them snippets of
when I turn Logging on for those new/invalid UDP packets and shown them the
offenders ips. I emailed them to abuse@charter.net per thier policy. I didn't
get any reply other than an automated one and if anything the traffic has
gotton worse.

I was considering using ntop to gather more detailed information so I posted to
a site where I know some Charter techs and people who use Charter are. If your
curiosity gets the better of you please check it out. The following link should
take you to the thread. Whats really interesting is that I have brought up what
you mentioned about having the ISP actually FILTER for me. If you read.. note
the reaction from the people who post up. It's sad. :{{

http://www.dslreports.com/forum/remark,8236731~root=charter~mode=flat

SBlaze




=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

