From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 12:25:50 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210131215410.17397-100000@localhost.localdomain>
References: <20021013095628.D15824@hamal.ipal.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021013095628.D15824@hamal.ipal.net>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sun, 13 Oct 2002, Phil Howard wrote:

> The initial inspiration is for filtering spam.  But I can see other
> uses, and am looking at this for broader re-usable purposes which
> would be initially deployed to filter spamming servers.

for spam, what about things like spamassassin?  or other spam-filtering
tools?  of course, using iptables means you can stop that stuff much
sooner at the network level.  so here's a couple of thoughts:

1) if you really have this kind of filtering need, consider getting
   a separate hardware filter to do this kind of processing.  no
   matter how cleverly you set up your netfilter rules, it's going
   to cost you processing time.  what you're asking for might just
   be a little overwhelming to ask of iptables.  might be time to
   check into a custom box that can handle tens of thousands of rules
   so your system doesn't have to deal with it.

2) if you're really determined to use iptables, consider building a
   bunch of user-defined chains to create a tree structure for the
   rules to speed up processing.  as far as i can tell, you can do
   this:

   # iptables -N network1
   # iptables -N network2
   # iptables -N network3
   ...

   # iptables -A INPUT -s 1.0.0.0/8 -j network1
   # iptables -A INPUT -s 2.0.0.0/8 -j network2
   ...

   you'd then add to the user-defined chain network1 all rules for
   filtering from source addresses on the 1.0.0.0 class A network.
   (this is just a hypothetical example, of course.)  and just keep
   going.

   if you want to be really clever, write a script of some kind that
   reads, in a simple format, all the filtering you want to do, and
   dynamically builds a nicely-balanced B-tree or something so that
   you have the optimal tree structure, and rebuild the filtering
   rules whenever your filtering needs change.

anyway, i'm just getting the hang of iptables at the moment, so this
might all be just idiotic advice.  you get what you pay for. :-)

rday


