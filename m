From: Richard Hector <rhector@paradise.net.nz>
Subject: Re: detect original chain after jump?
Date: Sun, 28 Mar 2004 02:20:13 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040327142013.GA6033@fake>
References: <20040327133801.GA5251@fake>
 <200403271351.32300.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200403271351.32300.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Sat, Mar 27, 2004 at 01:51:32PM +0000, Antony Stone wrote:
> On Saturday 27 March 2004 1:38 pm, Richard Hector wrote:
> 
> > This means that early on, I have something like:
> >
> > iptables -A INPUT -j protocol
> > iptables -A FORWARD -j protocol
> >
> > iptables -A protocol -p tcp --dport 22 -j ssh
> >
> > But then I get a bit stuck. I need to then do different things depending
> > on the source and destination - which includes whether this packet is
> > arriving locally or being forwarded. Therefore it would be useful to
> > know whether this packet started out in the INPUT or FORWARD chain - but
> > that info seems to have been lost with the jump.
> >
> > Is there any way to regain that?
> 
> Surely the destination address is all you need for this?

I suppose so. It's just that the INPUT chain is a handy way to group all the
local interfaces and addresses. Without it, I multiply the number of rules by
the number of possible local addresses that could be used.

> Are you sure that combining INPUT and FORWARD rules like this is really what 
> you want to do?

No :-)

However, that's why I'm experimenting; I'll see what version looks simplest
and most intuitive of the likely possibilities I can think of.

> I would have thought the two were sufficiently different (what traffic you 
> allow in to your firewall, compared to what traffic you allow through it to 
> elsewhere) that it would be worth writing separate rulesets for the two.

That may well be true - especially if the firewall is sufficiently
dedicated to its firewalling. Mine is also a bounce point for SSH, a
DHCP server and an NTP server; not quite as clean as it could/should be.

Many thanks,

Richard


