From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: can't patch with patch-o-matic
Date: Tue, 18 Feb 2003 21:01:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218210113.21d55422.arnt@c2i.net>
References: <E131E9F1848D0148813EAF06A846608FD7783B@w2ks-e2k.iconos.be>
	<20030218153758.6e6d806a.arnt@c2i.net>
	<1045583134.18515.159.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045583134.18515.159.camel@tux.rsn.bth.se>
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
To: netfilter@lists.netfilter.org

On 18 Feb 2003 16:45:35 +0100, Martin Josefsson 
<gandalf@wlug.westbo.se> posted, and _mailed_too_, in 
message: <1045583134.18515.159.camel@tux.rsn.bth.se>:

> On Tue, 2003-02-18 at 15:37, Arnt Karlsen wrote:
> 
> > > Patch-o-matic is cool in that it handles a lot of this
> > > stuff without problems, but if you are applying too many patches
> > > on top of each other, you should resolve any conflicts yourself...
> > 
> > ..this attitude is not good enough.  As a minimum, all the base
> > patches should make it into "my" patched kernel, starting from a
> > _clean_ Linus tree.  The extras etc, should stop and warn that
> > "this" patch does not"allow" etc "that" patch, "so, you need to
> > choose which you want".  
> 
> This attitude is perfectly fine, if you don't like it, start running
> an OS you can't modify. You find this attitude _everywhere_ in the

..we disagree.  Now, note I said "my" etc.  This attitude has the
wee problem it makes patch testing a little harder for the newbies,
because the newbies never learns how they can report back new 
failures, which the attitude guys hasn't been been smart enough to
prevent.  This again has ramifications on development.  Your call.

> Linux community. If you want to be able to do more advanced stuff you
> will have to actually learn how to do parts of it yourself.

..noted.  ;-)

> I can tell you that patch-o-matic already does a lot of things to help
> you apply all these patches. With regular patch files you would have
> to fix a lot by hand.

..this far, I have learned "regular patching" may be slower, but less
trouble.

> Base patches go in without any problems here, it's some of the extra
> stuff that's the problem.

..agreed, I've also seen a few base patches fail on Red Hat trees.
 
> If you want that kind of dependency system you will have to fix it
> yourself, I don't think any of the developers are interested in
> building it.

..I'll consider it next time I have a good slack in my schedule.
 
> > ..preferably, patch-o-matic should also work as good with Red Hat
> > kernels, up to and including "base", as Red Hat and its derivatives 
> > are the entry level distros.  From "extra and up", work from the 
> > vanilla kernel trees.  
> 
> This you would definately have to fix yourself. Do you have any idea
> what vendor kernels include? They include several hundred patches.

..possibly, chk any kernel source srpm. 

> > ..and, I'd like to have Patch-o-matic log what it does, to a file, 
> > either as the default, or as a suggestion on how to do it from the 
> > cli, in a readme, as you see, people come here to learn.
> 
> We live in a do it yourself world, you can't rely on other people
> building the stuff you want. If you want to see it built you will
> probably have to build it yourself.

..agreed.  Meanwhile, the Patch-o-matic readme might be made more 
useful for newbies after including a pointer to these wee '2>&1 >' 
tricks in, say, the abs-guide, unless it hurts someone attitude 
toe or something.  Newbies who use patch-o-matic are smart enough 
to read and be made useful testing stuff for development.

> If you modify patch-o-matic to do this stuff we will review the
> changes and either accept (possibly after some modifications) or
> reject them.
> 

..ok.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


