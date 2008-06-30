From: Patrick McHardy <kaber@trash.net>
Subject: Re: POM Xtables???
Date: Mon, 30 Jun 2008 18:20:58 +0200
Message-ID: <486907EA.60105@trash.net>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>	 <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>	 <4866F152.7030109@riverviewtech.net> <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave <finalglide@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Dave wrote:
> Over the weekend I managed to get the Xtables-addons working with
> Kernel 2.6.25.  Throughout this process many questions have come up
> that were unanswered by the documentation or Netfilter site.  I'll
> point them out.
> 
> 1) Confusion on just what Xtables is.  Is Xtables really just
> Iptables?  It seems to be, but there is nothing saying so officially.

x_tables is the common core behind ip_tables, ip6_tables and
arp_tables.

> 3) Still don't know where Xtables-addons fits in with Netfilter?  Why
> is Xtables not on the Netfilter site or even mentioned there at all?
> What does the core Netfilter team think of Xtables-addons?

I have no opinion about this except that already mentioned by
Jan: useful patches in proper state should be upstream, all
others I don't care about.

> 4) How does one patch for ACCOUNT and IPSET?  I couldn't find any
> modules for Xtables-addons to patch for these extensions, although I
> did find mention of a xt_account extension, but couldn't find any
> download or anyway to add it to addons.  I had to patch ACCOUNT and
> IPSET with Patch-O-Matic.  It seems we really have to use both these
> patchers to get everything.

ipset is an exception as its the only patch maintained by
someone from the Core Team that has not been merged upstream
yet. As such it shouldn't be included in Jan's package since
Jozsef is doing official releases in pom.

> 6) Currently the extensions and patching systems seems to be a
> hodge-podge of items, all with different web sites, maintainers and
> writers, from a newbie perspective it's confusing, would be nice if it
> was wrapped up into something more straitforward. Hopefully this is
> what Xtables-addons is doing, BUT would be really nice if this all
> started officially at Netfilter.org.

Short answer - don't do it, the module provided by the kernel
should be enough for 99.99% of all cases. If it isn't, convince
us to merge the patch, which usually isn't very hard.

History has repeatedly shown that out of tree patches are buggy
and cause more problems than they solve, which is why there
is no interest from the netfilter team in maintaining external
patches (with the one exception of ipset, which is not considered
ready for upstream yet by Jozsef, its author).

