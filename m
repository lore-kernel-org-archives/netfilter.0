From: rrecaba@usb.ve
Subject: Re: detect original chain after jump?
Date: Sat, 27 Mar 2004 11:07:10 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0403271058360.1506-100000@anis.dst.usb.ve>
References: <200403271428.36961.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403271428.36961.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org


Hello all,

On Sat, 27 Mar 2004, Antony Stone wrote:

> Well, okay then - how about using the MARK target to mark packets with one
> value in INPUT and a different value in FORWARD, and then check the marked
> value in your user-defined chain to see how the packet got there?

I was meaning to ask about this. In such scenario he would have to place
two rules with identical matches, one for the mark, the other for the jump
to his chain. So what bothers me a little is that double match.

I was wondering, is it better to write just one rule with the appropiate
match (thus making only one match) and a jump to a "temporary" chain that
has the two abovementioned rules, but with no matches at all (i.e.
an unconditional match)?

I guess what I am asking is, what is more expensive in terms of
performance, a jump to a different chain, or a double match?...

Regards,
Ruben.

>
> Look up the MARK target and the -m mark match for more info.
>
> Regards,
>
> Antony.
>
> --
> Christmas was just an opportunity to upgrade to kernel 2.6 while no-one was
> around to notice the downtime.
>
>                                                      Please reply to the list;
>                                                            please don't CC me.
>
>
>


