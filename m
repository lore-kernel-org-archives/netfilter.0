From: Thomas Heinz <creatix@hipac.org>
Subject: Re: ACCEPT/DROP
Date: Fri, 20 Dec 2002 12:36:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E0300D0.4020307@hipac.org>
References: <3E02F42E.3080306@cox.net>
Reply-To: nf@hipac.org
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Venkatesh Prasad Ranganath <vranganath@cox.net>
Cc: netfilter@lists.netfilter.org, nf@hipac.org

Hi Venkatesh

You wrote:
> I was looking into the iptables implementation and was intrigued about 
> how iptables would handle a situation in which we have identical rules 
> except for their targets which are contradicting, say ACCEPT and DROP. 
> By looking at ipt_do_table() function it seems that the first 
> non-IPT_RETURN  verdict from any standard target will end the traversal 
> of a chain of a table, which seems to be a bit odd.  First, such 
> conflicting rules must not be allowed.  Even beyond, this fails in the 
> situation where you have a dropping rule added after an accepting rule.

You misunderstand the definition of conflicting rules in the context
of the packet classification problem. A conflict occurs if there are
two or more matching rules with the same minimal cost. Since the cost of
a rule is equivalent to its position in the chain[1] and the position is
unique there are no conflicts by definition.
This holds for both iptables and nf-hipac.

[1] at least if you're not using user-defined chains; but even if user-
     defined chains come into play the costs are in fact unique

> For example, a packet from m.n.o.p to a.b.c.d would be accepted at 
> a.b.c.d because of the first rule, although it had to be dropped 
> according to the second rule.   And this would result because of the 
> order in which the rules are added to the table.

This behaviour is intended. The packet classification problem is about
finding the matching rule with minimal cost.


Thomas



