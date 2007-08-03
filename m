From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Iptables rules processing
Date: Fri, 03 Aug 2007 15:23:17 -0500
Message-ID: <46B38EB5.1010000@riverviewtech.net>
References: <20070803161302.GB7815@sid.toystory.lan><46B3566E.1010407@rchq.co.za>	<20070803170735.GC7815@sid.toystory.lan>
	<001b01c7d5f4$91781110$0101000a@tanjian>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001b01c7d5f4$91781110$0101000a@tanjian>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/03/07 12:34, Rob Sterenborg wrote:
> This would IMHO only be of real use if you have lots of rules and you 
> want to narrow down the number of rules to be matched.

Agreed.  This is an example of how to optimize the packet flow through
the IPTables chains and rules.  Really it comes down to how many
decisions have to be made for any given packet and trying to rearrange
the chains and rules for optimal packet flow.  Rules are processed
serially / linearly / one by one / (what ever you want to call it) with
in a chain, so the idea is to reduce the number of individual rules and
the complexity there is to make packet traversal as fast as possible.

> In this case you won't notice the difference.

Presuming that the rules that we saw were the only rules in the OPs rule
set I'll agree.  However if there were 10s to 100s to 1000s (or more) of
these sets of rules, then the OPs rule set could very likely benefit
from optimization.  Depending on the number of rules it may be very much
worth the time to split a /24 block in to multiple smaller blocks.



Grant. . . .

