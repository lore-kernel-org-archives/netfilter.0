From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter CPU usage
Date: Sun, 13 Jun 2004 16:26:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406131626.17416.Antony@Soft-Solutions.co.uk>
References: <33105.217.79.71.234.1087126250.squirrel@mail.ssi.bg>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33105.217.79.71.234.1087126250.squirrel@mail.ssi.bg>
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

On Sunday 13 June 2004 12:30 pm, lartc@ssi.bg wrote:

> Hello
>
> Can someone tell me just how intensive netfilter is towards CPU?
>
> Is it posible for 6000 rules with no target set in the FORWARD chain to
> eat up about 60% of my P4 2.4 GHz?

I would be very surprised at this, however you haven't said what sort of 
bandwidth you're shovelling through the machine, and this will clearly make a 
difference to the CPU usage.

Also, when you say "6000 rules with no target set", I assume this means that 
each packet is traversing all 6000 rules (presumably for some sort of 
accounting process), and then getting to the bottom of the table and doing 
something more interesting...

One simple way of identifying whether it's the 6000 rules which are consuming 
60% of your CPU would be to temporarily reduce the ruleset to 2000 or 3000 
and see if you get a noticeable reduction in CPU usage (I wouldn't expect it 
to be proportional, so don't look for 20% or 30%, but if it doesn't go down 
by much, you know it's not the 6000 rules causing the load).

How memory is in the machine?

Are you using connection tracking (if so, how many connections are in 
/proc/net./ip_conntrack)?

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


