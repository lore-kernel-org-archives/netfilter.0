From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: can't patch with patch-o-matic
Date: 18 Feb 2003 16:45:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045583134.18515.159.camel@tux.rsn.bth.se>
References: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>
	 <20030218153758.6e6d806a.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030218153758.6e6d806a.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-02-18 at 15:37, Arnt Karlsen wrote:

> > Patch-o-matic is cool in that it handles a lot of this
> > stuff without problems, but if you are applying too many patches
> > on top of each other, you should resolve any conflicts yourself...
> 
> ..this attitude is not good enough.  As a minimum, all the base patches
> should make it into "my" patched kernel, starting from a _clean_ Linus
> tree.  The extras etc, should stop and warn that "this" patch does not
> "allow" etc "that" patch, "so, you need to choose which you want".  

This attitude is perfectly fine, if you don't like it, start running an
OS you can't modify. You find this attitude _everywhere_ in the Linux
community. If you want to be able to do more advanced stuff you will
have to actually learn how to do parts of it yourself.
I can tell you that patch-o-matic already does a lot of things to help
you apply all these patches. With regular patch files you would have to
fix a lot by hand.

Base patches go in without any problems here, it's some of the extra
stuff that's the problem.

If you want that kind of dependency system you will have to fix it
yourself, I don't think any of the developers are interested in building
it.

> ..preferably, patch-o-matic should also work as good with Red Hat
> kernels, up to and including "base", as Red Hat and its derivatives 
> are the entry level distros.  From "extra and up", work from the 
> vanilla kernel trees.  

This you would definately have to fix yourself. Do you have any idea
what vendor kernels include? They include several hundred patches.

> ..and, I'd like to have Patch-o-matic log what it does, to a file, 
> either as the default, or as a suggestion on how to do it from the 
> cli, in a readme, as you see, people come here to learn.

We live in a do it yourself world, you can't rely on other people
building the stuff you want. If you want to see it built you will
probably have to build it yourself.

If you modify patch-o-matic to do this stuff we will review the changes
and either accept (possibly after some modifications) or reject them.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat you with experience.

