From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: recently confused about setting a chain policy
Date: Tue, 29 Oct 2002 19:29:13 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210291846470.18730-100000@localhost.localdomain>
References: <20021029231256.RWXD18329.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021029231256.RWXD18329.mta06-svc.ntlworld.com@there>
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

On Tue, 29 Oct 2002, Antony Stone wrote:

> On Tuesday 29 October 2002 10:37 pm, Robert P. J. Day wrote:
> 
> > for the longest time, i always thought that, to set a global,
> > total DROP policy as a starting point, i just had to:
> >
> >   # iptables -P INPUT DROP
> >   # iptables -P OUTPUT DROP
> >   # iptables -P FORWARD DROP
> 
> That is correct.   These policies, so long as you have no rules, will block 
> everything into, out of, and through the machine.
> 
> > but i just looked at the "panic" clause in the case statement in
> > /etc/init.d/iptables and i'm a bit confused.
> 
> I'm not surprised.   Where does this script come from ?
> 
> >   panic)
> > 	echo -n $"Changing target policies to DROP: "
> > 	iftable filter -P INPUT DROP && \
> > 	    iftable filter -P FORWARD DROP && \
> > 	    iftable filter -P OUTPUT DROP && \
> > 	    iftable nat -P PREROUTING DROP && \
> > 	    iftable nat -P POSTROUTING DROP && \
> > 	    iftable nat -P OUTPUT DROP && \
> > 	    iftable mangle -P PREROUTING DROP && \
> > 	    iftable mangle -P OUTPUT DROP && \
> > 	    success $"Changing target policies to DROP" || \
> > 	    failure $"Changing target policies to DROP"
> > 	echo
> >
> > first, the above suggests that a policy is assigned, not just
> > to a chain, but to a chain/table combination, which comes as a
> > surprise to me.
> 
> That is correct.   If you do not specify -t nat or -t mangle then the default 
> is to apply rules (and policies) to -t filter, however you can (if you like 
> living dangerously) set a default policy other than ACCEPT on a mangle table 
> or a nat table.

ok, based on antony's response, there's a *bunch* of things i want
to make sure i understand:

1) i know that, for most "iptables" commands, if you don't specify a
   table, the "filter" table is the default.  i didn't realize that
   this also referred to setting a policy as well.  although, when
   you think about it, since policies are used predominantly for 
   the filter table chains, it's not surprising you never see them
   being used for any of the other tables.

2) what other policy targets can i set for the filter table chains?
   sure, everyone uses DROP or ACCEPT, but is it legal (or even
   meaningful) to set another target?  can i do

   # iptables -P INPUT REJECT

   since REJECT is a valid filtering target?  and if i can, can i
   add "--reject-with" on the end of that?  or LOG?

3) how is it even meaningful to have a policy of DROP on a chain
   in the nat or mangle table?  doesn't this imply that DROP is
   a valid target for a nat or mangle table rule?  i was not aware
   that you could even *have* a target of DROP on a nat rule.
   what does that mean?

anyway, time to go back to being confused.

rday



