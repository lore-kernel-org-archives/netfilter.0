From: Nick Taylor <nickt@lightlink.com>
Subject: Re: blocking a site for others not for -m owner
Date: Thu, 8 Jul 2004 01:24:20 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0407080114300.6360@adore.lightlink.com>
References: <a0f69e50407072156420fc7aa@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e50407072156420fc7aa@mail.gmail.com>
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
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

> Now im trying to block a site www.foo.com for users excluding user
> "askar" with something like....
>
> #iptables -A OUTPUT -p tcp --dport 80 -d www.foo.com -j DROP
>
>        this works for all users however when I tries to exclude user
> "askar" from this blocking with...
>
> #iptables -A OUTPUT -p tcp --dport 80 -d www.kmmod.com -m owner
> --uid-owner askar -j ACCEPT
>
>               site is still block for user "askar", i also tried with
> changing the other of the rules no working :), Howto exclude "askar" ?
>

Well, two things.  First, and I assume you know this, in your first
example, you list www.foo.com (216.234.246.149, and 216.234.246.150), and
in the second example you use www.kmmod.com (66.226.86.161).  Obviously,
if you want the second rule to contradict the first one, you have to use
the same destination address, but with the setup you give, it still won't
work.  When you use -A, you Append to the chain, meaning you place the new
rule at the bottom.  The first rule that terminates a chain is the only
one that matters, and a -j DROP is a terminating rule, so the kernel drops
the packet, and forgets about it before it thinks about reading the second
rule.  You have two choices, either enter a specific -j ACCEPT rule (like
the -m owner match) before the less specific -j DROP rule, or enter the -j
DROP rule with a -I to insert it at the top of the chain.

Hope this helps

