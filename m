From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: next topic:  --limit and --burst-limit
Date: Thu, 31 Oct 2002 07:15:12 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210310704480.30108-100000@localhost.localdomain>
References: <1036052695.21032.21.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036052695.21032.21.camel@elendil>
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

On 31 Oct 2002, Cedric Blancher wrote:

> So I'll try to explain it a bit...
> 
> Limit is a bucket. This bucket is separated in two parts. The first one
> is the burst. The second one is the limit. You do not apply the limit
> until burst is full. This bucket is emptying a limit rate.
> 
>         |       |
>         |       | <---- limit
>         |-------|
>         |       |
>         |       | <---- burst
>         |_______|
> 
> So, in the HOWTO exemple, (limit 1/s, burst 5, 4 packet/s flow), you're
> filling the burst part of the bucket the first second. The second one,
> the burst part is filled when receiving the 2nd packet. So, we begin to
> fill the limit part of the bucket, and the limit of 1/s is beginning to
> apply. I can accept the sixth packet, but not the following one,
> arriving at the same second. When the second ends, I can flush the limit
> part of the bucket, so I can accept more packets on top of the burst
> part, within the limit.
> 
> Later, the flow stops. Each second I do not receive a packet, one packet
> is taken from the bucket (because it's 1/s limit). For limit part is
> empty, then we take it from the burst part. And then, if it goes again,
> the burst part is getting filled again, and once filled, the limit
> applies. And so on...

ok, i'm almost certainly going to embarrass myself here, but after looking
at the graphical explanation of limiting and bursts, this seems so simple,
i'm at a loss to understand why so many explanations make it seem like
rocket science (witness the phrase "hysteresis door" -- sheesh).
so here's what it looks like (in contrast to cedric's explanation,
i prefer the analogy of *starting* with a bucket of tokens and 
paying them out as packets come in).

example:
	limit: 3/hour
	burst: 5

what does this mean?  it means that i start with a bucket of 5 tokens
and, every time a matching packet comes in, i can accept it by paying
a token.  simple as that.    when i run out of tokens, i can't accept
any more packets until i get more tokens.

and with a limit of 3/hour, every 20 minutes, i get another token dropped
into my bucket, up to a maximum of my burst value of 5, so that i can 
accept more packets.  that's it.  is it really that simple?

this explanation seems to match what i read in the packet filtering HOWTO
at netfilter.org.  it means that, with a full bucket, i can take a burst
of (in this example) 5 incoming packets, but now have to wait until the
next 20-minute point for another token so i can accept just one more
additional packet.  and so on.

have i oversimplified things here?

rday


