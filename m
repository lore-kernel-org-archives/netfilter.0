From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: can't patch with patch-o-matic
Date: Fri, 21 Feb 2003 16:38:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302211638.43076.fabrice@netfilter.org>
References: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be> <1045583134.18515.159.camel@tux.rsn.bth.se> <20030218210113.21d55422.arnt@c2i.net>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030218210113.21d55422.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org


Hello,

On Wednesday 19 February 2003 04:01, Arnt Karlsen wrote:
> > [...]
> ..we disagree.  Now, note I said "my" etc.  This attitude has the
> wee problem it makes patch testing a little harder for the newbies,
> because the newbies never learns how they can report back new
> failures, which the attitude guys hasn't been been smart enough to
> prevent.  This again has ramifications on development.  Your call.

Don't get us wrong, but I thought we wrote already _a lot_ of documentation
that help people go through the installation of patches from patch-o-matic.

For instance, you have a README files distributed with patch-o-matic,
you have the excelent iptables tutorial written by Oskar Andreasson and contributors,
you have the netfilter-extensions-HOWTO on netfilter web site in the documentation
part, there are probably other documents, and of course, you have the source code ! :)

We don't mean to discourage newbies at all. hey, everybody started a newbie. I just
wish sometimes they would try harder before complaining. As Martin explained, patch-o-matic
makes it as easy as it can get to apply patches. We can hardly do better.
Finally (but please don't be discouraged nor offensed, that the way to learn), tcp-window-tracking
is not really for newbies as half of the patches in extra/,
you most probably don't need that if you just toy around. Instead, I recommend you to
work with patches in base/ as they are easier to deal with.

> > [...]
> > We live in a do it yourself world, you can't rely on other people
> > building the stuff you want. If you want to see it built you will
> > probably have to build it yourself.
> ..agreed.  Meanwhile, the Patch-o-matic readme might be made more
> useful for newbies after including a pointer to these wee '2>&1 >'
> tricks in, say, the abs-guide, unless it hurts someone attitude
> toe or something.  Newbies who use patch-o-matic are smart enough
> to read and be made useful testing stuff for development.

As I said earlier, I believe there's plenty of docs on p-o-m out there.
But of course, if any of them if not complete enough, patches to the
documentation are welcome :)

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

