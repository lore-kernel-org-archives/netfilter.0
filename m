From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: When do the rule apply?
Date: Wed, 15 Jun 2005 15:09:17 -0500
Message-ID: <42B08AED.30708@riverviewtech.net>
References: <393114f905061513012ac2216a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <393114f905061513012ac2216a@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Alexander Salmin wrote:
> Hi, I guess this question is just a silly one for experts, but I can't
> find the answer anywhere so I'm asking you guys.
> 
> In what order do the assigned rules apply in this script? 
> 
> # Example1
> iptables -A INPUT -j DROP # rule #1
> iptables -A INPUT --dport 80 -j ACCEPT # rule #2
> 
> #Example2 
> iptables -A INPUT --dport 80 -j ACCEPT # rule1
> iptables -A INPUT -j DROP # rule2
> 
> Will the both examples produce the same result?
> Or will rule2 in example 2 make rule1 in example2 vanish because it's
> telling the system to drop all?

I'm not quite sure that I'm reading your question correctly.  Something to keep in mind id that the INPUT chain is traversed until the first (completely) matching rule is found and then packet traversal of the chain stops and jumps to the target of the matching rule.  With this in mind your two examples would behave like this:

# Example 1
iptables -A INPUT -j DROP
# The above rule will match everything and DROP the traffic as there are no conditions on the rule and everything will match.
iptables -A INPUT --dport 80 -j ACCEPT
# The above rule will never match any thing as no packet will ever make it to the rule as it would have matched the prior rule.

# Example 2
iptables -A INPUT --dport 80 -j ACCEPT
# The above rule is broken in such that you can not specify --dport with out specifying either -p udp or -p tcp.
# The above rule (protocol issue aside) will match any traffic that is destined to port 80 and will jump to the ACCEPT target.
iptables -A INPUT -j DROP
# The above rule will match any traffic that comes to it (was not matched by prior rule(s)) and DROP the traffic as there are no conditions on the rule and everything will match.

I hope this helps you.  If you have any other questions...



Grant. . . .

