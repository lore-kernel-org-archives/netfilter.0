From: Kevin Dwyer <Kevin.Dwyer@algx.net>
Subject: Re: inner workings of IP tables
Date: Mon, 30 Sep 2002 09:21:35 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0209300905060.19596-100000@klepto.security.algx.lan>
References: <3D97C228.6030602@vk.crocodile.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D97C228.6030602@vk.crocodile.org>
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
To: Vadim Kurland <vadim@vk.crocodile.org>
Cc: netfilter@lists.netfilter.org

Hi Vadim ;)

On Sun, 29 Sep 2002, Vadim Kurland transmitted the following:

> Kevin Dwyer wrote:
>
> >>At least with a CLI you're in full control, even if you need to learn
> >>a bit more syntax before you start typing.
> >>
> >>
> >
> >Precisely.
> >This is seen as a drawback to some people, because you are given the gun
> >with which to shoot yourself in the foot.  However, I'd prefer to have a
> >competent firewall admin over a point-and-click lemming.

Just wanted to say that I should have said "point-and-click CP lemming,"
as I think fwbuilder is really a fine piece of code, or else I probably
wouldn't have submitted any patches.  ;)

> I would like to assert that in the case of CLI we are just as like in
> the mercy of a vendor who may or may not implement interfaces to certain
> features of underlying software.

I think you're right, with the exception that the CLI in question here is
usually a shell (unless someone has built their own thing on top of it --
I'm only referring to netfilter as it is distributed freely) and usually
has a text editor available, which gives you the means to adequately
modify any ruleset without needing a graphical workstation, given you are
familiar with typical unix commands (which you ought to be if you are
going to be administering a netfilter firewall).

In fact, one of the great thing about tools like fwbuilder is that it
spits out comprehensible text, which can be edited in a pinch.

So if you do use a GUI like fwbuilder for generating rules, you get the
advantage of a visibly clear ruleset and damage control when you're
partying in Hawai'i but the boss calls unexpectedly saying they need a
special quick fix change implemented.  This is not the case with the CP
GUI, as experience has shown.  It's the _option_ that I find most
appealing, I suppose.


> Cluefullness of firewall administrator has almost nothing to do with a
> type of user interface firewall he prefers to use. Like we never saw
> wrong firewall configurations done in iptables, or in ipfilter, or PIX
> using their CLI. In the end, what matters is how much time one needs to
> spend building rules and verifying them, and what is the proprability of
> an error still slipping through. Anything that can help reduce this
> probablility is useful, even if it is a GUI.

Again, I didn't mean to, though I certainly did, imply that GUI user ==
dumb user.  I think there are GUIs that make dumb users, however.



/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */



