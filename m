From: Kirk Reiser <kirk@braille.uwo.ca>
Subject: Re: netfiltering and ethernet bridging doesn't appear to work as
 advertised, help!
Date: Wed, 21 Jan 2004 11:34:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <x7r7xt9s5r.fsf@speech.braille.uwo.ca>
References: <7A3B4AA360FDEF448F3390421FC8D731014BE786@coxhpexg.coxhp.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731014BE786@coxhpexg.coxhp.com> (bmcdowell@coxhealthplans.com's
 message of "Wed, 21 Jan 2004 08:55:15 -0600")
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
To: bmcdowell@coxhealthplans.com
Cc: netfilter@lists.netfilter.org

<bmcdowell@coxhealthplans.com> writes:

> I can attest that it does work.  Hang in there.

Good! that means it's a documentation misunderstanding thank you.

> As for patching, it is my understanding that the statement about 'newer
> kernels' is only half right.  You do not need to patch your kernel to
> add bridging functionality (just enable it in the menu).  You DO need to
> patch it if you want to use netfilter to filter said bridge traffic.  I
> use this patch:
> http://bridge.sourceforge.net/devel/bridge-nf/bridge-nf-0.0.7-against-2.
> 4.19.diff

Right and on 2.4.24 for the bennefit of anyone else reading
net/core/skbuff.c and include/linux/skbuff.h the patches fail and need
to be patched by hand.  The structure physin_dev also needs to be
added to the .h file because it isn't there in the diff.

> To clarify a tad on the chains, INPUT and OUTPUT refer to traffic for
> and from the firewall itself.  FORWARD refers to traffic crossing the
> firewall.  These are two separate things and the rules do not effect
> chains they aren't applied to.  For example, your rule...

I'm having a bit of trouble with this statement because to me it
doesn't seem to make sense without the notion of the interface cards.
If eth0 is our interface to the net and eth1 our interface to the lan
then input to an interface makes sense because input to eth0 means one
set of rules while input to eth1 means a totally separate set.  When
you are talking about a virtual interface such as br0 how do input and
output relate?  Is input meaning packets entering both real interfaces
eth0 and eth1 or does input mean to the virtual device br0.  If the
latter what direction is input verses output, the order you add the
NICs?  I don't see how this can be.

> ...needs a FORWARD counterpart (if you also want that behavior on
> traffic crossing the firewall):
>
> 	iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
> ACCEPT -v

Auh, right.  I missed that point.

> Also your policy on FORWARD is accept.  Your post didn't show any
> FORWARD drop rules, so if traffic is passing right through the firewall
> with these rules, well, it's working correctly.  On the other hand, if
> you switch them all to FORWARD then there is no filtering on traffic to
> the firewall.

My whole problem with this stuff is I get predictable results on the
connections to the firewall box but not across it to the lan or
external net.  Which will probably clear up once I have this
interface/input/output point straight in my mind.

> Hope that helps.

A greate deal so far thank you once again.

  Kirk



