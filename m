From: James Sneeringer <james+netfilter@vincentsystems.com>
Subject: Re: Firewall structure and more (Newbie)
Date: Thu, 8 Jul 2004 12:47:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708174716.GC28733@valjean.si.ocslink.com>
References: <20040708171016.GA16115@itstud.chalmers.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040708171016.GA16115@itstud.chalmers.se>
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

On Thu, Jul 08, 2004 at 07:10:16PM +0200, Erik Wikstr?m wrote:
> My idea is to create 3 chains for each scenario, one for tcp, one for
> udp and one for icmp. And maybe some more like one for port forwarding
> or so. But that's an awful lot of rules and some of them might contain
> only one or two rules

How you structure your rules and chains is entirely up to you, and depends
on your specific needs.  However, in general you should set up your rules
and chains so the kernel has to do as little work as possible.  Sometimes
this isn't possible, but in practice, you can usually break up large chains
into smaller ones.  For example, this isn't a long chain, but it illustrates
the point.

    iptables -A FORWARD -p tcp -s 10.0.0.2 --dport 80 -j ACCEPT
    iptables -A FORWARD -p tcp -s 10.0.0.2 --dport 25 -j ACCEPT
    iptables -A FORWARD -p tcp -s 10.0.0.2 --dport 110 -j ACCEPT

    iptables -A FORWARD -p tcp -s 10.0.0.3 --dport 80 -j ACCEPT
    iptables -A FORWARD -p tcp -s 10.0.0.3 --dport 25 -j ACCEPT
    iptables -A FORWARD -p tcp -s 10.0.0.3 --dport 110 -j ACCEPT

Instead, you might do something like this:

    iptables -N CHECK_PORTS

    iptables -A FORWARD -s 10.0.0.2 -j CHECK_PORTS
    iptables -A FORWARD -s 10.0.0.3 -j CHECK_PORTS

    iptables -A CHECK_PORTS -p tcp --dport 80 -j ACCEPT
    iptables -A CHECK_PORTS -p tcp --dport 25 -j ACCEPT
    iptables -A CHECK_PORTS -p tcp --dport 110 -j ACCEPT
    iptables -A CHECK_PORTS -j RETURN

For a case where 10.0.0.3 wants to go to port 25, the first set of rules
requires the kernel to evaluate 5 rules.  The second example only requires
evaluation of 3 rules.  It's also a bit more modular and makes it simpler
to grant the same access to another IP in the future.

> Which leads to my questions: What do you think of this structure? What
> would you do?
> 
> How many rules should there be in a chain to compensate for the chain?
> (Cause there are some overhead for each chain right?)

Unless you're doing this on a 386 with 4 MB RAM, the overhead of each
individual chain isn't worth worrying about.

> I'm also open to suggestions for things to block, and maybe suggestions
> on rules to do so, like ping of death and other known problems.

Personally, I use the state module, and I block all inbound traffic by
default.  The only permitted inbound traffic is stuff that matches state
ESTABLISHED,RELATED, and thinks like tcp/25 to my mail server.  For what
ut's worth, I have no custom chains on my firewall (486dx2/66, 32 MB RAM).
My FORWARD chain has about 60 rules in it, and performance is just fine.

-James


