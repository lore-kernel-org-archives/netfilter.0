From: Phil Howard <phil-netfilter@ipal.net>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 17:05:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013170550.A16894@hamal.ipal.net>
References: <20021013095628.D15824@hamal.ipal.net> <Pine.LNX.4.44.0210131215410.17397-100000@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210131215410.17397-100000@localhost.localdomain>; from rpjday@mindspring.com on Sun, Oct 13, 2002 at 12:25:50PM -0400
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sun, Oct 13, 2002 at 12:25:50PM -0400, Robert P. J. Day wrote:

| On Sun, 13 Oct 2002, Phil Howard wrote:
| 
| > The initial inspiration is for filtering spam.  But I can see other
| > uses, and am looking at this for broader re-usable purposes which
| > would be initially deployed to filter spamming servers.
| 
| for spam, what about things like spamassassin?  or other spam-filtering
| tools?  of course, using iptables means you can stop that stuff much
| sooner at the network level.  so here's a couple of thoughts:

I already reject mail during the SMTP transaction.  Accepting it and
running through spamassassin after delivery would just be a greater
level of load.  I'm trying to reduce it.

| 
| 1) if you really have this kind of filtering need, consider getting
|    a separate hardware filter to do this kind of processing.  no
|    matter how cleverly you set up your netfilter rules, it's going
|    to cost you processing time.  what you're asking for might just
|    be a little overwhelming to ask of iptables.  might be time to
|    check into a custom box that can handle tens of thousands of rules
|    so your system doesn't have to deal with it.

If each packet did a lookup into a tree object of some sort based on the
source address, and possibly discarded, that should reduce the processing.
The challenge is finding the method.  Maybe the policy routing will do
this, but from its skimpy documentation (I don't know if I have found it
all, yet) it also looks like it is doing a linear search.


| 2) if you're really determined to use iptables, consider building a
|    bunch of user-defined chains to create a tree structure for the
|    rules to speed up processing.  as far as i can tell, you can do
|    this:
| 
|    # iptables -N network1
|    # iptables -N network2
|    # iptables -N network3
|    ...
| 
|    # iptables -A INPUT -s 1.0.0.0/8 -j network1
|    # iptables -A INPUT -s 2.0.0.0/8 -j network2
|    ...
| 
|    you'd then add to the user-defined chain network1 all rules for
|    filtering from source addresses on the 1.0.0.0 class A network.
|    (this is just a hypothetical example, of course.)  and just keep
|    going.
| 
|    if you want to be really clever, write a script of some kind that
|    reads, in a simple format, all the filtering you want to do, and
|    dynamically builds a nicely-balanced B-tree or something so that
|    you have the optimal tree structure, and rebuild the filtering
|    rules whenever your filtering needs change.

That certainly looks like it could do it with a lower level of processing.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://ka9wgn.ham.org/    |
-----------------------------------------------------------------

