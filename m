From: "Fred Trotter" <fred.trotter@gmail.com>
Subject: Re: Time module included in the default Fedora
Date: Wed, 11 Apr 2007 12:15:34 -0500
Message-ID: <b317600c0704111015u486e55f4qd6d8974a3c730c8e@mail.gmail.com>
References: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>
	<b317600c0704110752g2f9a82a1x8b18adaae15f775e@mail.gmail.com>
	<1165438164.4846.3.camel@localhost.localdomain>
	<Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
	<461D0DD7.7050408@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=DKfd9MJvkd87mE5+O/PTZWYis/CxUUDfLZGsdjzBjghc/c/Og6jA6pib5P+mQoDzmnND/Y8cvs8z/E5kjOe4s99AY0JzA7ReVyioB7nAisWgA5Mq5FQGnFeZyzHUr8xYtVyDo3Ma3UsxXyGRBbylA35KfeqpwHTsThWgvC+RoEA=
In-Reply-To: <461D0DD7.7050408@trash.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks for the answers!

      A loong time ago, I might have had the time and energy to hack
this together myself. I think this is an important enough
functionality that barring a better solution I might look into doing
this myself. If I did decide to pursue contributing a patch, can
someone provide some links for me to make a stepwise process of what
needs to be done? if the answer is RTFM on this question thats fine,
but I would love to limit what I have to investigate to get this done.

       Alternatlively I am also willing to put my money where my mouth
is. If someone thinks this work is easy enough to be worth $300 I
would be glad to paypal that amount to someone in exchange for an
accepted patch. If someone can ligitimately explain why that is way
too little money, then I would be glad to start a bounty with that
amount on one of the several bounty sites and start yelling for more
money off-list. I would love some comments on what a "reasonable" cost
would be to get a good patch for this.

          Obviously the best patch would be something that takes
advantage of sys_tz (which I assume helps with daylight savings and
timezones) and that, if possible, would speed things up to be more
tolerable. But frankly, I have no idea what would be involved with
that, so my only real requirement would be "accepted". If Patrick
could give some hints about what would be required for acceptance that
would help. (Feel free to drop a link to a previous dicussion on this
subject...)

Thanks again,
Fred Trotter



On 4/11/07, Patrick McHardy <kaber@trash.net> wrote:
> Jan Engelhardt wrote:
> > On Apr 11 2007 09:52, Fred Trotter wrote:
> >
> >>      I was told to write here about getting the time module
> >>included "upstream". I hope that someone here might be able  to
> >>educate me on the process for getting these things done. I understand
> >>that there are many iptables modules and that some are included by
> >>default while others are not.
>
>
> The question whether to merge the time module came up repeatedely
> at netfilter workshops, but it was always decided against it so far,
> mainly because it apparently can't deal with timezones and daylight
> saving time. IIRC Harald had strong feelings about it, I personally
> don't care much about this shortcoming as long as its documented.
> I'm not even sure its correct since the kernel has sys_tz. So if
> anyone finds out and submits a patch, I'll consider it.
>
> > There are only a few cases why a maintainer decides against:
> >   (1) it's a hack (best example: ipt_ROUTE)
> >   (2) it's unmaintained (now that's strange)
> >   (3) violates coding style (happens often)
> >   (4) not enough interest on the users' sides (gotta change that)
> >
> > Ask nicely (see [1],[2]), and maybe things get rolling (or not).
> >
> > [1] http://archives.free.net.ph/message/20061206.204842.c1c8628a.en.html
> > [2] http://archives.free.net.ph/message/20061207.030828.0d81b372.en.html
> >
> > Though that leaves me puzzled why connlimit has not gone in yet
> > (it all simplifies maintenance so much IMO). BTW, how about it?
>
>
> As I stated multiple times, the reason why its not included is that
> its horribly slow. But since I don't see any better way to do this
> and I know quite a few people are using this, I would consider this
> as well if someone sends me a patch, which has not happened so far.
>
> >>      The problem is that the iptables userspace project documents
> >>the time modules as though it is included, but at least in Fedora it
> >>is not by default. They hold that they will not include it until it is
> >>included "upstream", they indicated that you would be able to tell me
> >>how to get it included "upstream".
> >
> >
> > iptables is not the same as netfilter (= the kernel part). This is
> > perhaps the biggest mystery. Why include something in iptables when
> > it is not in the kernel.
>
>
> It has been done in the past, but I deleted everything not included
> upstream from iptables, mainly to avoid compatibilty breakage in
> case we decide to merge something and the userspace API needs to
> be changed (a lot of the old matches have 32/64 bit issues etc.)
>


-- 
Fred Trotter
http://www.fredtrotter.com

