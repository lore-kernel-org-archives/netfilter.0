From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Adding a flag to a packet
Date: Tue, 30 Mar 2004 16:35:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330163510.4bddd065@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403301253.18383.Antony@Soft-Solutions.co.uk>
	<20040330160158.2e247c46@darna.vectec.net>
	<200403302124.18451.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302124.18451.Antony@Soft-Solutions.co.uk>
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

On Tue, 30 Mar 2004 21:24:18 +0100,
Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 30 March 2004 9:01 pm, Cody Harris wrote:
> 
> > On Tue, 30 Mar 2004 12:53:18 +0100, Antony Stone wrote:
> >
> > > > If we've covered the NAT table, what's the mangle table?
> > >
> > > The mangle table is aptly named, and allows you to fiddle about with bits
> > > of the packets headers which most people wouldn't even think of changing
> > > - things like the TTL (Time To Live) field, the TOS (Type Of Service)
> > > field, and for MARKing packets (which doesn't actually change the packet,
> > > but allows netfilter to carry a special marker around with the packet
> > > during further processing).
> >
> > Is it possible, with the mangling table, to edit the packet to have a
> > special flag?
> 
> Yes..... sort of...
> 
> > So that when it hits another firewall that's setup correctly,
> > it sends it to a pre-configured ip? Example:
> 
> No.   Not with MARK, anyway.
> 
> I said "sort of" because the MARK value is not actually part of the packet 
> (not even part of the header) - it's just something that netfilter associates 
> with the packet whilst it's wandering around the machine which MARKed it.   
> As soon as the packet leaves the machine, the MARK disappears.
> 
> > On my internet network, the ip range is 192.168.0.0 to 255. If a computer
> > sent a packet to 192.168.1.5, the computer used the gateway, slapped a flag
> > on it, sent it to 1.2.3.4, the firewall there saw the flag, changed the ip
> > on it to 192.168.1.5 coming from 192.168.0.6. When the computer sent a
> > response, it just reversed the process.
> 
> Sorry, I don't quite follow what you're suggesting here.   Let me quote it 
> back to you with some questions inserted:
> 
> > On my internet network, the ip range is 192.168.0.0 to 255. If a computer
> 
> A computer where?

On MY network.

> 
> > sent a packet to 192.168.1.5,
> 
> You do recognise that a 192.168.x.y address is not routable across the 
> Internet, yes?   It might go one or two hops, but will pertty soon get 
> dropped.

But once it hits my firewall the IP changes to 1.2.3.4.

> 
> > the computer used the gateway, slapped a flag
> > on it, sent it to 1.2.3.4,
> 
> Now that *is* a routable address, but I think you only gave it as an example - 
> where are you suggesting that this destination might be?   Across a local 
> network which you have total control of, or somewhere around the Internet?

Across the internet. Once at 1.2.3.4, it gets converted back to the lan'd ip (192.168.0.6).

> 
> > the firewall there saw the flag, changed the ip
> 
> Which IP?   Source or destination (or both)?

The destination. To be sent across the internet, the ip was changed to the destination firewall/gateway. Once it hits the gateway, it will be changed back to be routed to its destination.

> 
> > on it to 192.168.1.5 coming from 192.168.0.6.
> 
> Who's 192.168.0.6?   The real sender?   A fake?   Why choose this address?

A real sender. Or hypothetical sender. I don't "Actually" have the ip, it WOULD be 192.168.0.2 sending to 192.168.1.2. As both the .1s are the firewalls from the inside.

> 
> > When the computer sent a response, it just reversed the process.
> 
> I've chosen the sig on this email especially for you this time :)

Hahaha.

So estentally (SP), i want to  create a "patch" between to physical networks transparently. So as far as the internet network computers (192.168.*.*) are concerned, they're phsically attached. The 192.168.0.* system is actually a different physical site then 192.168.1.*. Just when one sends to the other, it's altered to send accross the net and re-wrote at the other end and it continues on it's marry way.

Get it? lol

> 
> Regards,
> 
> Antony.
> 
> -- 
> 90% of networking problems are routing problems.
> 9 of the remaining 10% are routing problems in the other direction.
> The remaining 1% might be something else, but check the routing anyway.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

