From: "Jonathan" <jonathan@jonathan.abda.net>
Subject: Re: ways to lookup or query rules?
Date: Tue, 5 Oct 2004 22:27:58 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <001b01c4ab5c$df6c8ab0$2001a8c0@mantis>
References: <20041006033804.67518.qmail@web50903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Thanks for the tip Jinsuk.  That will save me some time messing around with
things.
It'll be unfortunately crude (especially in a script that is to be run every
minute), but it'll have to do.

Maybe queries/lookups are something for the future development of iptables?
It may not seem like something useful right now, but I bet once people had
the option,
they'd wonder how they lived without it.

(or as an old friend said, "it's kind of like a labotomy:  once you've had
one *you don't know how you
ever lived without it*")

Jonathan

----- Original Message ----- 
From: "J Kim" <jindor@yahoo.com>
To: "Jonathan" <jonathan@jonathan.abda.net>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, October 05, 2004 9:38 PM
Subject: Re: ways to lookup or query rules?


> Well, as far as I know there's no facility for lookup or query. I would
take
> the same approach as you do. One slight improvement is use iptables-save
> instead of -l option. The output of the former command looks better in
that its
> format is much closer to what you key in.
>
> Personally I put another layer between my code and iptables so that all
the
> iptables-related commands will go through it, letting it take care of the
> chores.
>
> Jinsuk Kim
>
> --- Jonathan <jonathan@jonathan.abda.net> wrote:
>
> > Hi, if this is a classic case of RTFM go ahead and shoot me.
> >
> > Is there an option or a command to look up rules in your iptables,
> > especially if there's the ability to search by rulenumber or some
> > kind of key?
> >
> > The only solution I've seen so far, is to use the -l option, capture the
> > output, and then process it, but that's a very dirty solution.
> > I'm writing a script that needs to update the iptables automatically,
and I
> > assume it needs to know whether ot use the add or update
> > option by verifying whether a rule exists, in order to decide whether to
> > update the rule, or add a new one.
> >
> > Jonathan
> >
> >
> >
>
>
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>


