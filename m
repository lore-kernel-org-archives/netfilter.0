From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Tue, 30 Mar 2004 12:53:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301253.18383.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403300848.16537.Antony@Soft-Solutions.co.uk> <20040330073347.65b31438@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330073347.65b31438@darna.vectec.net>
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

On Tuesday 30 March 2004 12:33 pm, Cody Harris wrote:

> On Tue, 30 Mar 2004 08:48:16 +0100, Antony Stone wrote:
> >
> > I think you've got it now.
>
> Great!
>
> > Netfilter does not make routing desicions - the Linux kernel does that,
> > even when you're not running netfilter.   Netfilter simply adds the
> > ability to drop some packets *instead* of routing them on (in the filter
> > tables), or to change where they're addressed to (in the nat table).
>
> So instead of changing the decision, it changes the packet to change the
> routing decision?

Yes, I'd say that's a good way of putting it.

> If we've covered the NAT table, what's the mangle table?

Tha mangle table is aptly named, and allows you to fiddle about with bits of 
the packets headers which most people wouldn't even think of changing - 
things like the TTL (Time To Live) field, the TOS (Type Of Service) field, 
and for MARKing packets (which doesn't actually change the packet, but allows 
netfilter to carry a special marker around with the packet during further 
processing).

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


