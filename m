From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: detect original chain after jump?
Date: Sat, 27 Mar 2004 15:14:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403271514.07236.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0403271058360.1506-100000@anis.dst.usb.ve>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0403271058360.1506-100000@anis.dst.usb.ve>
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

On Saturday 27 March 2004 3:07 pm, rrecaba@usb.ve wrote:

> Hello all,
>
> On Sat, 27 Mar 2004, Antony Stone wrote:
> > Well, okay then - how about using the MARK target to mark packets with
> > one value in INPUT and a different value in FORWARD, and then check the
> > marked value in your user-defined chain to see how the packet got there?
>
> I was meaning to ask about this. In such scenario he would have to place
> two rules with identical matches, one for the mark, the other for the jump
> to his chain. So what bothers me a little is that double match.

Yes, however unless he's dealing with a *high* bandwidth connection, it's 
unlikely that netfilter processing efficiency is going to be a bottleneck.

> I was wondering, is it better to write just one rule with the appropiate
> match (thus making only one match) and a jump to a "temporary" chain that
> has the two abovementioned rules, but with no matches at all (i.e.
> an unconditional match)?

Well, I'm of the opinion that it's doubtful whether trying to combine INPUT 
and FORWARD like this is useful anyway, however as Richard said, he's 
experimenting, so he'll find out which seems best for his needs....

> I guess what I am asking is, what is more expensive in terms of
> performance, a jump to a different chain, or a double match?...

Remember that all of this discussion applies only to the first packet of each 
connection (assuming the machine is doing stateful processing with an 
"ESTABLISHED,RELATED" rule at the top of the FORWARD and INPUT chains - if 
not, then he'll have serious problems making the system (a) work and (b) 
secure, at the same time), therefore any inefficiency is probably moot.

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


